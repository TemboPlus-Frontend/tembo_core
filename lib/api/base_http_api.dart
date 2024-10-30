import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' show debugPrint;
import 'package:tembo_core/tembo_core.dart';
import 'package:uuid/uuid.dart';

typedef StatusCodeHandler = void Function(int statusCode);

typedef ResponseHandler<T> = T Function(int statusCode, dynamic body);

typedef Headers = Map<String, String>;

abstract class BaseHTTPAPI {
  final String root;
  final String? mainEndpoint;
  BaseHTTPAPI(this.root, [this.mainEndpoint]);

  void Function()? _unauthorizedCallback;

  String get url => mainEndpoint == null ? root : "$root/$mainEndpoint";

  Uri getUri(String endpoint) {
    if (endpoint.trim().isEmpty) return Uri.parse(url);
    return Uri.parse("$url/$endpoint");
  }

  static const _constantHeaders = <String, String>{
    "content-type": "application/json",
    "accept": "application/json",
    "Access-Control-Allow-Origin": "*",
  };

  String getCurrentDateISOString() => DateTime.now().toUtc().toIso8601String();

  /// Calling all authenticated endpoints successfully will need 'x-request-id' and 'token'
  /// keys in the request header. Some endpoints (mostly Fantuzzi related) will require
  /// Authorization parameter to be passed
  ///
  /// 'x-request-id' will be generated randomly in every request.
  /// 'token' will be saved as soon as the user is authenticated successfully. The class
  /// that will handle authentication logic will need to extend [BaseHTTPAPI] to call
  /// [updateToken] method, which will store the token in the local storage. It will then
  /// be fetched from the local storage in all future requests.
  Map<String, String> get baseHeaders {
    final h = Map<String, String>.from(_constantHeaders);

    final apiToken = TokenAPI.instance.getToken(TokenType.token);
    if (apiToken != null) h.addAll({"token": apiToken});

    final bToken = TokenAPI.instance.getToken(TokenType.bearer);
    if (bToken != null) h.addAll({"Authorization": "Bearer $bToken"});

    h.addAll({"x-request-id": (const Uuid()).v4()});
    return h;
  }

  /// [callback] to be called when status code returned == 404.
  ///
  /// For example, log out the user and take the user to the splash page
  void registerUnauthorizedCallback(void Function() callback) {
    _unauthorizedCallback = callback;
  }

  /// Performs a GET request
  Future<T> get<T>(
    String endpoint, {
    String? params,
    StatusCodeHandler? statusCodeHandler,
    Headers? headers,

    /// some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  }) async {
    var url = getUri(endpoint);
    if (params?.trim().isNotEmpty ?? false) {
      url = url.updateQueryParameters(params!);
    }
    final response = await http.get(
      url,
      headers: _handleHeaders(headers),
    );
    return getResult(response, null, statusCodeHandler, checkBody);
  }

  /// Performs a POST request
  Future<T> post<T>(
    String endpoint, {
    String? body,
    StatusCodeHandler? statusCodeHandler,
    ResponseHandler<T>? responseHandler,
    Headers? headers,
    String? params,

    /// some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  }) async {
    var url = getUri(endpoint);
    if (params?.trim().isNotEmpty ?? false) {
      url = url.updateQueryParameters(params!);
    }

    final response = await http.post(
      url,
      body: body,
      headers: _handleHeaders(headers),
    );

    if (responseHandler != null) {
      return responseHandler(response.statusCode, jsonDecode(response.body));
    }
    return getResult(response, body, statusCodeHandler, checkBody);
  }

  /// Performs a PUT request
  Future<T> put<T>(
    String endpoint,
    String body, {
    StatusCodeHandler? statusCodeHandler,
    Headers? headers,
  }) async {
    final response = await http.put(
      getUri(endpoint),
      body: body,
      headers: _handleHeaders(headers),
    );
    return getResult(response, body, statusCodeHandler);
  }

  /// Performs a PATCH request
  Future<T> patch<T>(
    String endpoint,
    String body, [
    StatusCodeHandler? statusCodeHandler,
    Headers? headers,

    /// some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  ]) async {
    final response = await http.patch(
      getUri(endpoint),
      body: body,
      headers: _handleHeaders(headers),
    );
    return getResult(response, body, statusCodeHandler, checkBody);
  }

  dynamic getResult(
    http.Response response, [
    dynamic requestBody,
    StatusCodeHandler? statusCodeHandler,

    // some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  ]) {
    debugPrint(response.stringRep(requestBody));

    if (_unauthorizedCallback != null && response.statusCode == 401) {
      _unauthorizedCallback!();
      return;
    }

    if (statusCodeHandler != null) statusCodeHandler(response.statusCode);
    if (!checkBody) return;

    final body = jsonDecode(response.body);
    if (body is Map) {
      final error = body["error"];
      final details = body["details"];
      if (error != null && details != null) {
        if (details is Map) {
          final data = Map.from(details);
          final message = data.entries.first.value;
          throw Message(enMessage: message, swMessage: message);
        }
      }

      return body;
    }
    if (body is List) return List<MapSD>.from(body);
    return body;
  }

  Map<String, String> _handleHeaders(Headers? value) {
    final h = value == null ? baseHeaders : mergeHeaders(value);
    return h;
  }

  Map<String, String> mergeHeaders(Map<String, String> other) {
    final h = Map<String, String>.from(baseHeaders);
    final v = Map<String, String>.from(other);
    final result = v..addAll(h);
    return result;
  }
}

extension ResponseExtension on http.Response {
  String stringRep([dynamic requestBody]) {
    return """
    Request:
      url: ${request?.url}
      method: ${request?.method}
      x-request-id: ${request?.headers['x-request-id']}
      Authorization: ${request?.headers['Authorization']}
      token: ${request?.headers['token']}
      
      body: $requestBody

    Response:
      statusCode: $statusCode
      body: $body
""";
  }
}

class AppHTTPOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

extension on Uri {
  Uri updateQueryParameters(String query) {
    return Uri(
      host: host,
      scheme: scheme,
      port: port,
      userInfo: userInfo,
      path: path,
      pathSegments: null,
      fragment: fragment,
      query: query,
      queryParameters: null,
    );
  }
}

extension IntExt on int {
  bool get success => this == 200 || this == 201;
}

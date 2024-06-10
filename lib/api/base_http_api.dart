import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' show debugPrint;
import 'package:tembo_core/tembo_core.dart';
import 'package:uuid/uuid.dart';

typedef StatusCodeHandler = void Function(int statusCode);

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

  static const _baseHeaders = <String, String>{
    "content-type": "application/json",
    "accept": "application/json",
    "Access-Control-Allow-Origin": "*",
  };

  String get apiToken => UserPreferencesAPI.instance.get("api_token") ?? "";

  String getCurrentDateISOString() => DateTime.now().toUtc().toIso8601String();

  Map<String, String> get headers {
    final h = Map<String, String>.from(_baseHeaders);

    final token = UserPreferencesAPI.instance.get("api_token");
    if (token != null) h.addAll({"token": token!});

    h.addAll({"x-request-id": (const Uuid()).v4()});
    return h;
  }

  Map<String, String> _handleHeaders(Headers? value) {
    final h = value == null ? headers : mergeHeaders(value);
    return h;
  }

  Map<String, String> mergeHeaders(Map<String, String> value) {
    final h = Map<String, String>.from(headers);
    final v = Map<String, String>.from(value);
    final result = v..addAll(h);
    return result;
  }

  Future updateToken(String value) async {
    await UserPreferencesAPI.instance.put("api_token", value);
  }

  Future deleteToken() async {
    await UserPreferencesAPI.instance.delete("api_token");
  }

  void registerUnauthorizedCallback(void Function() callback) {
    _unauthorizedCallback = callback;
  }

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

  Future<T> post<T>(
    String endpoint, {
    String? body,
    StatusCodeHandler? statusCodeHandler,
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
    return getResult(response, body, statusCodeHandler, checkBody);
  }

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
}

extension ResponseExtension on http.Response {
  String stringRep([dynamic requestBody]) {
    return """
    Request:
      url: ${request?.url}
      method: ${request?.method}
      x-request-id: ${request?.headers['x-request-id']}
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

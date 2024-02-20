import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' show debugPrint;
import 'package:tembo_core/api/user_preferences_api.dart';

import '../constants/typedefs.dart';

typedef StatusCodeHandler = void Function(int statusCode);

abstract class BaseHTTPAPI {
  final String root;
  final String? mainEndpoint;
  const BaseHTTPAPI(this.root, [this.mainEndpoint]);

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

  Map<String, String> get headers {
    final h = Map<String, String>.from(_baseHeaders);

    final token = UserPreferencesAPI.instance.get("api_token");
    if (token != null) h.addAll({"token": token!});
    return h;
  }

  Future updateToken(String value) async {
    await UserPreferencesAPI.instance.put("api_token", value);
  }

  Future deleteToken() async {
    await UserPreferencesAPI.instance.delete("api_token");
  }

  Future<T> get<T>(
    String endpoint, {
    String? params,
    StatusCodeHandler? statusCodeHandler,

    /// some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  }) async {
    var url = getUri(endpoint);
    if (params?.trim().isNotEmpty ?? false) {
      url = url.updateQueryParameters(params!);
    }
    final response = await http.get(url, headers: headers);
    return getResult(response, null, statusCodeHandler);
  }

  Future<T> post<T>(
    String endpoint, {
    String? body,
    StatusCodeHandler? statusCodeHandler,
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
      headers: headers,
    );
    return getResult(response, body, statusCodeHandler);
  }

  Future<T> patch<T>(
    String endpoint,
    String body, [
    StatusCodeHandler? statusCodeHandler,

    /// some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  ]) async {
    final response = await http.patch(
      getUri(endpoint),
      body: body,
      headers: headers,
    );
    return getResult(response, body, statusCodeHandler);
  }

  dynamic getResult(
    http.Response response, [
    dynamic requestBody,
    StatusCodeHandler? statusCodeHandler,

    // some apis return empty bodies, so we need to check if the body is empty
    bool checkBody = true,
  ]) {
    debugPrint(response.stringRep(requestBody));

    if (statusCodeHandler != null) statusCodeHandler(response.statusCode);
    if (!checkBody) return;

    final body = jsonDecode(response.body);
    if (body is Map) return body;
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

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/mixins/service_mixin.dart';
import 'package:mobkit_flutter_servicebase/providers/http_provider.dart';

class AlgoritmikServiceBase extends HttpProvider with ServiceMixin {
  Future<T> postMapAsync<T>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding,
      {bool isTest = false}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.post(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> getMapAsync<T>(
      String url, Map<String, String>? headers, Encoding? encoding,
      {bool isTest = false}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.get(uri, headers: headers);
      if (isTest) {
        return compute(handleResponse<T>, resp);
      }
      return handleResponse<T>(resp);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> putMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.put(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> patchMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.patch(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> deleteMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.delete(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  T handleResponse<T>(http.Response resp) {
    if (resp.statusCode == 200) {
      return resp.body == "" ? "" : jsonDecode(resp.body);
    } else {
      throw Exception(
          "statusCode : ${resp.statusCode}- reason ${resp.reasonPhrase} - ${resp.body.toString()}");
    }
  }

  _logErrors(Object ex) {
    logger.logSevere(ex);
  }
}

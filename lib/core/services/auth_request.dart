import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CookieRequest {
  Map<String, String> headers = {};
  Map<String, String> cookies = {};
  final http.Client _client = http.Client();

  late SharedPreferences local;

  bool loggedIn = false;
  bool initialized = false;
  String? username = "";

  Future init(BuildContext context) async {
    if (!initialized) {
      local = await SharedPreferences.getInstance();
      String? savedCookies = local.getString("cookies");
      username = local.getString("username");
      if (savedCookies != null) {
        cookies = Map<String, String>.from(json.decode(savedCookies));
        if (cookies['sessionid'] != null) {
          loggedIn = true;
          headers['cookie'] = _generateCookieHeader();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Successfully logged in. Welcome back!"),
          ));
        }
      }
    }
    initialized = true;
  }

  Future persist(String key, String data) async {
    local.setString(key, data);
  }

  Future delete(String key) async {
    local.remove(key);
  }

  Future clear() async {
    local.clear();
    username = null;
    loggedIn = false;
  }

  Map datajson = {};

  Future<dynamic> login(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    print(data["username"]);
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);

    _updateCookie(response);

    if (response.statusCode == 200) {
      loggedIn = true;
      username = json.decode(json.encode(response.body))["username"];
      persist("username", username!);
      print("sukses");
    } else {
      loggedIn = false;
      print(username);
      print("gagal");
    }
    json.decode(response.body);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future<dynamic> get(String url) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.get(Uri.parse(url), headers: headers);
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      String cookieObject = (const JsonEncoder()).convert(cookies);
      persist("cookies", cookieObject);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      String? newCookie = cookies[key];
      cookie += '$key=$newCookie';
    }

    return cookie;
  }
}

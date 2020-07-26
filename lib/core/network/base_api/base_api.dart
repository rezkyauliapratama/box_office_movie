import 'package:flutter/material.dart';

abstract class BaseApi {
  String _statusMessage;
  bool _success;
  int _statusCode;

  String get statusMessage => _statusMessage;

  bool get success => _success;

  int get statusCode => _statusCode;

  BaseApi(dynamic json)
      : _statusCode = json["status_code"],
        _statusMessage = json["status_message"],
        _success = json["success"];
}

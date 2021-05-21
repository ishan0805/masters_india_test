import 'dart:io';
import 'dart:async';
import 'package:http_parser/http_parser.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masters_india_test/src/utils/api_helper.dart';

import 'gst_repository.dart';

class GstApiProvider implements Source {
  final ApiService apiService;
  GstApiProvider({@required this.apiService});
}

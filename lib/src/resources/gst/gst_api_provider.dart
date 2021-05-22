import 'dart:io';
import 'dart:async';
import 'package:http_parser/http_parser.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masters_india_test/src/models/gst_profile.dart';
import 'package:masters_india_test/src/utils/api_helper.dart';

import 'gst_repository.dart';

class GstApiProvider implements Source {
  final ApiService apiService;
  GstApiProvider({@required this.apiService});
  String test_json =
      '{"name":"Ishan" ,"status":"active", "address":" Kundari Rakabganj ,Lucknow","taxpayerType":"Regular","businessType":"Private Limited","dataRagistration":"20/5/2021"}';
  @override
  GstProfile getGstProfile(String gstin) {
    //api concept use gstin to get data
    return GstProfile.fromJson(test_json);
  }
}

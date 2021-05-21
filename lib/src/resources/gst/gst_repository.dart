import 'package:masters_india_test/src/utils/api_helper.dart';

import 'gst_api_provider.dart';

class GstRepository {
  Source _source = GstApiProvider(apiService: ApiHelper());
  Cache _cache;
}

abstract class Source {}

abstract class Cache {}

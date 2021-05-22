import 'package:masters_india_test/src/models/gst_profile.dart';
import 'package:masters_india_test/src/utils/api_helper.dart';

import 'gst_api_provider.dart';

class GstRepository {
  Source _source = GstApiProvider(apiService: ApiHelper());
  Cache _cache;
  Future<GstProfile> getGstProfile(String gstin) async {
    return await _source.getGstProfile(gstin);
  }
}

abstract class Source {
  GstProfile getGstProfile(String gstin);
}

abstract class Cache {}

import 'package:cultino_agritech/models/cultino_data_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class CultinoRepository {
  //

  late Dio dio;

  CultinoRepository() : dio = Dio();

  final otherMandiApiUrl =
      "https://thekrishi.com/test/mandi?lat=28.44108136&lon=77.0526054&ver=89&lang=hi&crop_id=10 ";

  //
  Future<CultinoDataModel> getOtherMandiApi(
      {bool callFromNetwork = false}) async {
    dio.interceptors.add(DioCacheManager(
      CacheConfig(
        baseUrl: otherMandiApiUrl,
      ),
    ).interceptor);

    final response = await dio.get(otherMandiApiUrl,
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: callFromNetwork,
        ));
    if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
      print("DATA IS COMING FROM CACHE");
    } else {
      print("DATA IS COMING FROM NET");
    }
    final data = Map<String, dynamic>.of(response.data);
    final cultinoData = CultinoDataModel.fromJson(data['data']);

    // cultinoData.otherMandi?.forEach((e) {
    //   print("""
    //   district : ${e?.district}
    //   market : ${e?.market}
    //   state : ${e?.state}

    //   """);
    // });

    return cultinoData;
  }
}

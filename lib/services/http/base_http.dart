import 'package:dio/dio.dart';

import 'package:molteo_books/utils/connection.dart';
import 'package:molteo_books/utils/helpers.dart';

class MbTransformer extends DefaultTransformer {
  MbTransformer() : super(jsonDecodeCallback: parseJson);
}

class MbHttpService {
  Dio http;
  CancelToken cancelToken;

  MbHttpService() {
    cancelToken = new CancelToken();
    http = Dio(
      BaseOptions(
        baseUrl: "https://api.itbook.store/1.0",
        connectTimeout: 1000 * 60,
        receiveTimeout: 1000 * 60,
        headers: {'Accept': "application/json"},
      ),
    )
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions opts) async {
          print({
            "url": "${opts?.baseUrl}${opts?.path}",
            "body": opts?.data,
            "params": opts?.queryParameters,
            "header": opts?.headers
          });
          return opts;
        }, onError: (DioError e) async {
          print({
            "statusCode": e?.response?.statusCode ?? 400,
            "statusMessage": e?.response?.statusMessage,
            "data": e?.response?.data ?? {"message": e?.error ?? e}
          });
          bool result = true;
          try {
            result = await hasConnection();
          } catch (_) {}
          if (!result) {
            return DioError(
              request: e.request,
              response: Response(
                data: {
                  "message":
                      "kindly check your internet connection and try again"
                },
                statusCode: 5000,
                statusMessage: "No Internet Connection",
              ),
            );
          }

          return e;
        }, onResponse: (Response res) {
          print({
            "data": res?.data,
            "statusCode": res?.statusCode,
            "statusMessage": res?.statusMessage,
          });
          return res;
        }),
      )
      ..transformer = MbTransformer();
  }

  void cancelReqs() {
    cancelToken.cancel("Request has been cancelled");
  }

  FormData generateFormData(Map data) {
    return FormData.fromMap(data);
  }
}

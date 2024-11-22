import 'package:get/get.dart';


class ApiProvider extends GetConnect implements GetxService {
  ApiProvider() {
    httpClient.timeout = const Duration(seconds: 20);
  }

  Future<Response<dynamic>> getData(
      String url,
      {String? query, Map<String, String>? headers}) async {
    var response = await get(url+query!, headers: headers ?? {});
    print('first response ${response.body}');
    return response;
  }

  // Future<Response<dynamic>> handleData(url, response) async {
  //   dynamic body;
  //   Response response0;

  
  //   try {
  //     final p = ReceivePort();
  //     body = await Isolate.spawn(
  //         _decodeDataInBackground, [p.sendPort, response.body, jsonDecode]);
  //   } catch (e) {}
  //   if (response.statusCode != 200) {
  //     response0 = Response(
  //       body: {
  //         "status": "0",
  //         "message": "Some Error has occured\n",
  //         "data": {},
  //         "error": "Please try again later"
  //       },
  //       bodyString: "{}",
  //       request: Request(
  //           headers: response.request!.headers,
  //           method: response.request!.method,
  //           url: response.request!.url),
  //       headers: response.headers,
  //       statusCode: response.statusCode,
  //       statusText: response.statusText,
  //     );
  //   } else {
  //     response0 = Response(
  //       body: response.body,
  //       bodyString: response.body.toString(),
  //       request: Request(
  //           headers: response.request!.headers,
  //           method: response.request!.method,
  //           url: response.request!.url),
  //       headers: response.headers,
  //       statusCode: response.statusCode,
  //       statusText: response.statusText,
  //     );
  //   }
  // return response0;
  // }

  // _decodeDataInBackground(List<dynamic> args) {
  //   SendPort responsePort = args[0];
  //   dynamic data = args[1];
  //   dynamic jsonDecodeMethod = args[2];

  //   try {
  //     final decodedData = jsonDecodeMethod(data);
  //     Isolate.exit(responsePort, decodedData);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     Isolate.exit(responsePort, null);
  //   }
  // }

  // _sendDataInBackGround(List<dynamic> args) async {
  //   SendPort responsePort = args[0];
  //   FormData data = args[1];
  //   dynamic func = args[2];
  //   dynamic url = args[3];
  //   dynamic headers = args[4];
  //   try {
  //     Get.log("isolates ");
  //     print(data.fields);
  //     Response response = await post(url, data, headers: headers ?? {});
  //     print("Response in Isolate: ${response.body}");
  //     // responsePort.send(response.body);
  //     Isolate.exit(responsePort, [
  //       response.body,
  //       response.statusCode,
  //       response.request,
  //       response.headers,
  //       response.statusText
  //     ]);
  //   } catch (e) {
  //     Get.log("isolates erroer ");
  //     debugPrint(e.toString());
  //     Isolate.exit(responsePort, null);
  //   }
  // }

  // _putDataInBackGround(List<dynamic> args) async {
  //   SendPort responsePort = args[0];
  //   FormData data = args[1];
  //   dynamic func = args[2];
  //   dynamic url = args[3];
  //   dynamic headers = args[4];
  //   try {
  //     print(data.fields);
  //     Response response = await put(url, data, headers: headers ?? {});
  //     print("Response in Isolate: ${response.body}");
  //     // responsePort.send(response.body);
  //     Isolate.exit(responsePort, [
  //       response.body,
  //       response.statusCode,
  //       response.request,
  //       response.headers,
  //       response.statusText
  //     ]);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     Isolate.exit(responsePort, null);
  //   }
  // }

}

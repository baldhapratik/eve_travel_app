import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:eve_travel_app/repository/network_repository.dart';
import 'package:eve_travel_app/utils/internet_error.dart';
import 'package:eve_travel_app/utils/process_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
// import '../process_indicator.dart';

class NetworkDioHttp {
  static Dio? _dio=Dio();
  static String? endPointUrl;
  static Options? _cacheOptions;
  static DioCacheManager? _dioCacheManager;
  static Circle processIndicator = Circle();
  NetworkCheck networkCheck = NetworkCheck();
  static InternetError internetError = InternetError();
  static final dataStorage = GetStorage();
  static NetworkRepository networkRepository = NetworkRepository();

  static Future<Map<String, String>> getHeaders() async {
    final String? token = dataStorage.read('token');
    log("Token :- ${dataStorage.read('token')}");
    if (token != null) {
      debugPrint(
          '~~~~~~~~~~~~~~~~~~~~ SET HEADER : $token ~~~~~~~~~~~~~~~~~~~');
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': token,
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static setDynamicHeader({@required String? endPoint}) async {
    endPointUrl = endPoint;
    BaseOptions options =
        BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    _dioCacheManager = DioCacheManager(CacheConfig());
    final token = await getHeaders();
    options.headers.addAll(token);
    _dio = Dio(options);
    _dio!.interceptors.add(_dioCacheManager!.interceptor);
  }

  //Get Method
  static Future<Map<String, dynamic>> getDioHttpMethod({
    BuildContext? context,
    required String url,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      // ignore: use_build_context_synchronously
      if (context != null) processIndicator.show(context);
      try {
        debugPrint(url);
        // ignore: unnecessary_string_interpolations
        Response response =
            await _dio!.get(url, options: header ?? _cacheOptions);
        // ignore: prefer_typing_uninitialized_variables
        log(response.toString());
        // ignore: prefer_typing_uninitialized_variables
        var responseBody;
        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(response.data);
          } catch (error) {
            responseBody = response.data;
          }
          Map<String, dynamic> data = {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return data;
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          // ignore: use_build_context_synchronously
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      // ignore: use_build_context_synchronously
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  //Put Method

  static Future<Map<String, dynamic>> putDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      // ignore: use_build_context_synchronously
      if (context != null) processIndicator.show(context);
      try {
        Response response =
            await _dio!.put(url, data: data, options: header ?? _cacheOptions);
        // log(response);
        // ignore: prefer_typing_uninitialized_variables
        var responseBody;
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
            debugPrint('catch...');
          }

          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'body': e.response?.data,
          'headers': null,
          // ignore: use_build_context_synchronously
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      // ignore: use_build_context_synchronously
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //Post Method
  static Future<Map<String, dynamic>> postDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      // ignore: use_build_context_synchronously
      if (context != null) processIndicator.show(context);
      try {
        debugPrint("URL :$url");
        Response response = await _dio!.post(
          url,
          data: data,
          options: header ?? _cacheOptions,
        );
        log(response.toString());
        // ignore: prefer_typing_uninitialized_variables, use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        // ignore: prefer_typing_uninitialized_variables;
        var responseBody;
        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (error) {
            debugPrint('decode error');
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e,st) {

        print("===1>$e");
        print("===2>$st");
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        log(e.message.toString());
        // log(e.response!.statusMessage.toString());
        // log(e.response!.statusCode.toString());
        // ignore: use_build_context_synchronously
        log(
          "await---?${await _handleError(e, context, message: e.response?.data['message'])}",
        );
        // log(e.message.toString());
        Map<String, dynamic> responseData = {
          'body': e.response?.data,
          'headers': null,
          // ignore: use_build_context_synchronously
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      // ignore: use_build_context_synchronously
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  //Delete Method
  static Future<Map<String, dynamic>> deleteDioHttpMethod(
      {BuildContext? context, required String url, data, header}) async {
    var internet = await check();
    if (internet) {
      // ignore: use_build_context_synchronously
      if (context != null) processIndicator.show(context);
      try {
        debugPrint(data);
        debugPrint("URL :$url");
        Response response = await _dio!.delete(
          url,
          data: data,
          options: header ?? _cacheOptions,
        );
        // ignore: prefer_typing_uninitialized_variables
        var responseBody;

        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (error) {
            debugPrint('decode error');
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          // ignore: use_build_context_synchronously
          'error_description': await _handleError(e, context,
              message: e.response?.data['message']),
        };
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      // ignore: use_build_context_synchronously
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  // //Multiple Concurrent
  static Future<Map<String, dynamic>> multipleConcurrentDioHttpMethod(
      {BuildContext? context,
      required String getUrl,
      required String postUrl,
      required Map<String, dynamic> postData}) async {
    try {
      if (context != null) processIndicator.show(context);
      List<Response> response = await Future.wait([
        _dio!.post("$endPointUrl/$postUrl",
            data: postData, options: _cacheOptions),
        _dio!.get("$endPointUrl/$getUrl", options: _cacheOptions)
      ]);
      if (response[0].statusCode == 200 || response[0].statusCode == 200) {
        if (response[0].statusCode == 200 && response[1].statusCode != 200) {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else if (response[1].statusCode == 200 &&
            response[0].statusCode != 200) {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'postBody': json.decode(response[0].data),
            'getBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        }
      } else {
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return {
          'postBody': null,
          'getBody': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } catch (e) {
      Map<String, dynamic> responseData = {
        'postBody': null,
        'getBody': null,
        'headers': null,
        'error_description': await _handleError(e, context),
      };
      // ignore: use_build_context_synchronously
      if (context != null) processIndicator.hide(context);
      return responseData;
    }
  }

  //Sending FormData
  static Future<Map<String, dynamic>> sendingFormDataDioHttpMethod(
      {required BuildContext? context,
      required String url,
      required Map<String, dynamic> data}) async {
    var internet = await check();
    if (internet) {
      try {
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.show(context);
        FormData formData = FormData.fromMap(data);
        Response response = await _dio!
            .post("$endPointUrl$url", data: formData, options: _cacheOptions);
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': json.decode(response.data),
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          // ignore: use_build_context_synchronously
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          // ignore: use_build_context_synchronously
          'error_description': await _handleError(e, context),
        };
        // ignore: use_build_context_synchronously
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      // ignore: use_build_context_synchronously
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  // Handle Error
  static Future<String> _handleError(error, context, {message}) async {
    String errorDescription = "";
    try {
      debugPrint("In side try");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("In side internet condition");
        if (error is DioError) {
          // ignore: unnecessary_cast
          DioError dioError = error as DioError;
          log("Error--->>${dioError.type}");
          switch (dioError.type) {
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout in connection with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.response:
              errorDescription = message;
              debugPrint(errorDescription);
              break;
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              debugPrint(errorDescription);
              break;
            case DioErrorType.other:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              debugPrint(errorDescription);
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
          debugPrint(errorDescription);
        }
      }
    } on SocketException catch (_) {
      errorDescription = "Please check your internet connection";
      debugPrint(errorDescription);
    }

    // if (errorDescription.contains("401")) {
    //   dataStorage.erase().then((value) async {
    //     print("User is Logging Out");
    //     final authUserData = {
    //       "old_token": dataStorage.read('token').toString(),
    //       "refresh_token": dataStorage.read('refreshToken').toString(),
    //     };

    //     GenerateTokenModel authResponse =
    //         await networkRepository.resetPassword(context, authUserData);

    //     if (authResponse.status == 200) {
    //       dataStorage.write('token', authResponse.data!.token);
    //       dataStorage.write('refreshToken', authResponse.data!.refreshToken);
    //       SuccessDialog.showSuccessDialog(
    //         successMessage: authResponse.message.toString(),
    //         onPressed: () {
    //           getNavigate.Get.offAll(LoginScreen());
    //         },
    //       );
    //     }
    //   });
    // }
    return errorDescription;
  }
}

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(bool func) {
    check().then((intenet) {
      if (intenet) {
        return true;
      } else {
        return false;
      }
    });
  }
}
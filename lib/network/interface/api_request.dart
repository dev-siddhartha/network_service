import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../constant/enums.dart';
import '../failure_state.dart';

abstract class ApiRequest {
  late Map<String, CancelToken> cancelTokens;

  void cancelRequest(String url);

  Future<Either<dynamic, FailureState>> getResponse({
    required String endPoint,
    required ApiMethods apiMethods,
    Map<String, dynamic>? queryParams,
    dynamic body,
    Options? options,
    bool isToCache = true,
    bool isToRefresh = false,
    int expiryDurationInDays = 3,
  });

  Future<Either<dynamic, FailureState>> decodeHttpRequestResponse(
    Future<dynamic> apiCall, {
    String message = "",
  });

  Future<Either<dynamic, FailureState>> uploadAnySingleFile({
    required String endPoint,
    required File file,
    required FormData formData,
    required String key,
    required UploadType uploadType,
  });

  Future<Either<dynamic, FailureState>> uploadAnyMultipleFile({
    required String endPoint,
    required List<File> files,
    required FormData formData,
    required String key,
    required UploadType uploadType,
  });
}

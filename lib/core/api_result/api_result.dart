import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../excepations/exceptions.dart';

part 'api_result.freezed.dart';

class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required String message}) = Failure<T>;
}

Future<ApiResult<T>> toApiResult<T>(FutureOr<T> Function() call,
    {String prefix = 'exceptions.'}) async {
  try {
    return ApiResult.success(data: await call());
  } on AppNetworkResponseException catch (e) {
    return ApiResult.failure(message: e.data);
  } on AppNetworkException catch (e) {
    return ApiResult.failure(message: e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    return ApiResult.failure(
      message: e.toString(),
    );
  }
}

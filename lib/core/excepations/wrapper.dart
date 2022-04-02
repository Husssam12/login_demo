import 'dart:async';
import 'dart:developer';

import '../api_result/api_result.dart';
import 'exceptions.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return call();
  } on AppException catch (_) {
    rethrow;
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown(exception: e,message: e.toString());
  }
}



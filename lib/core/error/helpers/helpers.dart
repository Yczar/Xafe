import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/core/network_checker/network_info.dart';

import '../error.dart';
import '../exceptions.dart';
import '../failures.dart';

void errorMessageLogger(dynamic error, dynamic stackTrace) {
  log('=======\nError is: $error, \nStacktrace is: \n=======');
}

String mapFailureMessage(Failure failure) {
  log('====${failure.runtimeType}===');

  switch (failure.runtimeType) {
    case AuthFailure:
      return getErrorMessage ?? '';
    case FirebaseFailure:
      return getErrorMessage ?? '';
    case PlatformFailure:
      return getErrorMessage ?? '';
    case XafeSocketFailure:
      return 'Socket failure';
    case GeneralFailure:
      return 'General failure';
    default:
      return 'Unhandled failure';
  }
}

typedef _SuccessFailureTypeDef = Function();
Future<Either<Failure, T>> successFailureInterceptor<T>(
  _SuccessFailureTypeDef func,
) async {
  try {
    final _networkInfo = locator<NetworkInfo>();
    await _networkInfo.isDeviceCOnnected;
    try {
      // ignore: unused_local_variable
      final T result = await func() as T;
      return Right(result);
    } on FirebaseAuthException {
      return Left(AuthFailure());
    } on FirebaseException {
      return Left(FirebaseFailure());
    } on PlatformException {
      return Left(PlatformFailure());
    } on GeneralException {
      return Left(GeneralFailure());
    }
  } on XafeSocketException {
    return Left(XafeSocketFailure());
  }
}

///To be used in the [Firebase service] classes.
typedef _FirebaseTypeDef = Function();
Future<T> firebaseInterceptor<T>(
  _FirebaseTypeDef func,
) async {
  try {
    // ignore: unused_local_variable
    final T result = await func() as T;
    return result;
  } on FirebaseAuthException catch (error, stacktrace) {
    setErrorMessage(error.message);
    errorMessageLogger(error, stacktrace);
    throw FirebaseAuthException(
      code: error.code,
      message: error.message,
    );
  } on FirebaseException catch (error, stacktrace) {
    setErrorMessage(error.message);
    errorMessageLogger(error, stacktrace);
    throw FirebaseAuthException(
      code: error.code,
      message: error.message,
    );
  } on PlatformException catch (error, stacktrace) {
    setErrorMessage(error.message);
    errorMessageLogger(error, stacktrace);
    throw PlatformException(
      code: error.code,
      message: error.message,
    );
  } on Exception {
    throw GeneralException();
  }
}

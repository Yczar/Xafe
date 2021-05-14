import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthFailure extends Failure {}

class FirebaseFailure extends Failure {}

class PlatformFailure extends Failure {}

class XafeSocketFailure extends Failure {}

class GeneralFailure extends Failure {}

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/domain/usecases/create_user.dart';
import 'package:xafe/app/authentication/domain/usecases/register_user.dart';
import 'package:xafe/main_screen.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpViewmodel extends BaseViewModel {
  SignUpViewmodel(
    this._registerUser,
    this._createUser,
  );

  final RegisterUser _registerUser;
  final CreateUser _createUser;

  Future registerUser({
    UserModel params,
    EmailPasswordParams emailPasswordParams,
    BuildContext context,
  }) {
    setBusy(true);
    return _registerUser(emailPasswordParams)
      ..then(
        (result) {
          result.fold(
            (failure) {},
            (data) {
              return createUser(
                params: UserModel(
                  name: params.name,
                  id: data.uid,
                  email: data.email,
                ),
                context: context,
              );
            },
          ).then(
            (value) => setBusy(false),
          );
        },
      );
  }

  Future createUser({
    UserModel params,
    BuildContext context,
  }) {
    setBusy(true);
    return _createUser(params)
      ..then(
        (result) {
          result.fold(
            (failure) {},
            (data) {
              return pushAndRemoveUntil(
                context,
                MainScreen(),
              );
            },
          ).then(
            (value) => setBusy(false),
          );
        },
      );
  }
}

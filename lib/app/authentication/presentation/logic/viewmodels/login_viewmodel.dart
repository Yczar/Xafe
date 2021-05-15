import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/domain/usecases/login_user.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/main_screen.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class LoginViewmodel extends BaseViewModel {
  LoginViewmodel(
    this._loginUser,
  );

  final LoginUser _loginUser;

  Future loginUser({
    EmailPasswordParams params,
    BuildContext context,
  }) {
    setBusy(true);
    return _loginUser(params)
      ..then(
        (result) {
          result.fold(
            (failure) {
              setBusy(false);
              Fluttertoast.showToast(
                msg: mapFailureMessage(failure),
              );
            },
            (data) {
              setBusy(false);
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

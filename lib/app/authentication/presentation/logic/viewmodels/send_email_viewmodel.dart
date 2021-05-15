import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_3.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SendEmailViewModel extends BaseViewModel {
  String userEmail = 'babalolagbogo@gmail.com';
  String password = '#31#Viral';
  int min = 100000;
  int max = 999999;
  var randomizer = Random();

  Future<void> sendEmail({
    UserModel userModel,
    BuildContext context,
  }) async {
    setBusy(true);
    final rNum = min + randomizer.nextInt(max - min);
    final smtpServer = gmail(userEmail, password);

    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(userEmail, 'Czar From Xafe')
      ..recipients.add(userModel.email)
      ..subject = 'Here is your Xafe code ${DateTime.now()}'
      ..text = 'Your code is $rNum';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      navigate(
        context,
        SignUpScreen3(
          userModel: userModel,
        ),
      );
    } on MailerException catch (e) {
      print('Message not sent. $e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    setBusy(false);
  }
}

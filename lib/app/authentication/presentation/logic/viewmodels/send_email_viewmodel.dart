import 'dart:math';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:stacked/stacked.dart';

class SendEmailViewModel extends BaseViewModel {
  String userEmail = 'babalolagbogo@gmail.com';
  String password = '#31#Viral';
  int min = 100000;
  int max = 100000;
  var randomizer = Random();

  Future<void> sendEmail({
    String email,
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
      ..recipients.add(email)
      ..subject = 'Here is your Xafe code ${DateTime.now()}'
      ..text = 'Your code is $rNum';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    setBusy(false);
  }
}

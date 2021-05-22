import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  static sendEmail(String recepient, url, fname) async {
    String downloadUrlForEmail = url;
    String firstName = fname;
    String username = 'gajjarviren619@gmail.com';
    String password = 'vireN@619';
    final smtpServer = gmail(username, password);

    String emailBody =
        'Hello $firstName,\n\nAs requested by you, you can download the desired file by the link provided below.\n\n$downloadUrlForEmail.\n\n\nThanks and Regards,\nPozitive Energy Team.';
    String emailSub = 'Tender Price Quotation';
    final message = Message()
      ..from = Address(username, 'Viren')
      ..recipients.add('vgajjar1010@gmail.com')
      ..recipients.add(recepient)
      ..subject = emailSub
      ..text = emailBody;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      print('url is $downloadUrlForEmail');
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    var connection = PersistentConnection(smtpServer);

    await connection.send(message);

    await connection.close();
  }
}

import 'package:url_launcher/url_launcher.dart';

void launchURL() async {
  Uri url = Uri.parse('https://www.google.com');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Não foi possível abrir $url';
  }
}

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OnionUser {
  late String authoricationCode;
    Map<String, String> headers = {
        "accept": "application/json",
        "accept-language": "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
        "cache-control": "no-store",
        "client-char": "true",
        "client-type": "pc",
        "client-version": "8.15.57",
        "content-type": "application/json",
        "expires": "0",
        "omvd": "31556461274455727",
        "pragma": "no-cache",
        "sec-ch-ua": "\"Not_A Brand\";v=\"99\", \"Microsoft Edge\";v=\"109\", \"Chromium\";v=\"109\"",
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": "\"Windows\"",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "cross-site",
        "Referer": "https://school.yangcongxueyuan.com/",
        "Referrer-Policy": "strict-origin-when-cross-origin"
    };

  Future<int> login(String username, String password) async {
    // if login complete
    final context = await http.get(
      Uri.parse('https://school-api.yangcong345.com/public/login'),
      headers: headers,
    );
    if (context.statusCode == 200) {
      authoricationCode = context.headers['authorization'] ?? '';
      headers['authorization'] = authoricationCode;
      return 0;
    } else {
      return -1;
    }
  }
}

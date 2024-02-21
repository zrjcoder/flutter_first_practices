import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:crypto/crypto.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    const String baseUrl = baseURL;

    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'User-Agent': userAgent,
        // 'User-Agent': 'MicroMessenger/',
        // 'Referer':
        //     'https://servicewechat.com/wx2f9b06c1de1ccfca/91/page-frame.html',
      },
      connectTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
    );

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SignResult signResult = generateSign(
              '${options.baseUrl}${options.path}', options.method, '');
          options.queryParameters['_ts'] = signResult.ts;
          options.queryParameters['_sig'] = signResult.sign;

          options.queryParameters['apikey'] = apiKey;
          options.queryParameters['udid'] = udid;

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          return handler.next(error);
        },
      ),
    );

    httpClientAdapter = getAdapter();
  }

  static Dio getInstance() => AppDio._();

  SignResult generateSign(String requestUrl, String method, String bearToken) {
    const key = 'bf7dddc7c9cfe6f7';

    Uri uri = Uri.parse(requestUrl);
    final encodedPath = uri.path;
    final decode =
        Uri.decodeComponent(encodedPath).replaceAll(RegExp(r'\/+$'), '');

    final builder = StringBuffer(method)
      ..write('&')
      ..write(Uri.encodeComponent(decode));

    if (bearToken.isNotEmpty) {
      builder
        ..write('&')
        ..write(bearToken);
    }

    final currentTimeMillis =
        (DateTime.now().millisecondsSinceEpoch / 1000).round();
    builder
      ..write('&')
      ..write(currentTimeMillis);

    final paramString = builder.toString();
    final bytes =
        Hmac(sha1, utf8.encode(key)).convert(utf8.encode(paramString)).bytes;
    final sign = base64Encode(bytes);
    return SignResult(sign: sign, ts: currentTimeMillis);
  }
}

class SignResult {
  final String sign;
  final int ts;

  SignResult({required this.sign, required this.ts});
}

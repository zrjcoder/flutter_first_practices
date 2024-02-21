import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/extensions/extensions.dart';

class MyErrorWidget extends StatelessWidget {
  final bool isConnection;
  final VoidCallback refreshCallBack;

  const MyErrorWidget({
    super.key,
    required this.refreshCallBack,
    this.isConnection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '😭',
            style: TextStyle(fontSize: 60.0),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              getErrorText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.textTheme.titleLarge!.color,
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => refreshCallBack(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              backgroundColor: context.theme.colorScheme.secondary,
            ),
            child: const Text(
              '请点击重试',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  String getErrorText() {
    if (isConnection == false) {
      return '网络连接失败';
    } else {
      return '数据加载失败';
    }
  }
}

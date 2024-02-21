import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final bool isImage;

  const LoadingWidget({super.key, this.isImage = false});

  @override
  Widget build(BuildContext context) {
    final Color color = context.theme.colorScheme.secondary;
    return Center(
      child: isImage ? SpinKitRing(color: color) : SpinKitWave(color: color),
    );
  }
}

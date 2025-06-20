import 'dart:io';

import 'package:flutter/material.dart';

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(context) {
  return MediaQuery.of(context).size.height * 0.001;
}

double getResponsiveText(context) {
  if (Platform.isAndroid) {
    return 0.8;
  } else {
    return 0.9;
  }
}

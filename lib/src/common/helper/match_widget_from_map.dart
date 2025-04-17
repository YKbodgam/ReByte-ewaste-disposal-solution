import 'package:flutter/material.dart';

Widget matchWidgetFromMap({
  required String variable,
  required Map<String, Widget> matchMap,
  required Widget defaultWidget,
}) {
  return matchMap[variable] ?? defaultWidget;
}

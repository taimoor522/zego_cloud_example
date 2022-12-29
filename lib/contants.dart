import 'dart:math';

import 'package:flutter/material.dart';

const int appId = YOUR_APP_ID;
const String appSign = YOUR_APP_SIGN;
final localUserID = Random().nextInt(1000000).toString();

const textFieldDecoration = InputDecoration(
  labelText: 'Join a Stream',
  hintText: 'Enter Stream ID',
  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
  border: OutlineInputBorder(),
  enabled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
);

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff0F1523),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    fixedSize: const Size(140, 50),
    backgroundColor: const Color(0xff232F3D).withOpacity(0.6),
  )),
);

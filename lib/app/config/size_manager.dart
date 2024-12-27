/*
author : Created by Mansi iCoderZ
Created Date : 13-03-24
 */
import 'dart:io';

import 'package:flutter/material.dart';

class SizeManager {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

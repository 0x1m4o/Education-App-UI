import 'package:flutter/material.dart';

class Constants {
  ThemeData theme(BuildContext context) {
    return Theme.of(context);
  }

  Size sizeMQ(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}

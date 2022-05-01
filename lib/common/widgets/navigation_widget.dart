import 'package:flutter/cupertino.dart';

navigate(con, Widget name) {
  Navigator.push(con, CupertinoPageRoute(builder: (contex) => name));
}

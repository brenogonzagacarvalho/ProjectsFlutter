import 'package:flutter/material.dart';
import 'package:helpusmall/service/auth.dart';
import 'package:helpusmall/telas/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child : MaterialApp(
      home: Wrapper(),
      
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'helpers/user_info.dart';
import 'ui/login.dart';
import 'ui/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "listBook",
    theme: ThemeData(primarySwatch: Colors.cyan),
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Dashboard(),
  ));
}

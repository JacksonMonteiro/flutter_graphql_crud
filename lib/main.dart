import 'package:flutter/material.dart';
import 'package:graphql_crud/app/app_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const AppWidget());
}
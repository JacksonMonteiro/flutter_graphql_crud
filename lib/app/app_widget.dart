import 'package:flutter/material.dart';
import 'package:graphql_crud/app/views/create_update_user_view.dart';
import 'package:graphql_crud/app/views/home_view.dart';
import 'package:graphql_crud/app/views/show_users.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Crud Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color(0xFFf8f8f8),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return TextStyle(fontSize: 14, color: Color(0xFFFFFFFF));
                } else if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  );
                } else {
                  return const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  );
                }
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xFF1769aa);
                } else if (states.contains(MaterialState.disabled)) {
                  return const Color(0xFFa6d5fa);
                }
                return const Color(0xFF2196f3);
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          fillColor: Colors.white,
          labelStyle: const TextStyle(
            color: Color(0xFF404040),
            fontSize: 14,
          ),
          hintStyle: const TextStyle(
            color: Color(0x66404040),
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
        ),
      ),
      home: const HomeView(title: 'GraphQL Crud Example'),
      routes: {
        CreateUpdateUserView.routeName: (_) => const CreateUpdateUserView(),
        ShowUsers.routeName: (_) => const ShowUsers(),
      },
    );
  }
}

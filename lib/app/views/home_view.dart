import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_crud/app/components/snackbar.dart';
import 'package:graphql_crud/app/services/delete_user.dart';
import 'package:graphql_crud/app/services/get_all_users.dart';
import 'package:graphql_crud/app/views/create_update_user_view.dart';
import 'package:graphql_crud/app/views/show_users.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
/*
Hey everyone, today we are going to see CRUD operation in graphql api
here we are goining to add/read/update/delete user
i have already made a video on what is graphql  so ,let's jump on directly 
let's see create
so to create we use mutate type of call let's see it's api call then ui
now let's see how to get single data , how to to fetch one user using userid
okay that's complete - create read all, single, now let's see update /edit
now last if delete let check that
with this our crud operation is complete
thanks for watching
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateUpdateUserView.routeName);
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List>(
            future: getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1100000D),
                                blurRadius: 16,
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                "# ${snapshot.data?[index]['id']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                snapshot.data?[index]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      ShowUsers.routeName,
                                      arguments: snapshot.data?[index]['id']);
                                },
                                icon: const Icon(
                                  Icons.launch_outlined,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      CreateUpdateUserView.routeName,
                                      arguments: snapshot.data?[index]['id']);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () async {
                                  var res = await deleteUser(
                                      id: int.parse(
                                          snapshot.data?[index]['id']));
                                  if (res) {
                                    snackBar("User deleted", context);
                                    setState(() {});
                                  } else {
                                    snackBar("Failed to delete", context);
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container();
            }));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

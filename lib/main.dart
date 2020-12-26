import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttix/services/services.dart';
import 'package:fluttix/ui/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorMessageWidget(snapshot.error.toString());
            } else {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      child: Text('Sign Up'),
                      onPressed: () async {
                        SignInSignOutResult result = await AuthServices.signUp(
                          'rizkys@gmail.com',
                          '123456',
                          'syahferi',
                          ['drama', 'thriller', 'action'],
                          'ENG',
                        );

                        if (result.user != null) {
                          print(result.user.toString());
                        } else {
                          print(result.message);
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text('Sign In'),
                      onPressed: () async {
                        SignInSignOutResult result = await AuthServices.signIn(
                          'rizkys@gmail.com',
                          '123456',
                        );

                        if (result.user != null) {
                          print(result.user.toString());
                        } else {
                          print(result.message);
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text('Sign Out'),
                      onPressed: () async => await AuthServices.signOut(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

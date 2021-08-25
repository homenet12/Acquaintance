import 'package:acquaintance/pages/loginpage.dart';
import 'package:acquaintance/services/FirebaseProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseProvider>(
          create: (context) => FirebaseProvider(),
        )
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}

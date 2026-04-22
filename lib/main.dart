import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wastepy/features/auth/presentation/pages/login_page.dart';

Future<void> mainCommon(FirebaseOptions options) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: options,
  );

  runApp(const WasteApp());
}

class WasteApp extends StatelessWidget {
  const WasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginPage(),
    );
  }
}
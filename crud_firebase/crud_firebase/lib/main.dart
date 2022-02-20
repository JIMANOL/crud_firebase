import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

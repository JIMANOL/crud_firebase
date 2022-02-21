import 'package:flutter/material.dart';
import 'package:crud_firebase/src/ui/listview_people.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ListViewPerson(),
      ),
    );
  }
}

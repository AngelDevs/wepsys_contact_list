import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContactList',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      
    );
  }
}

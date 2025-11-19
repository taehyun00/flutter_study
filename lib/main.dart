import 'package:flutter/material.dart';
import 'package:flutter_project_1/view/couter_view.dart';
import 'package:flutter_project_1/viewmodel/couter_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project_1/view/webton_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home :ChangeNotifierProvider(
        create: (context) => CouterViewmodel(),
        child:  WebtonView() 
        )
    );
  }
}
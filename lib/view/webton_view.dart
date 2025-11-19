import 'package:flutter/material.dart';
import 'package:flutter_project_1/viewmodel/webtoon_viewmodel.dart';
import 'package:flutter_project_1/model/webtoon_model.dart';

class WebtonView extends StatelessWidget {
  const WebtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 49, 49),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: Text("ToonRecommend",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        )


      ),
      body: Center(
        child: Column(
          
        )
      ),
    );
  }
}
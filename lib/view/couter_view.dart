import 'package:flutter/material.dart';
import 'package:flutter_project_1/model/counter_model.dart';
import 'package:flutter_project_1/viewmodel/couter_viewmodel.dart';
import 'package:provider/provider.dart';

class CouterView extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      
      final Viewmodel = Provider.of<CouterViewmodel>(context);


      return Scaffold(
        appBar: AppBar(
          title: Text("mvvm")
        ),
        body: Center(
          child: Text('${Viewmodel.counter}')
        ),
        floatingActionButton: FloatingActionButton(onPressed: Viewmodel.increment),
      );
    }
}
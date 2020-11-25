import 'package:flutter/material.dart';
import './screens/todo.dart';
import 'package:provider/provider.dart';
import './provider/moreduties.dart';
import './screens/enter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: MoreDuties(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Todo(),
          routes: {Enter.routeName: (ctx) => Enter()},
        ));
  }
}

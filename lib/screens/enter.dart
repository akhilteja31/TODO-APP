import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/duty.dart';
import '../provider/moreduties.dart';

class Enter extends StatelessWidget {
  static const routeName = '/enter';
  var inputtask = Duty(id: null, title: '', description: '');

  final inputtitle = TextEditingController();
  final inputdescription = TextEditingController();

  // print(inputtask.title);

  //print(inputtask.id);
  //print(inputtask.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.deepPurple[300],
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(6),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              SizedBox(
                width: 50,
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Daily Activity",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ))
            ]),
            SizedBox(
              height: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 8.0,
                child: Container(
                    height: 300,
                    constraints: BoxConstraints(minHeight: 200),
                    width: 400,
                    padding: EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      TextField(
                          controller: inputtitle,
                          onChanged: (value) => {
                                inputtask = Duty(
                                    id: inputtask.id,
                                    title: value,
                                    description: inputtask.description)
                              },
                          decoration: InputDecoration(
                            labelText: "Task Title",
                            labelStyle: TextStyle(fontSize: 20),
                          )),
                      SizedBox(height: 20),
                      TextField(
                          onChanged: (value) => {
                                inputtask = Duty(
                                    id: inputtask.id,
                                    title: inputtask.title,
                                    description: value)
                              },
                          controller: inputdescription,
                          decoration: InputDecoration(
                            labelText: "Description",
                            labelStyle: TextStyle(fontSize: 20),
                            hintMaxLines: 3,
                          )),
                    ]))),
            RaisedButton(
              color: Colors.blueGrey[300],
              onPressed: () {
                Provider.of<MoreDuties>(context, listen: false)
                    .addTask(inputtask);
                Navigator.of(context).pop();
              },
              child:
                  Text("submit", style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ])),
    ));
  }
}

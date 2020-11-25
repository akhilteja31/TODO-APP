import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/moreduties.dart';
import './enter.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MoreDuties>(context).fetchTask();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        title: Text('TODO'),
      ),
      body: Container(
          color: Colors.indigo[300],
          child: Consumer<MoreDuties>(
              builder: (context, fetch, child) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      itemCount: fetch.items.length,
                      itemBuilder: (ctx, i) => Column(children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 32.0),
                              decoration: BoxDecoration(
                                  color: Colors.lime[300],
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      fetch.items[i].title,
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(fetch.items[i].description),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          onPressed: () {
                                            Provider.of<MoreDuties>(context,
                                                    listen: false)
                                                .delete(fetch.items[i].id);
                                          },
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "delete",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ]))))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Enter.routeName);
        },
        child: Text(
          "add",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

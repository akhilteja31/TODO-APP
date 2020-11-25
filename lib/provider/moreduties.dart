import 'duty.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoreDuties with ChangeNotifier {
  List<Duty> _items = [
    /* Duty(
        id: 'q1',
        title: 'hey hi',
        description:
            "sdkjbvkdsjbvkdsjvbldbvldjkvbdjkbvifbviuvbifduvbkdjlvbidsuvbdpiuvbsdi"),
    Duty(
        id: 'q2',
        title: 'hey hi',
        description:
            "sdkjbvkdsjbvkdsjvbldbvldjkvbdjkbvifbviuvbifduvbkdjlvbidsuvbdpiuvbsdi"),
    Duty(
        id: 'q3',
        title: 'hey hi',
        description:
            "sdkjbvkdsjbvkdsjvbldbvldjkvbdjkbvifbviuvbifduvbkdjlvbidsuvbdpiuvbsdi"),
    Duty(
        id: 'q4',
        title: 'hey hi',
        description:
            "sdkjbvkdsjbvkdsjvbldbvldjkvbdjkbvifbviuvbifduvbkdjlvbidsuvbdpiuvbsdi")*/
  ];

  List<Duty> get items {
    return [..._items];
  }

  Future<void> fetchTask() async {
    var url = 'https://new-todo-b423d.firebaseio.com/task.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Duty> fetchedtask = [];
      extractedData.forEach((prodId, prodData) {
        fetchedtask.add(Duty(
            id: prodId,
            title: prodData['title'],
            description: prodData['description']));
      });
      _items = fetchedtask;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> delete(String id) async {
    var url = 'https://new-todo-b423d.firebaseio.com/task.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();

      existingProduct = null;
    }
  }

  Future<void> addTask(Duty duties) async {
    var url = 'https://new-todo-b423d.firebaseio.com/task.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': duties.title,
            'description': duties.description,
          }));
      final newduties = Duty(
          id: json.decode(response.body)['name'],
          title: duties.title,
          description: duties.description);
      _items.add(newduties);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

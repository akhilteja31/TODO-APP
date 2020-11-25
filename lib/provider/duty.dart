import 'package:flutter/foundation.dart';

class Duty with ChangeNotifier {
  final String id;
  final String title;
  final String description;

  Duty({
    @required this.id,
    @required this.title,
    @required this.description,
  });
}

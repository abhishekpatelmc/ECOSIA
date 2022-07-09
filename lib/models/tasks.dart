// import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late String id;
  late String name;
  late String description;

  Task();

  Task.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['Name'];
    description = data['Description'];

  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'Dame': name,
      'Description': description,

    };
  }
}
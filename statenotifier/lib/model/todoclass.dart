import 'package:flutter/cupertino.dart';

class Todo {
  Todo({required this.id, required this.desc, required this.status});
  final String id;
  final String desc;
  final bool status;

  Todo copyWith({String? id, String? desc, bool? status}) {
    return Todo(
        id: id ?? this.id,
        desc: desc ?? this.desc,
        status: status ?? this.status);
  }
}

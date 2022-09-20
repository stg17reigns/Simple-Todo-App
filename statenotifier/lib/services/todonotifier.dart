// import 'dart:ffi';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:statenotifier/model/todoclass.dart';
// import 'package:statenotifier/model/todohive.dart';

// const String boxName = 'TodoBox';

// class TodoNotifier extends StateNotifier<List<Todo>> {
//   TodoNotifier() : super([]);

//   void addTodo(final todo) {
//     state = [...state, todo];
//     print('state');
//     print(state.asMap());
//     TodoHive todo_in_hive =
//         TodoHive(id: todo.id, desc: todo.desc, status: todo.status);

//     Hive.box<TodoHive>(boxName).add(todo_in_hive);
//   }

//   void deleteTodo(TodoHive todo_received) {
//     state = [
//       for (final todo in state)
//         if (todo.id != todo_received.id) todo
//     ];
//     Hive.box<TodoHive>(boxName).deleteAt(int.parse(todo_received.id));
//   }

//   void statusChangeTodo(TodoHive todo_received) {
//     state = [
//       for (final todo in state)
//         if (todo.id == todo_received.id)
//           todo.copyWith(status: !todo.status)
//         else
//           todo,
//     ];
//     print(!state[int.parse(todo_received.id)].status);
//     TodoHive modTodo = TodoHive(
//         id: todo_received.id,
//         desc: state[int.parse(todo_received.id)].desc,
//         status: !state[int.parse(todo_received.id)].status);

//     Hive.box<TodoHive>(boxName).putAt(int.parse(todo_received.id), modTodo);
//   }
// }

// final todonotifierprovider =
//     StateNotifierProvider<TodoNotifier, List<Todo>>(((ref) => TodoNotifier()));

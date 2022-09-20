// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:statenotifier/services/todonotifier.dart';

// class TodoApp extends ConsumerWidget {
//   const TodoApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final todo_things = ref.watch(todonotifierprovider);
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 224, 128, 128),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             for (final todo in todo_things)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CheckboxListTile(
//                   secondary: IconButton(
//                     icon: const Icon(
//                       Icons.delete_outline,
//                       color: Colors.red,
//                     ),
//                     onPressed: () {
//                       // final del_ete = ref.read(todonotifierprovider.notifier);
//                       // del_ete.deleteTodo(todo);

//                       // this part is for list me dalna ke liye with immutable class method
//                     },
//                   ),
//                   checkboxShape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   contentPadding: EdgeInsets.all(10),
//                   tileColor: Color.fromRGBO(245, 237, 220, 1),
//                   value: todo.status,
//                   onChanged: (value) {
//                     // ref
//                     //     .read(todonotifierprovider.notifier)
//                     //     .statusChangeTodo(todo);
//                   },
//                   title: todo.status
//                       ? Text(
//                           todo.desc,
//                           style: const TextStyle(
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         )
//                       : Text(todo.desc),
//                 ),
//               )
//           ],
//         ),
//       ),
//       floatingActionButton: InkWell(
//         onTap: () {
//           Navigator.of(context).pushNamed('/addTodo');
//         },
//         child: Container(
//           height: 60,
//           width: 60,
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: const Color.fromARGB(255, 249, 249, 124),
//               borderRadius: BorderRadius.circular(10)),
//           child: const Icon(
//             Icons.add_rounded,
//             size: 40,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // watch help to continously check for changes
// // listen, listen the provider in build normal if will not work
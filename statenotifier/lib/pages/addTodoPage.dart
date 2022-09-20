// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:statenotifier/model/todoclass.dart';
// import 'package:statenotifier/pages/todopage.dart';
// import 'package:statenotifier/services/todonotifier.dart';

// class AddTodoPage extends ConsumerWidget {
//   const AddTodoPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // id automatically and status at start false then done to true
//     TextEditingController txt_desc = TextEditingController();
//     final addtohive = ref.watch(todonotifierprovider.notifier);

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(245, 237, 220, 1),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: txt_desc,
//               cursorHeight: 30,
//               cursorWidth: 5,
//               cursorRadius: Radius.circular(10),
//               textAlign: TextAlign.center,
//               decoration: const InputDecoration(
//                 hintText: 'Describe Your Todo :- Submit Docs',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: () {
//                 print(txt_desc.text);

//                 if (txt_desc.text == '') {
//                   Navigator.of(context).pop();
//                 } else {
//                   final todo = Todo(
//                     id: addtohive.state.length.toString(),
//                     desc: txt_desc.text,
//                     status: false,
//                   );

//                   addtohive.addTodo(todo);
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: const BoxDecoration(
//                   color: Colors.lightGreen,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.done_rounded,
//                   size: 30,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

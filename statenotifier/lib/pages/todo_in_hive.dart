import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:statenotifier/model/todohive.dart';

import '../services/todonotifier.dart';

const String boxName = 'TodoBox';

final hiveProvider = StateProvider<Box<TodoHive>>(
  (ref) => Hive.box<TodoHive>(boxName),
);

class TodoHiveBox extends ConsumerStatefulWidget {
  const TodoHiveBox({super.key});

  @override
  ConsumerState<TodoHiveBox> createState() => _TodoHiveBoxState();
}

class _TodoHiveBoxState extends ConsumerState<TodoHiveBox> {
  late Box<TodoHive> todobox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todobox = Hive.box<TodoHive>(boxName);
  }

  @override
  Widget build(BuildContext context) {
    // final todo_things = ref.watch(todonotifierprovider);
    print('check bana kya?');

    TextEditingController txt = TextEditingController();

    final hive_details = ref.watch(hiveProvider);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 128, 128),
      body: Stack(
        children: [
          Container(
              child: ValueListenableBuilder(
            valueListenable: hive_details.listenable(),
            builder: (context, todos, child) {
              List<int> keys = todos.keys.cast<int>().toList();
              return ListView.separated(
                itemBuilder: (context, index) {
                  final int key = keys[index];
                  print(key);
                  //flush when nothing
                  final TodoHive? todo = todos.get(key);
                  return ListTile(
                    leading: Checkbox(
                        value: todo!.status,
                        onChanged: (value) {
                          final modtodo = TodoHive(
                              id: todo.id,
                              desc: todo.desc,
                              status: todo.status ? false : true);
                          print('clicked stat');
                          print(hive_details.putAt(
                            index,
                            modtodo,
                          ));
                        }),
                    title: todo.status
                        ? Text(
                            todo.desc,
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : Text(
                            todo.desc,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                    trailing: InkWell(
                      onTap: () {
                        print('clicked del');
                        hive_details.deleteAt(index);
                        if (hive_details.length == 0) {
                          hive_details.clear();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: hive_details.length,
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
              );
            },
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: txt,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed('/addTodo');
                      TodoHive todo_in_hive = TodoHive(
                        id: hive_details.length.toString(),
                        desc: txt.text == '' ? 'Add Todo' : txt.text,
                        status: false,
                      );
                      txt.text='';
                      Hive.box<TodoHive>(boxName).add(todo_in_hive);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 249, 249, 124),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      //
    );
  }
}

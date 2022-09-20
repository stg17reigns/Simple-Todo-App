import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifier/model/todohive.dart';
// import 'package:statenotifier/pages/addTodoPage.dart';
import 'package:statenotifier/pages/todo_in_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String boxName = 'TodoBox';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoHiveAdapter());
  await Hive.openBox<TodoHive>(boxName);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: const TodoHiveBox(),
      initialRoute: '/main',
      routes: {
        // '/addTodo': (context) => const AddTodoPage(),
        '/main': (context) => const TodoHiveBox()
      },
    );
  }
}

// rest of files are for statenotifier used hive application 
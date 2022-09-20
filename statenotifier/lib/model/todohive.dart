import 'package:hive/hive.dart';
part 'todohive.g.dart';

@HiveType(typeId: 0)
class TodoHive extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final bool status;

  TodoHive({required this.id, required this.desc, required this.status});
}

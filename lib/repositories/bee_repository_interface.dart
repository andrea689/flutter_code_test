import 'package:three_bee_code_test/models/task.dart';

abstract class IBeeRepository {
  Future<List<Task>> getTasks();
  Future<void> updateTask(Task task);
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:three_bee_code_test/models/task.dart';
import 'package:three_bee_code_test/repositories/bee_repository_interface.dart';

class BeeRepository implements IBeeRepository {
  final String _baseUrl = 'https://api.3bee.com/';
  final String _token = 'TOKEN';

  @override
  Future<List<Task>> getTasks() async {
    var response = await http.get(
      _baseUrl + 'tasks',
      headers: {'Authorization': 'Bearer $_token'},
    );
    if (response.statusCode == 200) {
      List<Task> tasks = [];
      json.decode(response.body).forEach((task) {
        tasks.add(Task.fromMap(task));
      });
      return tasks;
    }
    throw Exception('Failed to load Tasks');
  }

  @override
  Future<void> updateTask(Task task) async {
    var response = await http.put(
      _baseUrl + 'tasks/${task.id}',
      headers: {'Authorization': 'Bearer $_token'},
    );
    if (response.statusCode == 204) {
      List<Task> tasks = [];
      json.decode(response.body).forEach((task) {
        tasks.add(Task.fromMap(task));
      });
      return tasks;
    }
    throw Exception('Failed to update Tasks');
  }
}

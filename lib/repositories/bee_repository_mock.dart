import 'package:three_bee_code_test/models/task.dart';
import 'package:three_bee_code_test/repositories/bee_repository_interface.dart';

List tasksResponse = [
  {
    "id": "1",
    "title": "Condividi",
    "body":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate lorem ut nisi fringilla finibus. Nullam ut dolor at nunc placerat ornare. Curabitur ut lacinia nunc.",
    "checked": true,
    "points": 5,
    "type": "share",
    "enabled": true
  },
  {
    "id": "2",
    "title": "Carica una foto",
    "body":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate lorem ut nisi fringilla finibus. Nullam ut dolor at nunc placerat ornare. Curabitur ut lacinia nunc.",
    "checked": false,
    "points": 6,
    "type": "upload_photo",
    "enabled": true
  },
  {
    "id": "3",
    "title": "Carica un video",
    "body":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate lorem ut nisi fringilla finibus. Nullam ut dolor at nunc placerat ornare. Curabitur ut lacinia nunc.",
    "checked": false,
    "points": 7,
    "type": "upload_video",
    "enabled": true
  },
  {
    "id": "4",
    "title": "Degustazione",
    "body":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate lorem ut nisi fringilla finibus. Nullam ut dolor at nunc placerat ornare. Curabitur ut lacinia nunc.",
    "checked": false,
    "points": 8,
    "type": "tasting",
    "enabled": true
  },
  {
    "id": "5",
    "title": "Degustazione",
    "body":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate lorem ut nisi fringilla finibus. Nullam ut dolor at nunc placerat ornare. Curabitur ut lacinia nunc.",
    "checked": false,
    "points": 8,
    "type": "tasting",
    "enabled": false
  }
];

class BeeRepositoryMock implements IBeeRepository {
  @override
  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 2));
    // To test exception uncomment under line
    //throw Exception('Failed to update Tasks');
    List<Task> tasks = [];
    tasksResponse.forEach((task) {
      tasks.add(Task.fromMap(task));
    });
    return tasks;
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    return null;
  }
}

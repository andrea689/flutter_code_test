import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:three_bee_code_test/components/bee_checkbox.dart';
import 'package:three_bee_code_test/components/honey_points_card.dart';
import 'package:three_bee_code_test/components/honey_points_header.dart';
import 'package:three_bee_code_test/models/task.dart';
import 'package:three_bee_code_test/repositories/bee_repository.dart';
import 'package:three_bee_code_test/repositories/bee_repository_interface.dart';

class HoneyPointsPage extends HookWidget {
  final IBeeRepository _beeRepository;

  HoneyPointsPage({
    beeRepository,
  }) : _beeRepository = beeRepository ?? BeeRepository();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> error = useState('');
    final ValueNotifier<List<Task>> tasks = useState(null);

    useMemoized(() async {
      try {
        tasks.value = await _beeRepository.getTasks();
      } catch (_) {
        error.value = 'Errore';
      }
    });

    Widget body;
    if (error.value.isNotEmpty) {
      body = Center(
        child: Text(error.value),
      );
    } else if (tasks.value == null) {
      body = Center(
        child: CircularProgressIndicator(),
      );
    } else {
      body = ListView.builder(
        itemCount: tasks.value.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return HoneyPointsHeader();
          }
          return HoneyPointsCard(
            task: tasks.value[index - 1],
            onTap: () {
              final task = tasks.value[index - 1];
              final newTask = task.copyWith(checked: !task.checked);
              tasks.value = List.from(tasks.value)
                ..replaceRange(index - 1, index, [newTask]);
              _beeRepository.updateTask(newTask);
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Punti Miele'),
        leading: Icon(Icons.close),
      ),
      body: body,
    );
  }
}

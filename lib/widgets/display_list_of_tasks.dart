import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/task_tile.dart';

import 'common_container.dart';

class DisplayListOfTasks extends StatelessWidget {
  final List<Task> tasks;
  final bool isCompletedTasks;

  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTasks
            ? 'There is no completed task yet'
            : 'There is no task todo!';

    return CommonContainer(
      height: height,
      child:
          tasks.isEmpty
              ? Center(
                child: Text(
                  emptyTasksMessage,
                  style: context.textTheme.headlineSmall,
                ),
              )
              : ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1.5);
                },
                shrinkWrap: true,
                itemCount: tasks.length,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  final task = tasks[index];

                  return TaskTile(task: task);
                },
              ),
    );
  }
}

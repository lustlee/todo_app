import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/utils/task_categories.dart';
import 'package:todo_app/widgets/display_list_of_tasks.dart';
import 'package:todo_app/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    DisplayWhiteText(text: 'My Todo List', fontSize: 40),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: [
                        Task(
                          title: 'title 1',
                          note: 'note',
                          time: '10:23',
                          date: 'June, 07',
                          isCompleted: false,
                          category: TaskCategories.shopping,
                        ),
                        Task(
                          title: 'title 2 title 2 title 2',
                          note: 'note',
                          time: '10:23',
                          date: 'June, 07',
                          isCompleted: false,
                          category: TaskCategories.education,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: [
                        Task(
                          title: 'title 1',
                          note: 'note',
                          time: '10:23',
                          date: 'June, 07',
                          isCompleted: true,
                          category: TaskCategories.personal,
                        ),
                        Task(
                          title: 'title 2 title 2 title 2',
                          note: 'note',
                          time: '10:23',
                          date: 'June, 07',
                          isCompleted: true,
                          category: TaskCategories.work,
                        ),
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const DisplayWhiteText(text: 'Add New Task'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

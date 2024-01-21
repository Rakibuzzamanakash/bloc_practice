import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_states.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         for(int i = 0 ;i<10 ;i++){
           context.read<TodoBloc>().add( AddTodoEvent(task: 'Task No :$i'));
         }
        },
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state.todosList.isEmpty){
            return Center(child: Text("No Data found"),);
          }
          return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index].toString()),
                  trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todosList[index]));
                      },
                      icon: Icon(Icons.delete_outline)),
                );
              });
        },
      ),
    );
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_states.dart';

class TodoBloc extends Bloc<TodoEvents,TodoState>{

  final List<String> todoList = [];
  TodoBloc(): super (const TodoState()){
   on<AddTodoEvent>(_addTodoEvent);
   on<RemoveTodoEvent>(_removeTodoEvent);

  }

  void _addTodoEvent(AddTodoEvent events,Emitter<TodoState> emit){
    todoList.add(events.task);
    emit(state.copyWith(todosList: List.from(todoList)));
  }

  void _removeTodoEvent(RemoveTodoEvent events,Emitter<TodoState> emit){
    todoList.remove(events.task);
    emit(state.copyWith(todosList: List.from(todoList)));
  }
}
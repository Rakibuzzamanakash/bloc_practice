import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_practice/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practice/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_practice/repository/favourite_repository.dart';
import 'package:flutter_bloc_practice/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_practice/ui/favourit_app/favourit_screen.dart';
import 'package:flutter_bloc_practice/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_practice/ui/switch_example/switch_example.dart';
import 'package:flutter_bloc_practice/utils/image_picker_utils.dart';
import 'package:flutter_bloc_practice/ui/todo/todo_screen.dart';

import 'bloc/favourite/favourite_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc(),),
        BlocProvider(create: (context) => CounterBloc(),),
       // BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => TodoBloc(),),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository()),),


      ],
      child: MaterialApp(
        title: 'flutter_bloc_practice_practice',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal
          )
        ),
        home: const FavouriteScreen(),
      ),
    );
  }
}

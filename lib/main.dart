import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practice/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_practice/ui/switch_example/switch_example.dart';

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
      ],
      child: MaterialApp(
        title: 'flutter_bloc_practice_practice',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwitchScreen(),
      ),
    );
  }
}

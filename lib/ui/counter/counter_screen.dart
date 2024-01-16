import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Counter bloc") ,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state){
                return Center(
                  child: Text(state.counter.toString(),style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 42,
                  ),),
                );
              }
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text("Decrement")),
            ],
          ),
        ],
      ),
    );
  }
}

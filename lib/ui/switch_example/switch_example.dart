import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_practice/bloc/switch/switch_events.dart';
import 'package:flutter_bloc_practice/bloc/switch/switch_state.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous,current) => previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                return Switch(value: state.isSwitch, onChanged: (newValue) {
                  context.read<SwitchBloc>().add(EnableOrDisableNotification());
                });
              },
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return  Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),

            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous,current) => previous.slider != current.slider,
              builder: (context, state) {
                return Slider(value: state.slider, onChanged: (value) {
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}

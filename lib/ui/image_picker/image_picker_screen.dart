// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_bloc.dart';
// import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_events.dart';
// import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_state.dart';
//
// class ImagePickerScreen extends StatelessWidget {
//   const ImagePickerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image picker practice"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//          Center(child:  BlocBuilder<ImagePickerBloc,ImagePickerState>(
//              builder: (context,state){
//                return state.file == null ?
//                InkWell(
//                  onTap: (){
//                    context.read<ImagePickerBloc>().add(GalleryPicker());
//                  },
//                  child: CircleAvatar(
//                    child: Icon(Icons.camera),
//                  ),
//                )
//                    : Image.file(File(state.file!.path.toString()));
//              }
//          ),),
//         ],
//       ),
//     );
//   }
// }

// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_events.dart';
// import 'package:flutter_bloc_practice/bloc/image_picker/image_picker_state.dart';
//
//
// import '../../utils/image_picker_utils.dart';
//
// class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{
//
//   final ImagePickerUtils imagePickerUtils;
//
//   ImagePickerBloc(this.imagePickerUtils): super(const ImagePickerState()){
//    on<CameraCapture>(_cameraCapture);
//    on<GalleryPicker>(_galleryPicker);
//   }
//
//   void _cameraCapture(CameraCapture event,Emitter<ImagePickerState> states) async{
//     XFile? file = await imagePickerUtils.cameraCapture();
//     emit(state.copyWith(file: file));
//   }
//
//   void _galleryPicker(GalleryPicker event,Emitter<ImagePickerState> states) async{
//     XFile? file = await imagePickerUtils.imageFromGallery();
//     emit(state.copyWith(file: file));
//   }
// }
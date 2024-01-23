import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/post/post_events.dart';
import 'package:flutter_bloc_practice/bloc/post/post_states.dart';
import 'package:flutter_bloc_practice/utils/enums.dart';

import '../../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent,PostStates>{
  PostRepository postRepository = PostRepository();
  PostBloc(): super(const PostStates()){
    on<PostEvent>(fetchPostApi);
  }

  void fetchPostApi(PostEvent event,Emitter<PostStates> emit) async{
   await postRepository.fetchPost().then((value) {
     emit(state.copyWith(
       postStatus: PostStatus.success,
       postList: value,
       message: "Success"
     ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
    });
  }
}
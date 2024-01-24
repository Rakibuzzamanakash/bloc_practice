import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/post/post_events.dart';
import 'package:flutter_bloc_practice/bloc/post/post_states.dart';
import 'package:flutter_bloc_practice/utils/enums.dart';

import '../../model/post_model.dart';
import '../../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  List<PostModel> temPostList = [];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostEvent>(fetchPostApi);
    on<SearchItem>(_filterItem);
  }

  void _filterItem(SearchItem event, Emitter<PostStates> emit) async {

    if(event.stSearch.isEmpty){
      emit(state.copyWith(temPostList: [],searchMessage: ''));
    }else{
      // temPostList = state.postList
      //     .where((element) => element.email.toString() == event.stSearch.toString())
      //     .toList();

      temPostList = state.postList
          .where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toString().toLowerCase()))
          .toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(temPostList: temPostList,searchMessage: "No data found"));
      }else{
        emit(state.copyWith(temPostList: temPostList,searchMessage: ''));
      }
    }




  }

  void fetchPostApi(PostEvent event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, postList: value, message: "Success"));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}

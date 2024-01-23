import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/utils/enums.dart';

import '../../model/post_model.dart';

class PostStates extends Equatable{

  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

 const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = ""
});

 PostStates copyWith({PostStatus? postStatus,List<PostModel>? postList,String? message}){
   return PostStates(
     postStatus: postStatus ?? this.postStatus,
     postList: postList ?? this.postList,
     message: message ?? this.message
   );
}

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus,postList,message];

}
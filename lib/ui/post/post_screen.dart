import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/post/post_bloc.dart';
import 'package:flutter_bloc_practice/bloc/post/post_events.dart';
import 'package:flutter_bloc_practice/bloc/post/post_states.dart';
import 'package:flutter_bloc_practice/utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts api"),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context,index){
                  final item = state.postList[index];
                  return ListTile(
                    title: Text(item.email.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                });
        }
      }),
    );
  }
}
import 'package:flutter/cupertino.dart';
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
        title: const Text("Posts api"),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search Email",
                    border: OutlineInputBorder()
                  ),
                  onChanged: (key){
                   context.read<PostBloc>().add(SearchItem(key));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty?
                      Center(child: Text(state.searchMessage.toString()),)
                      : ListView.builder(
                      itemCount: state.temPostList.isEmpty? state.postList.length: state.temPostList.length,
                      itemBuilder: (context,index){

                        if(state.temPostList.isNotEmpty){
                          final item = state.temPostList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.email.toString()),
                              subtitle: Text(item.body.toString()),
                            ),
                          );
                        }else{
                          final item = state.postList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.email.toString()),
                              subtitle: Text(item.body.toString()),
                            ),
                          );
                        }

                      }),
                )
              ],
            );
        }
      }),
    );
  }
}

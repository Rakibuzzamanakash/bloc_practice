import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/favourite/favourite_bloc.dart';
import 'package:flutter_bloc_practice/bloc/favourite/favourite_events.dart';
import 'package:flutter_bloc_practice/bloc/favourite/favourite_states.dart';
import 'package:flutter_bloc_practice/model/favourite_item_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Item"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteList.isNotEmpty?true:false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemState>(
          builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ListStatus.failure:
            return Center(child: Text("Something went wrong"));
          case ListStatus.success:
            return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: state.tempFavouriteList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteBloc>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavouriteBloc>()
                                  .add(UnSelectItem(item: item));
                            }
                          }),
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel favouriteItemModel =
                                FavouriteItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                            context
                                .read<FavouriteBloc>()
                                .add(FavouriteItem(item: favouriteItemModel));
                          },
                          icon: Icon(item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border)),
                    ),
                  );
                });
        }
      }),
    );
  }
}

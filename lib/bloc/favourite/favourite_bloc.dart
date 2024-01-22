import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/favourite/favourite_events.dart';
import 'package:flutter_bloc_practice/bloc/favourite/favourite_states.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents,FavouriteItemState>{

  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemState()){
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);

  }

  void fetchList(FetchFavouriteList event,Emitter<FavouriteItemState> emit) async{
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event,Emitter<FavouriteItemState> emit) async{

    final index = favouriteList.indexWhere((element) => element.id == event.item.id);

    if(event.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }else{
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),tempFavouriteList: List.from(tempFavouriteList)));
  }

  void _selectItem(SelectItem event,Emitter<FavouriteItemState> emit) async{
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }
  void _unSelectItem(UnSelectItem event,Emitter<FavouriteItemState> emit) async{
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }
  void _deleteItem(DeleteItem event,Emitter<FavouriteItemState> emit) async{
    for(int i =0; i<tempFavouriteList.length;i++){
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      tempFavouriteList: List.from(tempFavouriteList),
    ));
  }

}
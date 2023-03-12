import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/item.dart';
import '../../data/model/model.dart';
import '../../data/repository/asbeza_repostiory.dart';

part 'asebeza_bloc_event.dart';
part 'asebeza_bloc_state.dart';

class AsebezaBlocBloc extends Bloc<AsebezaBlocEvent, AsebezaBlocState> {
  final _asbezaRepository = AsbezaRepository();

  AsebezaBlocBloc() : super(AsebezaBlocInitial()) {
    on<FetchAsebezaBlocEvent>(_mapAsbezaEventWithAsbezaState);
    on<AddItemBlocEvent>(_mapItemAddEventWithItemAddState);
    on<RemoveItemBlocEvent>(_mapItemRemoveEventWithItemRemoveState);
    on<GetItemBlocEvent>(_mapGetItemsEventWithGetItemState);
  }

  void _mapAsbezaEventWithAsbezaState(
      FetchAsebezaBlocEvent event, Emitter<AsebezaBlocState> emit) async {
    try {
      AsbezaBlockLoading();
      final activity = await _asbezaRepository.getGroceryItems();
      emit(AsbezaBlockSuccess(asbeza: activity));
    } catch (e) {
      emit(AsebezaBlocInitial());
    }
  }

  void _mapItemAddEventWithItemAddState(
      AddItemBlocEvent event, Emitter<AsebezaBlocState> emit) {
    _asbezaRepository.addItemToCart(event.item);
  }

  void _mapItemRemoveEventWithItemRemoveState(
      RemoveItemBlocEvent event, Emitter<AsebezaBlocState> emit) {
    _asbezaRepository.removeItemFromCart(event.id);
    final items = _asbezaRepository.getItemsFromCart();
    emit(AllCartItemsState(items: items));
  }

  void _mapGetItemsEventWithGetItemState(
      GetItemBlocEvent event, Emitter<AsebezaBlocState> emit) {
    final items = _asbezaRepository.getItemsFromCart();
    emit(AllCartItemsState(items: items));
  }
}

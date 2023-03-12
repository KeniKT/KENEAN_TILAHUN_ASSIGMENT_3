part of 'asebeza_bloc_bloc.dart';

class AsebezaBlocEvent extends Equatable {
  const AsebezaBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchAsebezaBlocEvent extends AsebezaBlocEvent {}

class AddItemBlocEvent extends AsebezaBlocEvent {
  final Item item;

  AddItemBlocEvent({required this.item});
  @override
  List<Object> get props => [item];
}

class GetItemBlocEvent extends AsebezaBlocEvent {}

class RemoveItemBlocEvent extends AsebezaBlocEvent {
  final int id;

  RemoveItemBlocEvent({required this.id});

  @override
  List<Object> get props => [id];
}

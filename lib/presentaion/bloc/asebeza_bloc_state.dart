part of 'asebeza_bloc_bloc.dart';

abstract class AsebezaBlocState extends Equatable {
  const AsebezaBlocState();

  @override
  List<Object> get props => [];
}

class AsebezaBlocInitial extends AsebezaBlocState {}

class AsbezaBlockLoading extends AsebezaBlocState {}

class AsbezaBlockSuccess extends AsebezaBlocState {
  final List asbeza;
  const AsbezaBlockSuccess({required this.asbeza});

  @override
  List<Object> get props => [asbeza];
}

class AllCartItemsState extends AsebezaBlocState {
  final List items;

  AllCartItemsState({required this.items});

  @override
  List<Object> get props => [items];
}

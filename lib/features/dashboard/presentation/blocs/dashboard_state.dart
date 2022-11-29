

import 'package:equatable/equatable.dart';
import 'package:swipe_cards/swipe_cards.dart';

abstract class DashBoradState extends Equatable {
  const DashBoradState();

  @override
  List<Object> get props => [];
}

class DataLoaderInitial extends DashBoradState {}

class DataLoading extends DashBoradState {}

class DataLoaded extends DashBoradState {
  final List<SwipeItem> mainData;

  const DataLoaded(this.mainData);
}

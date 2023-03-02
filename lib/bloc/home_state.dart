import 'package:api_call_with_bloc_pattern/model/home_model.dart';

abstract class HomeDataState {}

class HomeDataInitial extends HomeDataState {}

class HomeDataSuccess extends HomeDataState {
  final List<HomeModel> homeModel;

  HomeDataSuccess(this.homeModel);
}

class HomeDataError extends HomeDataState {
  final String error;

  HomeDataError(this.error);
}

class HomeDataLoading extends HomeDataState {}

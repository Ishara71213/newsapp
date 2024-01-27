part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class FilterSet extends HomeState {}

final class SearchSet extends HomeState {}

final class LoadingFaliure extends HomeState {}

final class PopularNewsFaliure extends HomeState {}

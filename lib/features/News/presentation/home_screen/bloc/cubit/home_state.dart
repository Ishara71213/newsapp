part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class LoadingSuccess extends HomeState {}

final class LoadingFaliure extends HomeState {}

final class PopularNewsSuccess extends HomeState {}

final class PopularNewsFaliure extends HomeState {}

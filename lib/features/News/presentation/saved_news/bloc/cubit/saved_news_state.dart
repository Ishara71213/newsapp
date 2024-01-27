part of 'saved_news_cubit.dart';

sealed class SavedNewsState extends Equatable {
  const SavedNewsState();

  @override
  List<Object> get props => [];
}

final class SavedNewsInitial extends SavedNewsState {}

final class SavedNewsLoading extends SavedNewsState {}

final class SavedNewsLodaingSuccess extends SavedNewsState {}

final class RefreshSuccess extends SavedNewsState {}

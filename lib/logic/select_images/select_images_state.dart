part of 'select_images_bloc.dart';

sealed class SelectImagesState extends Equatable {
  const SelectImagesState();

  @override
  List<Object> get props => [];
}

final class SelectImagesInitial extends SelectImagesState {}

final class SelectImagesLoading extends SelectImagesState {}

final class SelectImagesSuccess extends SelectImagesState {
  final List<File> images;

  SelectImagesSuccess({required this.images});
}

final class SelectImagesError extends SelectImagesState {
  final String message;

  SelectImagesError({required this.message});
}

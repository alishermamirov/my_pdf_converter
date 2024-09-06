part of 'convert_pdf_bloc.dart';

abstract class ConvertPdfEvent extends Equatable {
  const ConvertPdfEvent();

  @override
  List<Object> get props => [];
}

class OnConvertImageToPdf extends ConvertPdfEvent {
  final String title;
  final List<File> images;

  const OnConvertImageToPdf({
    required this.title,
    required this.images,
  });
  @override
  List<Object> get props => [title, images];
}

class ToInitialEvent extends ConvertPdfEvent {}

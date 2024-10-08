part of 'convert_pdf_bloc.dart';

sealed class ConvertPdfState extends Equatable {
  const ConvertPdfState();

  @override
  List<Object> get props => [];
}

final class ConvertPdfInitial extends ConvertPdfState {}

final class ConvertPdfloading extends ConvertPdfState {}

final class ConvertPdfSucces extends ConvertPdfState {
  final File file;
  final String title;
  const ConvertPdfSucces({required this.file, required this.title});
}

final class ConvertPdfError extends ConvertPdfState {
  final String message;

  const ConvertPdfError({required this.message});
}

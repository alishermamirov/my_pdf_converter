import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

import '../../constants/pdf_contants.dart';

part 'convert_pdf_event.dart';
part 'convert_pdf_state.dart';

class ConvertPdfBloc extends Bloc<ConvertPdfEvent, ConvertPdfState> {
  ConvertPdfBloc() : super(ConvertPdfInitial()) {
    on<OnConvertImageToPdf>(
      (event, emit) async {
        emit(ConvertPdfloading());
        try {
          final pdf = Document();
          if (event.images.isNotEmpty) {
            for (var i = 0; i < event.images.length; i++) {
              final image = await event.images[i].readAsBytes();
              pdf.addPage(
                index: i,
                Page(
                  pageTheme: pageTheme,
                  build: (context) => Center(
                    child: Image(
                      MemoryImage(image),
                    ),
                  ),
                ),
              );
            }
          } else {
            pdf.addPage(
              index: 0,
              Page(
                pageTheme: pageTheme,
                build: (context) => Center(
                  child: Text("Empty"),
                ),
              ),
            );
          }
          final file = await saveFile(pdf: pdf, title: event.title);

          await Future.delayed(const Duration(seconds: 1));
          emit(ConvertPdfSucces(file: file, title: event.title));
        } catch (e) {
          emit(ConvertPdfError(message: e.toString()));
        }
      },
    );
    on<ToInitialEvent>((event, emit) async {
      emit(ConvertPdfInitial());
    });
    on<OnOpenConvertedPdf>((event, emit) async {
      final path = event.file.path;
      OpenFile.open(path);
    });
  }

  Future<File> saveFile({
    required String title,
    required Document pdf,
  }) async {
    final root = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    log("${root!.path}/$title");
    final file = File("${root.path}/$title.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'select_images_event.dart';
part 'select_images_state.dart';

class SelectImagesBloc extends Bloc<SelectImagesEvent, SelectImagesState> {
  SelectImagesBloc() : super(SelectImagesInitial()) {
    on<onSelectImage>((event, emit) async {
      emit(SelectImagesLoading());
      List<File> images = [];
      try {
        final ImagePicker picker = ImagePicker();
        List<XFile?> pickedImages =
            await picker.pickMultiImage(imageQuality: 30);
        if (pickedImages.isNotEmpty) {
          for (var image in pickedImages) {
            if (image != null) {
              images.add(File(image.path));
            }
          }
        } else {
          add(onInitial());
        }
        emit(SelectImagesSuccess(images: images));
      } catch (e) {
        emit(SelectImagesError(message: e.toString()));
      }
    });
    on<onInitial>((event, emit) async {
      emit(SelectImagesLoading());
      emit(SelectImagesInitial());
    });
  }
}

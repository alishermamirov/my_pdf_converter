part of 'select_images_bloc.dart';

abstract class SelectImagesEvent extends Equatable {
  const SelectImagesEvent();

  @override
  List<Object> get props => [];
}

class onSelectImage extends SelectImagesEvent{
  
}
class onInitial extends SelectImagesEvent{

}
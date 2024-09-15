import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/utils/app_image_picker.dart';
part 'picke_image_state.dart';

class PickeImageCubit extends Cubit<PickeImageState> {
  PickeImageCubit() : super(PickeImageInitial());

  pickeImage({required AppImagePicker appImagePicker}) async {
    try {
      await appImagePicker.imagePicker(source: ImageSource.gallery);
      if (appImagePicker.image == null) {
        emit(PickeImageLoding());
      } else {
        emit(PickeImageCompelet());
      }
    } catch (e) {
      emit(PickeImageError());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_state.dart';
import 'package:convention/core/constants/app_consts.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ImagePicker _picker = ImagePicker();

  ProfileCubit() : super(ProfileInitial());

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final String imagePath = pickedFile.path;
        box.write('profileImage', imagePath);
        emit(ProfileImageUpdated(imagePath));
      }
    } catch (e) {
      throw (e);
    }
  }
}

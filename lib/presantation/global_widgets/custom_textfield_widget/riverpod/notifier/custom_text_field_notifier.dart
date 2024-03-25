




import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/custom_text_field_state.dart';

class CustomTextFieldNotifier extends StateNotifier<CustomTextFieldState>{
  CustomTextFieldNotifier() : super(const CustomTextFieldState());
  onVisiblePassword(){
    state = state.copyWith(onSecureText: state.onSecureText ? false : true);
  }
}

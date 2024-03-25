import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../notifier/custom_text_field_notifier.dart';
import '../state/custom_text_field_state.dart';

final customTextFieldProvider =
    StateNotifierProvider.autoDispose<CustomTextFieldNotifier, CustomTextFieldState>(
        (ref) => CustomTextFieldNotifier());


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../injection.dart';
import '../notifier/sign_up_notifier.dart';
import '../state/sign_up_state.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(signUpRepository),
);

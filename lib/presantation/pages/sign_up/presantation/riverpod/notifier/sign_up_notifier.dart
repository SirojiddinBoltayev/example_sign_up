import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../../../core/handlers/network_exception.dart';
import '../../../../../global_widgets/app_helpers.dart';
import '../../../repositories/sign_up_repository.dart';
import '../state/sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpRepository _signUpRepository;

  SignUpNotifier(this._signUpRepository) : super(const SignUpState());

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> signUp({
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
    VoidCallback? unAuthorised,
  }) async {
    state = state.copyWith(isLoading: true);

    // if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {

      String phoneNumber = phoneController.text.replaceAll(RegExp(r'[-()\s]'), '');
      final response = await _signUpRepository.register(
        name: nameController.text,
        phoneNumber: "+998$phoneNumber",

        password: passwordController.text,
        // passwordConfirmation: passwordConfirmationController.text,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLogin: true, isLoading: false, data: data);

          // AppHelpers.showMaterialBannerSuccess(message: data.data?.message.toString() ?? "");
          success?.call();

          // await LocalStorage.instance.setEmail(data.data?.user?.email);
          // await LocalStorage.instance.setUserName(data.data?.user?.name);
          // await LocalStorage.instance.setID(data.data?.user?.id);
          // await LocalStorage.instance.setPhoneNumber(
          //     data.data?.user?.phoneNumber);
        },
        failure: (failure, status,errorMessage) {
          state = state.copyWith(isLoading: false, isLoginError: true,errorMessage: errorMessage);

          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            unAuthorised?.call();
          }
log(errorMessage);
          AppHelpers.showMaterialBannerError(
              errorMessage: errorMessage.toString());
          if (
             ( !errorMessage.toString().toUpperCase().contains("PASSWORD"))
              &&
              !errorMessage.toString().toUpperCase().contains("PHONE")
              &&
              !errorMessage.toString().toUpperCase().contains("NAME")
          ) {
            AppHelpers.showMaterialBannerError(
                errorMessage: errorMessage.toString());
          }
          debugPrint('==> REGISTER failure: $failure');
        },
      );

  }

  textFormIsNotEmpty() {
    if (
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        // passwordConfirmationController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      state = state.copyWith(isValid: true);
    } else {
      state = state.copyWith(isValid: false);
    }
  }
}

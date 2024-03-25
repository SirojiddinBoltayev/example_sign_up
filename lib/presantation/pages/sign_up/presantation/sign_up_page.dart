// import 'package:first_open_project/constants/app_text_field_errors_status.dart';
// import 'package:first_open_project/presantation/global_widgets/custom_button_widget.dart';
// import 'package:first_open_project/service/localization/localization.dart';

// import '../../../../../core/imports/imports.dart';

// @RoutePage()
import 'package:example_sign_up/presantation/pages/sign_up/presantation/riverpod/provider/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_text_field_errors_status.dart';

import '../../../global_widgets/custom_button_widget.dart';
import '../../../global_widgets/custom_text_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();
  //
  // bool isChecked = false;
  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(signUpProvider.notifier);
    final state = ref.watch(signUpProvider);
    return Form(
      // key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.sp.verticalSpace,
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            // AppNavigator.pop();
                          },
                          child: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const Spacer(
                          flex: 7,
                        ),
                        Text(
                          '${"AppLocalization.getText(context)?.sign_up"}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(
                          flex: 11,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        28.sp.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${"AppLocalization.getText(context)?.create_an_account"}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ),

                        30.sp.verticalSpace,
                        CustomTextField(
                          controller: notifier.nameController,
                          title: "${"AppLocalization.getText(context)?.name"}",
                          labelText:
                              "${"AppLocalization.getText(context)?.enter_your_name"}",
                          errorText: AppTextFieldErrorsStatus.status(
                              state.errorMessage, "NAME"),
                          onChanged: (value) {
                            notifier.textFormIsNotEmpty();
                          },
                        ),
                        16.sp.verticalSpace,
                        CustomTextField(
                          controller: notifier.phoneController,
                          keyboardType: TextInputType.phone,
                          title:
                              "${"AppLocalization.getText(context)?.phone_number"}",
                          labelText: "",
                          errorText: AppTextFieldErrorsStatus.status(
                              state.errorMessage, "PHONE"),
                          onChanged: (value) {
                            notifier.textFormIsNotEmpty();
                          },
                        ),

                        16.sp.verticalSpace,
                        CustomTextField(
                          controller: notifier.passwordController,
                          title:
                              "${"AppLocalization.getText(context)?.password"}",
                          obscureText: true,
                          labelText:
                              "${"AppLocalization.getText(context)?.enter_your_password"}",
                          errorText: AppTextFieldErrorsStatus.status(
                              state.errorMessage, "PASSWORD"),
                          onChanged: (value) {
                            notifier.textFormIsNotEmpty();
                          },
                        ),
                        24.sp.verticalSpace,
                        CustomButtonWidget(
                          title:
                              '${"AppLocalization.getText(context)?.create_an_account"}',
                          isLoading: state.isLoading,
                          onTap: () async {
                            state.isLoading
                                ? null
                                : notifier.signUp(success: () {
                                    if (context.mounted) {
                                      // AppNavigator.pushAndPopUntil(
                                      //   OtpRoute(
                                      //     name: notifier.nameController.text,
                                      //     password:
                                      //         notifier.passwordController.text,
                                      //     phoneNumber:
                                      //         notifier.phoneController.text,
                                      //     isForgotPassword: false,
                                      //   ),
                                      // );
                                    }
                                  });
                          },
                        ),
                        // const OrSignInWidget(),
                        24.sp.verticalSpace,
                        // const TermsAndCondition(),
                      ],
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

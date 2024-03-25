import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../constants/app_colors.dart';
import '../../../../constants/app_colors.dart';
import 'custom_textfield_widget/riverpod/provider/custom_text_field_provider.dart';


class CustomTextField extends ConsumerWidget {
  final String title;
  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Color? textColor;
  final Function(String? value)? onChanged;
  final bool? enabled;
  final bool? requiredField;
  final bool? obscureText;
  final String? errorText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.labelText,
      this.onChanged,
      this.textColor,
      this.keyboardType,
      this.enabled = true,
      this.requiredField = false,
      this.obscureText,
      this.focusNode,
      this.errorText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(customTextFieldProvider.notifier);
    final state = ref.watch(customTextFieldProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:  AppColors.primaryColor),
            ),
            (requiredField ?? false) ? const Text(
              " *",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.red),
            ) : const SizedBox(),
          ],
        ),
        8.verticalSpace,
        TextFormField(
          enabled: enabled,
          onTap: () {
            FocusScope.of(context).requestFocus(focusNode);
          },

          // selectionHeightStyle:BoxHeightStyle,
          // focusNode: focusNode,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          controller: controller,
          obscuringCharacter: "*",
          style: keyboardType == TextInputType.phone || keyboardType == TextInputType.number
              ?  TextStyle(
                  color:textColor ??  AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)
              : null,
          inputFormatters: keyboardType == TextInputType.phone
              ? [MaskedInputFormatter('(##) ###-##-##')]
              : keyboardType == TextInputType.number
                  ? [
                      CurrencyInputFormatter(
                        // useSymbolPadding: true,
                        thousandSeparator:
                            ThousandSeparator.SpaceAndPeriodMantissa,
                        mantissaLength: 0,
                        leadingSymbol: "",
                        // trailingSymbol: " UZS"
                      )
                    ]
                  : [],
          obscureText: (obscureText ?? false) ? state.onSecureText : false,
          decoration: InputDecoration(
              suffixIcon: obscureText ?? false
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          notifier.onVisiblePassword();
                        },
                        child: state.onSecureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    )
                  : null,
              // filled: true,
              prefixIcon: keyboardType == TextInputType.phone
                  ?  Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 4),
                      child: Text(
                        "+998",
                        style: TextStyle(
                            color: textColor ?? AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : null,
              prefixStyle: const TextStyle(color: AppColors.primaryColor),
              prefixIconColor: AppColors.primaryColor,
              prefixIconConstraints: const BoxConstraints.tightForFinite(),
              // prefixStyle: TextStyle,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: keyboardType == TextInputType.phone ? "" : labelText,
              hintStyle: const TextStyle(color: Colors.black54),
              errorText: errorText),
          validator: (value) {
            if (value == null) {
              return 'Enter the email';
            } else if (!value.contains('@')) {
              return 'Enter a valid email';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            if ((keyboardType == TextInputType.phone) &&
                controller.text.length !=
                    MaskedInputFormatter('(##) ###-##-##').mask.length) {
              // return "Telefon raqamni to'liq kirizing";
            }
            onChanged?.call(value);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FancyOTPFormField extends StatelessWidget {
  final TextEditingController? controller;
  final int? length;
  final Color inputColor;
  const FancyOTPFormField(
      {Key? key, this.controller, this.length = 4, required this.inputColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) {
        var fieldWidth =
            (MediaQuery.of(context).size.width) / ((length ?? 4) * 1.4);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                errorText: field.errorText,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                  fieldWidth: fieldWidth,
                  fieldHeight: fieldWidth,
                  borderWidth: 2.0,
                  errorBorderColor: Theme.of(context).errorColor,
                  activeColor: Theme.of(context).primaryColor,
                  activeFillColor: Colors.transparent,
                  selectedColor: Theme.of(context).primaryColor,
                  selectedFillColor: Colors.transparent,
                  inactiveColor: Colors.black,
                  inactiveFillColor: Colors.transparent,
                ),
                controller: controller,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                backgroundColor: Colors.transparent,
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                enablePinAutofill: true,
                textStyle: TextStyle(
                  color: inputColor,
                ),
                length: length ?? 4,
                appContext: context,
                onChanged: (value) => field.didChange(value),
              ),
            ),
          ),
        );
      },
    );
  }
}

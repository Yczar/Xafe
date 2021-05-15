import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class XafeButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  XafeButton({
    @required VoidCallback onPressed,
    @required this.text,
    this.filledButton = true,
    this.isLoading = false,
    bool isDisabled,
  })  : _onPressed = onPressed,
        _isDisabled = isDisabled ?? false;

  final String text;
  final bool filledButton;
  final bool isLoading, _isDisabled;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Container(
        width: double.infinity,
        height: context.scaleY(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kColorBlue,
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(kColorWhite),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: kColorWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

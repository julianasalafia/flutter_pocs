import 'package:flutter/cupertino.dart';

abstract class SignUpPageViewModel {
  final TextEditingController name;

  const SignUpPageViewModel({
    required this.name,
  });
}

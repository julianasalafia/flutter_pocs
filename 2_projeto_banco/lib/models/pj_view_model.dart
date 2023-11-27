import 'package:flutter/material.dart';
import 'package:projeto_banco/models/sign_up_page_view_model.dart';

class PjViewModel extends SignUpPageViewModel {
  final TextEditingController cnpj;

  PjViewModel({required super.name, required this.cnpj});

  factory PjViewModel.create() {
    return PjViewModel(
      name: TextEditingController(),
      cnpj: TextEditingController(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_banco/models/sign_up_page_view_model.dart';

class PfViewModel extends SignUpPageViewModel {
  final TextEditingController cpf;

  PfViewModel({required super.name, required this.cpf});

  factory PfViewModel.create() {
    return PfViewModel(
      name: TextEditingController(),
      cpf: TextEditingController(),
    );
  }
}

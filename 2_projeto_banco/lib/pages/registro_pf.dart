import 'package:flutter/material.dart';
import 'package:projeto_banco/models/pf_view_model.dart';

class RegistroPf extends StatelessWidget {
  final PfViewModel viewModel;
  const RegistroPf({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Nome:'),
          TextField(controller: viewModel.name),
          const Text('CPF:'),
          TextField(controller: viewModel.cpf),
        ],
      ),
    );
  }
}

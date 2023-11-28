import 'package:flutter/material.dart';

import '../models/pj_view_model.dart';

class RegistroPj extends StatelessWidget {
  final PjViewModel viewModel;
  const RegistroPj({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Nome:'),
          TextField(controller: viewModel.name),
          const Text('CNPJ:'),
          TextField(controller: viewModel.cnpj),
          TextButton(
            onPressed: () {
              print(viewModel.name.text);
              print(viewModel.cnpj.text);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}

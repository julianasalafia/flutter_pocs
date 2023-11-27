import 'package:flutter/material.dart';
import 'package:projeto_banco/models/pf_view_model.dart';
import 'package:projeto_banco/pages/registro_pf.dart';
import 'package:projeto_banco/pages/registro_pj.dart';

import 'models/pj_view_model.dart';
import 'models/sign_up_page_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: '',
        pfViewModel: PfViewModel.create(),
        pjViewModel: PjViewModel.create(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title, required this.pfViewModel, required this.pjViewModel});

  final String title;
  late SignUpPageViewModel signUpPageViewModel;
  final PfViewModel pfViewModel;
  final PjViewModel pjViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: const Text('PF'),
            onPressed: () {
              signUpPageViewModel = pfViewModel;

              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPf(viewModel: pfViewModel)));
            },
          ),
          TextButton(
            child: const Text('PJ'),
            onPressed: () {
              signUpPageViewModel = pjViewModel;
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPj(viewModel: pjViewModel)));
            },
          ),
        ],
      ),
    );
  }
}

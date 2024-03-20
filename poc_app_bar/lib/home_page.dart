import 'package:flutter/material.dart';

class TelaComSliverAppBar extends StatefulWidget {
  @override
  State<TelaComSliverAppBar> createState() => _TelaComSliverAppBarState();
}

class _TelaComSliverAppBarState extends State<TelaComSliverAppBar> {
  final ValueNotifier<bool> _showTitle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: LayoutBuilder(builder: (context, constraints) {
                if (mounted)  _showTitle.value = constraints.maxHeight < 150.0;
                return const Text('Título Fixo', style: TextStyle(color: Colors.red));
              }),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _showTitle,
                  builder: (context, showTitle, child) {

                    return showTitle
                        ? const SizedBox.shrink()
                        : const SizedBox(
                      height: 30.0,
                      child: Center(
                        child: Divider(),
                      ),
                    );
                  },
                ),

                Text(
                  'Aqui vai o seu longo conteúdo de texto que deve ser rolável junto com o resto da página, mas mantendo o app bar fixo com o título no topo. ' * 50,
                  style: const TextStyle(fontSize: 16.0),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

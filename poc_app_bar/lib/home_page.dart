import 'package:flutter/material.dart';
import 'package:poc_app_bar/sliver_app_bar_delegate.dart';

class TelaComSliverAppBar extends StatefulWidget {
  @override
  State<TelaComSliverAppBar> createState() => _TelaComSliverAppBarState();
}

class _TelaComSliverAppBarState extends State<TelaComSliverAppBar> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isAppBarExpanded = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      _isAppBarExpanded.value = _scrollController.hasClients && _scrollController.offset > (150 - kToolbarHeight);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            surfaceTintColor: Colors.white,
            elevation: 0,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Flutter Roadmap', style: TextStyle(color: Colors.black54)),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 1,
              maxHeight: 1,
              child: ValueListenableBuilder(
                valueListenable: _isAppBarExpanded,
                builder: (_, __, ___) {
                  return Container(
                    color: _isAppBarExpanded.value ? Colors.black54 : Colors.transparent,
                  );
                }
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
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

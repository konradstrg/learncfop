import 'package:flutter/material.dart';

class AlgorithmPage extends StatelessWidget {
  final String title;
  final SliverList algorithmSliverList;

  const AlgorithmPage({
    super.key,
    required this.title,
    required this.algorithmSliverList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text(title)),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            sliver: algorithmSliverList,
          ),
        ],
      ),
    );
  }
}

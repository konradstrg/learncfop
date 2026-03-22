import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/algorithm.dart';
import '../../data/state/algorithms_provider.dart';
import '../../ui/widgets/algorithm_card.dart';
import '../../ui/widgets/algorithm_page.dart';
import '../../ui/widgets/error.dart';

class PLLPage extends StatelessWidget {
  const PLLPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? algorithms = context
        .watch<AlgorithmsProvider>()
        .getAlgorithmsWhereIdContains("pll");

    return AlgorithmPage(
      title: "Instant Permutation of Last Layer",
      algorithmSliverList: algorithms != null && algorithms.isNotEmpty
          ? SliverList.separated(
              itemCount: algorithms.length,
              itemBuilder: (context, index) =>
                  AlgorithmCard(algorithm: algorithms[index]),
              separatorBuilder: (context, index) => SizedBox(height: 16),
            )
          : SliverList(delegate: SliverChildListDelegate([ErrorMessage()])),
    );
  }
}

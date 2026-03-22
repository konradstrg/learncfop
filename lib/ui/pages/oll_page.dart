import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/algorithm.dart';
import '../../data/state/algorithms_provider.dart';
import '../../ui/widgets/algorithm_card.dart';
import '../../ui/widgets/algorithm_page.dart';
import '../../ui/widgets/error.dart';

class OLLPage extends StatelessWidget {
  const OLLPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? algorithms = context
        .watch<AlgorithmsProvider>()
        .getAlgorithmsWhereIdContains("oll");

    return AlgorithmPage(
      title: "Instant Orientation of Last Layer",
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

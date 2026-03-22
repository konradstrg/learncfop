import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/algorithm.dart';
import '../../data/state/algorithms_provider.dart';
import '../../ui/pages/edit_algorithm_page.dart';
import '../../ui/widgets/oll_case_icon.dart';
import '../../ui/widgets/pll_case_icon.dart';

class AlgorithmCard extends StatelessWidget {
  final Algorithm algorithm;

  const AlgorithmCard({super.key, required this.algorithm});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onLongPress: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditAlgorithmPage(algorithm: algorithm),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                child: algorithm is OLLAlgorithm
                    ? OLLCaseIcon(
                        caseConfiguration:
                            (algorithm as OLLAlgorithm).caseConfiguration,
                      )
                    : PLLCaseIcon(
                        caseConfiguration:
                            (algorithm as PLLAlgorithm).caseConfiguration,
                        arrows: (algorithm as PLLAlgorithm).arrows,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            algorithm.label,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      algorithm.algorithm,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 2),
                    algorithm.notes != null
                        ? Text(algorithm.notes!)
                        : const SizedBox(),
                  ],
                ),
              ),
              IconButton(
                onPressed: () =>
                    context.read<AlgorithmsProvider>().togglePinned(algorithm),
                icon: algorithm.isPinned
                    ? Icon(
                        Icons.push_pin,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : Icon(Icons.push_pin_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../data/model/algorithm.dart';
import '../../ui/widgets/oll_case_icon.dart';
import '../../ui/widgets/pll_case_icon.dart';

class EditAlgorithmPage extends StatelessWidget {
  final Algorithm algorithm;

  const EditAlgorithmPage({super.key, required this.algorithm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit algorithm")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(64, 0, 64, 16),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: SizedBox(
                        height: 128,
                        width: 128,
                        child: algorithm is OLLAlgorithm
                            ? OLLCaseIcon(
                                caseConfiguration: (algorithm as OLLAlgorithm)
                                    .caseConfiguration,
                              )
                            : PLLCaseIcon(
                                caseConfiguration: (algorithm as PLLAlgorithm)
                                    .caseConfiguration,
                                arrows: (algorithm as PLLAlgorithm).arrows,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(top: 12, left: 80, child: Text(algorithm.id)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: OutlinedButton.icon(
                    label: Text("Rotate View"),
                    icon: Icon(Icons.rotate_left),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface,
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 12),
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Label"),
                      icon: Icon(Icons.label_outlined),
                    ),
                    initialValue: algorithm.label,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Algorithm"),
                      icon: Icon(Icons.change_circle_outlined),
                    ),
                    maxLines: 5,
                    minLines: 1,
                    initialValue: algorithm.algorithm,
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        Chip(label: Text("Clear")),
                        Chip(label: Text("F")),
                        Chip(label: Text("R")),
                        Chip(label: Text("L")),
                        Chip(label: Text("U")),
                        Chip(label: Text("D")),
                        Chip(label: Text("M")),
                        Chip(label: Text("2")),
                        Chip(label: Text("'")),
                        Chip(label: Text("f")),
                        Chip(label: Text("r")),
                        Chip(label: Text("l")),
                        Chip(label: Text("(")),
                        Chip(label: Text(")")),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Notes"),
                      icon: Icon(Icons.notes_outlined),
                    ),
                    maxLines: 5,
                    minLines: 1,
                    initialValue: algorithm.notes,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

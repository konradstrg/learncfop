import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/algorithm.dart';
import '../../data/state/algorithms_provider.dart';
import '../../ui/pages/info_page.dart';
import '../../ui/pages/theme_page.dart';
import '../../ui/theme/theme.dart';
import '../../ui/widgets/algorithm_card.dart';
import '../../ui/widgets/username.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? pinned = context
        .watch<AlgorithmsProvider>()
        .getPinnedAlgorithms();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            systemOverlayStyle: transparentSystemUiOverlayStyle,
            title: Row(children: [Text("Welcome, "), Username()]),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemePage()),
                ),
                icon: const Icon(Icons.color_lens_outlined),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                ),
                icon: const Icon(Icons.info_outlined),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            sliver: pinned != null && pinned.isNotEmpty
                ? SliverList.separated(
                    itemCount: pinned.length,
                    itemBuilder: (context, index) =>
                        AlgorithmCard(algorithm: pinned[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  )
                : SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 32),
                          Text(
                            "Pin the algorithms you always forget to the Home page by clicking",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Icon(
                            Icons.push_pin_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

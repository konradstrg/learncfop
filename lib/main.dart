import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'data/persistence/hive_algorithm_repository.dart';
import 'data/persistence/preferences.dart';
import 'data/state/algorithms_provider.dart';
import 'data/state/username_provider.dart';
import 'data/state/theme_color_provider.dart';
import 'data/state/font_provider.dart';
import 'logic/initialize_algorithms.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/oll_page.dart';
import 'ui/pages/oll2look_page.dart';
import 'ui/pages/pll_page.dart';
import 'ui/pages/pll2look_page.dart';
import 'ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
    ),
  );

  // Load user preferences:
  Preferences.init();

  // Start persistent storage service
  final algorithmRepository = HiveAlgorithmRepository();
  await algorithmRepository.startup();

  // Initialize on first launch:
  if (await Preferences.isFirstLaunch()) {
    await initializeAlgorithms(algorithmRepository);
    await Preferences.markAsLaunchedBefore();
  }

  // Create providers:
  final algorithmProvider = AlgorithmsProvider(algorithmRepository);
  await algorithmProvider.loadAlgorithms();
  final usernameProvider = UsernameProvider();
  await usernameProvider.loadUsername();
  final themeColorProvider = ThemeColorProvider();
  await themeColorProvider.loadThemeColor();
  final fontProvider = FontProvider();
  await fontProvider.loadFont();

  runApp(
    MultiProvider(
      // Apply providers:
      providers: [
        ChangeNotifierProvider(create: (context) => algorithmProvider),
        ChangeNotifierProvider(create: (context) => usernameProvider),
        ChangeNotifierProvider(create: (context) => themeColorProvider),
        ChangeNotifierProvider(create: (context) => fontProvider),
      ],
      // Start app:
      child: const LearnCFOPApp(),
    ),
  );
}

class LearnCFOPApp extends StatefulWidget {
  const LearnCFOPApp({super.key});

  @override
  State<LearnCFOPApp> createState() => _LearnCFOPAppState();
}

class _LearnCFOPAppState extends State<LearnCFOPApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        body: [
          HomePage(),
          OLL2LookPage(),
          OLLPage(),
          PLL2LookPage(),
          PLLPage(),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) =>
              setState(() => currentPageIndex = index),
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.keyboard_double_arrow_up),
              label: "OLL2Look",
            ),
            NavigationDestination(
              icon: Icon(Icons.keyboard_arrow_up),
              label: "OLL",
            ),
            NavigationDestination(
              icon: Icon(Icons.sync, size: 22),
              label: "PLL2Look",
            ),
            NavigationDestination(
              icon: Icon(Icons.replay, size: 22),
              label: "PLL",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/state/theme_color_provider.dart';
import '../../ui/theme/theme.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose your Theme")),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        itemCount: themeColors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final isActive =
              context.watch<ThemeColorProvider>().themeColor.toARGB32() ==
              themeColors[index].toARGB32();
          return ClipRRect(
            borderRadius: BorderRadius.circular(isActive ? 16 : 128),
            child: Material(
              color: themeColors[index],
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: getRippleColorFromBackground(themeColors[index]),
                onTap: () => context.read<ThemeColorProvider>().setThemeColor(
                  themeColors[index],
                ),
                child: isActive
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

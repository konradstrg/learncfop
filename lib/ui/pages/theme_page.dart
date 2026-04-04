import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/state/theme_color_provider.dart';
import '../../data/state/font_provider.dart';
import '../../ui/theme/theme.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appearance")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              "Choose your theme color:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              itemCount: themeColors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
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
                      splashColor: getRippleColorFromBackground(
                        themeColors[index],
                      ),
                      onTap: () => context
                          .read<ThemeColorProvider>()
                          .setThemeColor(themeColors[index]),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose your font:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                DropdownMenu<String>(
                  initialSelection: context.watch<FontProvider>().font,
                  menuStyle: MenuStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: "Standard",
                      label: "Standard",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(fontFamily: ""),
                        ),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: "Galindo",
                      label: "Galindo",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: "Galindo",
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: "Orbitron",
                      label: "Orbitron",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: "Orbitron",
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: "Fraunces",
                      label: "Fraunces",
                      style: ButtonStyle(
                        textStyle: WidgetStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: "Fraunces",
                          ),
                        ),
                      ),
                    ),
                  ],
                  onSelected: (selection) =>
                      context.read<FontProvider>().setFont(selection!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

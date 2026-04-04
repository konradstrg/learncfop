import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/theme/theme.dart';
import '../../ui/widgets/easter_egg.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              EasterEgg(),
              const SizedBox(height: 32, width: double.infinity),
              Text(
                "made by konradstrg",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Text(
                "This app is open source.\nMake it even better:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                label: const Text("Link to GitHub"),
                icon: const FaIcon(FontAwesomeIcons.github),
                style: coloredTextButtonStyle(
                  Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () async => await launchUrl(
                  Uri.parse("https://github.com/kstrenge/learncfop"),
                ),
              ),
              TextButton.icon(
                label: const Text("Report bug / error"),
                icon: Icon(Icons.bug_report),
                style: coloredTextButtonStyle(
                  Theme.of(context).colorScheme.error,
                ),
                onPressed: () async => await launchUrl(
                  Uri.parse("https://github.com/kstrenge/learncfop/issues"),
                ),
              ),
              TextButton.icon(
                label: const Text("Suggest feature"),
                icon: const Icon(Icons.lightbulb),
                style: coloredTextButtonStyle(
                  Theme.of(context).colorScheme.primary,
                ),
                onPressed: () async => await launchUrl(
                  Uri.parse("https://github.com/kstrenge/learncfop/issues"),
                ),
              ),
              Spacer(),
              Text("Version 2.1", style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 8),
              TextButton.icon(
                label: const Text("Privacy Policy"),
                icon: const Icon(Icons.description),
                style: coloredTextButtonStyle(
                  Theme.of(context).colorScheme.tertiary,
                ),
                onPressed: () async => await launchUrl(
                  Uri.parse("https://konstr.de/learncfop/privacy"),
                ),
              ),
              TextButton.icon(
                label: const Text("Open Source Licences"),
                icon: const Icon(Icons.description),
                style: coloredTextButtonStyle(
                  Theme.of(context).colorScheme.tertiary,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LicensePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cancel_outlined,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: 8),
            Text(
              "Error while loading algorithms.\nReset algorithms in settings.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

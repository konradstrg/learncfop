import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/state/username_provider.dart';

class Username extends StatefulWidget {
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = context.watch<UsernameProvider>().username;
    return Expanded(
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: "cuber",
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        style: DefaultTextStyle.of(
          context,
        ).style.copyWith(color: Theme.of(context).colorScheme.primary),
        onChanged: (newInput) =>
            context.read<UsernameProvider>().setUsername(newInput),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

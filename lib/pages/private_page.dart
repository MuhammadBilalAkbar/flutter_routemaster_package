import 'package:flutter/material.dart';

class PrivatePage extends StatelessWidget {
  final String? message;

  const PrivatePage({super.key, this.message});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            title: const Text('Private Page'),
          ),
          body: Text(message ?? ''),
        ),
      );
}

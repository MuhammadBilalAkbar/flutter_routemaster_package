import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Not Found Page'),
        ),
        body: ListView(
          children: const [
            Text('Not Found Page'),
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () => Routemaster.of(context).replace('/two'),
              child: const Text('Replace page two'),
            ),
            ElevatedButton(
              onPressed: () => Routemaster.of(context).push('/two'),
              child: const Text('Push page two'),
            ),
            ElevatedButton(
              onPressed: () => Routemaster.of(context).push('/one/two'),
              child: const Text('Push /one/two'),
            ),
            ElevatedButton(
              onPressed: () => Routemaster.of(context).push(
                '/_private',
                queryParameters: {
                  'message': 'private page pushed from page one'
                },
              ),
              child: const Text('Push private page'),
            ),
            ElevatedButton(
              onPressed: () => Routemaster.of(context).replace(
                '/_private',
                queryParameters: {
                  'message': 'private page replaced from page one'
                },
              ),
              child: const Text('Replace private page'),
            ),
          ],
        ),
      );
}

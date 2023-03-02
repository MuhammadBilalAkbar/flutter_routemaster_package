import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 20,
          ),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () => Routemaster.of(context).replace('/two'),
                child: const Text('Replace page two'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('/two'),
                child: const Text('Push page two'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('/one/two'),
                child: const Text('Push /one/two'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push(
                  '/_private',
                  queryParameters: {
                    'message': 'private page pushed from page one'
                  },
                ),
                child: const Text('Push private page'),
              ),
              const SizedBox(height: 20),
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
        ),
      );
}

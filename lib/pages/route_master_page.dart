import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RouteMasterPage extends StatelessWidget {
  const RouteMasterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Route Master Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 20,
          ),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () => Routemaster.of(context).replace('/one'),
                child: const Text('Replace page one'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('/one'),
                child: const Text('Push page one'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('/tabs'),
                child: const Text('Replace tabs'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push(
                  '/_private?',
                  queryParameters: {
                    'message': 'private page pushed from RouteMasterPage'
                  },
                ),
                child: const Text('Push private page'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).replace('/asdf'),
                // 'asdf' is not defined in RoutesBuilder.
                child: const Text('Unknown route'),
              ),
            ],
          ),
        ),
      );
}

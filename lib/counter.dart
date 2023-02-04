import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:mohsin/provider/counter_state.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterState>(builder: (context, provider, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: provider.counter,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            "Counter",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.count.toString(),
                style: TextStyle(
                  fontSize: 42,
                ),
              ),
              Text(
                "Counter",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

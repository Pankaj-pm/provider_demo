import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/counter_provider.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      child: Text("hel;lo"),
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      // floatingActionButton: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     FloatingActionButton(
      //         onPressed: () {
      //           Provider.of<CounterProvider>(context,listen: false).increment();
      //         },
      //         child: Icon(Icons.add)),
      //     FloatingActionButton(
      //       heroTag: "kk",
      //         onPressed: () {
      //           Provider.of<CounterProvider>(context,listen: false).decrement();
      //         },
      //         child: Icon(Icons.remove)),
      //   ],
      // ),
    );
  }
}

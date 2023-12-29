import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/counter_provider.dart';
import 'package:provider_demo/home/provider/platform_provider.dart';
import 'package:provider_demo/home/view/next_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (context, platformProvider, child) {
        if (platformProvider.isAndroid) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            body: Center(
              child: Column(
                children: [
                  Consumer<CounterProvider>(
                    builder: (context, counterProvider, child) {
                      return Text(
                        "${counterProvider.count}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  CupertinoActivityIndicator(
                    color: Colors.red,
                    radius: 20,
                  ),
                  CupertinoButton.filled(child: Text("Ok"), onPressed: () {

                  },pressedOpacity: 0.1),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPage(),
                            ));
                      },
                      child: Text("Next"))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                heroTag: "hh",
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false).increment();
                  Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                },
                child: Icon(Icons.add)),
          );
        } else {
          return CupertinoPageScaffold(
            child: SafeArea(
              child: Column(
                children: [
                  Consumer<CounterProvider>(
                    builder: (context, counterProvider, child) {
                      return Text(
                        "${counterProvider.count}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  CupertinoActivityIndicator(
                    color: Colors.red,
                  ),
                  CupertinoButton.filled(child: Text("Ok"), onPressed: () {

                  },pressedOpacity: 0.1),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => NextPage(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(

                      ),
                      onFocusChange: (value) {
                        print("onFocusChange ");
                      },
                      child: Text("Next"))
                  ,ElevatedButton(
                      onPressed: () {
                        Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => NextPage(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(

                      ),
                      child: Text("Next"))
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

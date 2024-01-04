import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/bottom_nav_provider.dart';

class BottomNave extends StatelessWidget {
  const BottomNave({super.key});

  @override
  Widget build(BuildContext context) {
    print("BottomNave==>");
    Provider.of<BottomNavProvider>(context, listen: false).startTimer();
    return Scaffold(
      appBar: AppBar(),
      // body: PageView(
      //   controller: Provider.of<BottomNavProvider>(context,listen: false).pcontroller,
      //   onPageChanged: (value) {
      //     Provider.of<BottomNavProvider>(context,listen: false).changeIndex(value);
      //   },
      //   children: [
      //     Container(
      //       color: Colors.red,
      //       child: Text("Home"),
      //     ),
      //     Container(
      //       color: Colors.blueAccent,
      //       child: Text("Message"),
      //     ),
      //     Container(
      //       color: Colors.blueGrey,
      //       child: Text("Setting"),
      //     ),
      //     Container(
      //       color: Colors.yellow,
      //       child: Text("Home"),
      //     ),
      //     Container(
      //       color: Colors.red,
      //       child: Text("Home"),
      //     )
      //   ],
      // ),
      // body: PageView.builder(
      //   itemCount: 5,
      //   controller: Provider.of<BottomNavProvider>(context,listen: false).pcontroller,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Text("Index $index"),
      //           IconButton(onPressed: () {
      //             var bnp = Provider.of<BottomNavProvider>(context, listen: false);
      //             var ci=++bnp.cIndex;
      //             if(ci<5){
      //               bnp.pcontroller
      //                   .animateToPage(++bnp.cIndex, duration: Duration(milliseconds: 100), curve: Curves.linear);
      //               bnp.changeIndex(bnp.cIndex);
      //             }
      //
      //           }, icon: Icon(Icons.chevron_right))
      //         ],
      //       ),
      //     );
      //   },
      // ),
      body: Container(
        height: 250,
        child: PageView.builder(
            controller: Provider.of<BottomNavProvider>(context, listen: false).pcontroller,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black54),
                child: Center(child: Text("$index")),
              );
            },
            itemCount: 5),
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, bottomNavProvider, child) => BottomNavigationBar(
          currentIndex: bottomNavProvider.cIndex,
          onTap: (value) {
            bottomNavProvider.changeIndex(value);
            Provider.of<BottomNavProvider>(context, listen: false)
                .pcontroller
                .animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.linear);
            print("object $value");
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // iconSize: 80,

          // backgroundColor: Colors.grey,
          // fixedColor: Colors.red,
          // unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
              tooltip: "Hey",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline),
              activeIcon: Icon(Icons.message),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_input_svideo),
              activeIcon: Icon(Icons.settings),
              label: "Setting",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              activeIcon: Icon(Icons.message),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }
}

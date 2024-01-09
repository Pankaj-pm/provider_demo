// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/platform_provider.dart';

class SliverDemo extends StatefulWidget {
  const SliverDemo({super.key});

  @override
  State<SliverDemo> createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (BuildContext context, value, Widget? child) {
        var isAndroid = Provider.of<PlatformProvider>(context).isAndroid;
        if (isAndroid) {
          return Scaffold(
            // appBar: AppBar(),
            // body: SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Text("Title"),
            //       Container(
            //         height: 50,
            //         width: 50,
            //         color: Colors.black12,
            //       ),
            //       ListView.builder(
            //         itemBuilder: (context, index) => ListTile(title: Text("Title $index")),
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 5,
            //       ),
            //       Text("Title 2"),
            //       ListView.builder(
            //         itemBuilder: (context, index) => ListTile(title: Text("Title $index")),
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 5,
            //       ),
            //       Text("Title 2"),
            //       ListView.builder(
            //         itemBuilder: (context, index) => ListTile(title: Text("Title $index")),
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 5,
            //       ),
            //     ],
            //   ),
            // ),
            body: RefreshIndicator(
              onRefresh: () async {
                print("refresh");
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text("Hello"),
                      centerTitle: false,
                      collapseMode: CollapseMode.pin,
                      background: Image.network(
                        "https://miro.medium.com/v2/resize:fit:720/format:webp/0*Znj-04sinj7rfY3i",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList.list(children: [Text("Title")]),
                  SliverList.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Index $index"),
                      );
                    },
                  ),
                  SliverGrid.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(color: Colors.red);
                    },
                  ),
                  SliverList.list(children: [Text("Title")]),
                  SliverList.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Index $index"),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Title"),
                  middle: Text("Middle Title"),
                  trailing: Icon(CupertinoIcons.add),
                  stretch: true,
                  // alwaysShowMiddle: false,
                ),
                SliverFillRemaining(
                    child: Column(
                  children: [
                    Text("Hello"),
                    CupertinoListTile(
                      title: Text("Title"),
                      subtitle: Text("Sub title"),
                      additionalInfo: Text("Info"),
                      onTap: () {

                      },
                      trailing: Icon(CupertinoIcons.add),
                      // backgroundColorActivated: Colors.red,
                      leading: Icon(CupertinoIcons.airplane),
                      // leadingSize: 15,
                      leadingToTitle: 10,

                    ),
                    CupertinoListSection(
                      header: Text("Header"),
                      children: [
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                      ],
                    ),
                    CupertinoListSection(
                      header: Text("Header"),
                      footer: Text("Footer"),
                      hasLeading: false,
                      children: [
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                        CupertinoListTile(
                          title: Text("Title"),
                          subtitle: Text("Sub title"),
                          additionalInfo: Text("Info"),
                          onTap: () {

                          },
                          trailing: Icon(CupertinoIcons.add),
                          // backgroundColorActivated: Colors.red,
                          leading: Icon(CupertinoIcons.airplane),
                          // leadingSize: 15,
                          leadingToTitle: 10,

                        ),
                      ],
                    )


                  ],
                )),
              ],
            ),
          );
        }
      },
    );
  }
}

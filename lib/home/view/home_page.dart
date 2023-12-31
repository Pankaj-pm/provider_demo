// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/counter_provider.dart';
import 'package:provider_demo/home/provider/platform_provider.dart';
import 'package:provider_demo/home/view/bottom_nav.dart';
import 'package:provider_demo/home/view/next_page.dart';
import 'package:provider_demo/home/view/sliver_page.dart';

class HomePage extends StatelessWidget {
  final format = DateFormat("dd -MM -yyyy");

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (con, platformProvider, child) {
        if (platformProvider.isAndroid) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home Page 11"),
              actions: [
                Switch(
                  value: platformProvider.isAndroid,
                  onChanged: (value) {
                    platformProvider.changePlatform();
                  },
                )
              ],
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
                  Consumer<CounterProvider>(
                    builder: (context, counterProvider, child) {
                      var dateTime = counterProvider.dateTime;
                      return Text(
                        format.format(dateTime),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  CupertinoActivityIndicator(
                    color: Colors.red,
                    radius: 20,
                  ),
                  CupertinoButton.filled(
                      child: Text("Ok"),
                      onPressed: () async {
                        await showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            color: Colors.white,
                            height: 300,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (value) {
                                Provider.of<CounterProvider>(context, listen: false).changeDate(value);
                                print(value);
                              },
                              dateOrder: DatePickerDateOrder.mdy,
                              // mode: CupertinoDatePickerMode.mothYear,
                              use24hFormat: false,
                            ),
                          ),
                        );
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2024, 1, 5),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );

                        var timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          // initialEntryMode: TimePickerEntryMode.dialOnly,
                          builder: (context, child) => MediaQuery(
                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          ),
                          /*confirmText: "okl",
                          hourLabelText: "ooo"*/
                          // initialEntryMode: TimePickerEntryMode.dialOnly
                        );
                        if (selectedDate != null) {
                          // selectedDate=selectedDate.add(Duration(hours: timeOfDay?.hour ?? 0, minutes: timeOfDay?.minute ?? 0));
                          selectedDate = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            timeOfDay?.hour ?? 0,
                            timeOfDay?.minute ?? 0,
                          );
                        }

                        print(selectedDate.toString());
                        print(timeOfDay.toString());
                      },
                      pressedOpacity: 0.1),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SliverDemo(),
                            ));
                      },
                      child: Text("Sliver")),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                      },
                      child: Text("Change Theme")),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            // barrierColor: Colors.red,
                            isDismissible: false,
                            enableDrag: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.red, width: 10)),
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BackButton(),
                                  Container(
                                    width: double.infinity,
                                    height: 300,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: Colors.grey),
                                    padding: EdgeInsetsDirectional.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Title", style: TextStyle(color: Colors.red)),
                                        Text("Desc " * 50, style: TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => NextPage(),
                          //     ));
                        },
                        child: Text("Next"));
                  }),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("Title"),
                                content: Text("Hello Good morning"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Next"));
                  }),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                heroTag: "hh",
                onPressed: () {
                  // Provider.of<CounterProvider>(context, listen: false).increment();
                  Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => BottomNave(),
                  //     ));
                },
                child: Icon(Icons.remove)),
          );
        } else {
          // return CupertinoPageScaffold(
          //   child: SafeArea(
          //     child: Column(
          //       children: [
          //         Consumer<CounterProvider>(
          //           builder: (context, counterProvider, child) {
          //             return Text(
          //               "${counterProvider.count}",
          //               style: Theme.of(context).textTheme.headlineMedium,
          //             );
          //           },
          //         ),
          //         CupertinoActivityIndicator(
          //           color: Colors.red,
          //         ),
          //         CupertinoButton.filled(child: Text("Ok"), onPressed: () {}, pressedOpacity: 0.1),
          //         Builder(builder: (context) {
          //           return ElevatedButton(
          //               onPressed: () {
          //                 // for cupertino IOS
          //                 showCupertinoModalPopup(
          //                   context: context,
          //                   builder: (context) {
          //                     return CupertinoActionSheet(
          //                       title: Text("Iphone"),
          //                       message: Text("Buy product"),
          //                       actions: [
          //                         CupertinoActionSheetAction(
          //                           onPressed: () {},
          //                           child: Text("Option 1"),
          //                           isDefaultAction: true,
          //                         ),
          //                         CupertinoActionSheetAction(
          //                           onPressed: () {},
          //                           child: Text("Option 2"),
          //                         ),
          //                         CupertinoActionSheetAction(onPressed: () {}, child: Text("Option 3")),
          //                         CupertinoActionSheetAction(onPressed: () {}, child: Text("Option 4")),
          //                       ],
          //                       cancelButton: CupertinoActionSheetAction(
          //                           onPressed: () {
          //                             Navigator.pop(context);
          //                           },
          //                           child: Text("Back"),
          //                           isDestructiveAction: true),
          //                     );
          //                   },
          //                 );
          //                 // Provider.of<PlatformProvider>(context, listen: false).changePlatform();
          //               },
          //               style: ElevatedButton.styleFrom(),
          //               onFocusChange: (value) {
          //                 print("onFocusChange ");
          //               },
          //               child: Text("Next 11"));
          //         }),
          //         ElevatedButton(
          //             onPressed: () {
          //               // Provider.of<PlatformProvider>(context, listen: false).changePlatform();
          //
          //             },
          //             style: ElevatedButton.styleFrom(),
          //             child: Text("Next")),
          //         CupertinoContextMenu(
          //           child: Image.network(
          //             "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/61h+Li6c1AL._SY741_.jpg",
          //             height: 150,
          //             width: 150,
          //           ),
          //           actions: [
          //             CupertinoContextMenuAction(
          //               child: Text("Option 1"),
          //               trailingIcon: Icons.settings,
          //             ),
          //             CupertinoContextMenuAction(child: Text("Option 2")),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // );
          return CupertinoTabScaffold(
            controller: Provider.of<CounterProvider>(context, listen: false).tabController,
            tabBar: CupertinoTabBar(
              iconSize: 22,
              currentIndex: 2,
              onTap: (value) {
                print(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Home",
                  activeIcon: Icon(CupertinoIcons.house_fill),
                ),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  if (index == 0) {
                    return Container(
                      child: Center(
                          child: CupertinoButton(
                        child: Text("Home -- $index"),
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context) {
                              return CupertinoPageScaffold(
                                child: Center(
                                    child: CupertinoButton(
                                  child: Text("jadfsadfsa" * 20),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                              );
                            },
                          ));
                        },
                      )),
                      color: Colors.grey,
                    );
                  } else if (index == 1) {
                    return Container(
                      child: Center(
                          child: ElevatedButton(
                        child: Text("Call $index"),
                        onPressed: () {
                          Provider.of<CounterProvider>(context, listen: false).tabController.index = 2;
                        },
                      )),
                      color: Colors.grey,
                    );
                  } else if (index == 2) {
                    return Container(
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator.adaptive(),
                          Switch.adaptive(
                            value: true,
                            onChanged: (value) {},
                          ),
                          // RadioListTile.adaptive(value: true, groupValue: true, onChanged: (value) {
                          //
                          // },),
                          // SwitchListTile.adaptive(
                          //   value: true,
                          //   onChanged: (value) {},
                          // ),
                          Icon(Icons.adaptive.share),
                          CupertinoButton.filled(
                            child: Text("Change Theme"),
                            onPressed: () {
                              Provider.of<PlatformProvider>(context, listen: false).changePlatform();
                            },
                          ),

                          CupertinoButton.filled(
                            child: Text("New Page"),
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                                return SliverDemo();
                              },));
                            },
                          ),

                          CupertinoSegmentedControl(
                            children: {
                              1: Icon(Icons.add),
                              2: Container(
                                child: Text("Two"),
                              ),
                              3: Container(
                                child: Text("Three"),
                              ),
                            },
                            onValueChanged: (value) {
                              print("CupertinoSegmentedControl $value");
                            },
                          ),
                          CupertinoSlidingSegmentedControl(
                            groupValue: 2,
                            children: {
                              1: Icon(Icons.add),
                              2: Container(
                                child: Text("Two"),
                              ),
                              3: Container(
                                child: Text("Three"),
                              ),
                            },
                            onValueChanged: (value) {
                              print("CupertinoSegmentedControl $value");
                            },
                          ),
                          Text("Settiong $index"),
                          Consumer<CounterProvider>(
                            builder: (context, value, child) => CupertinoSlider(
                              value: value.count.toDouble(),
                              onChanged: (val) {
                                value.change(val);
                              },
                              min: 0,
                              max: 100,
                              divisions: 5,
                            ),
                          )
                        ],
                      )),
                      color: Colors.grey,
                    );
                  } else {
                    return Container(
                      child: Center(child: Text("data $index")),
                      color: Colors.grey,
                    );
                  }
                },
              );
            },
            // backgroundColor: Colors.white,
          );
        }
      },
    );
  }
}

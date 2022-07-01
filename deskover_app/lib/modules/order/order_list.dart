import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderListScreen();
}

class _OrderListScreen extends State<OrderListScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text('User Info'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Tuỳ chọn'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Card(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: SpaceValues.space32,right: SpaceValues.space32),
                          child: SizedBox(
                            width: width * 0.5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(54),
                                ),
                                primary: UIColors.focusedInputBorder, // background
                                onPrimary: Colors.white,
                                // foreground
                              ),
                              onPressed: () => {},
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Text('Tiếp nhận',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

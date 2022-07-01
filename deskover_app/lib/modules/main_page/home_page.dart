import 'package:deskover_app/client/dio_client.dart';
import 'package:deskover_app/modules/order/order_list.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  void initState() {
    _client.init();
    super.initState();
  }
  static  final List<Widget> _widgetOptions = <Widget>[
    const  OrderListScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: UIColors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Đơn hàng',
            backgroundColor: UIColors.loginbuuton,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_rounded),
            label: 'Tiếp nhận',
            backgroundColor: UIColors.loginbuuton,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Đang giao',
            backgroundColor: UIColors.loginbuuton,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: UIColors.loginbuuton,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: UIColors.white,
        onTap: _onItemTapped,
      ),


    );
  }

}

import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardScreen();

}
class _DashboardScreen extends State<DashboardScreen>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(color: UIColors.white),
         backgroundColor: UIColors.appBar,
       ),
       drawer: Drawer(
         // Add a ListView to the drawer. This ensures the user can scroll
         // through the options in the drawer if there isn't enough vertical
         // space to fit everything.
         child: ListView(
           // Important: Remove any padding from the ListView.
           padding: EdgeInsets.zero,
           children: [
             const DrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.blue,
               ),
               child: Text('Drawer Header'),
             ),
             ListTile(
               title: const Text('Item 1'),
               onTap: () {
                 // Update the state of the app
                 // ...
                 // Then close the drawer
                 Navigator.pop(context);
               },
             ),
             ListTile(
               title: const Text('Item 2'),
               onTap: () {
                 // Update the state of the app
                 // ...
                 // Then close the drawer
                 Navigator.pop(context);
               },
             ),
           ],
         ),
       ),
       body: Column(
         children:<Widget> [
           SizedBox(
             height: MediaQuery.of(context).size.height * 0.2,
             child: Stack(
               children: <Widget>[
                 Container(
                   height: MediaQuery.of(context).size.height * 0.2 - 27,
                   decoration: const BoxDecoration(
                     color: UIColors.appBar,
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(36),bottomLeft: Radius.circular(36))
                   ),
                 ),
               ],

             ),
           ),
         ],
       ),
     );
  }
  
}
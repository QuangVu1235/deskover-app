import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/icon_assets.dart';
import 'order_list.dart';

class HomeOrderScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _HomeOrderScreen();
}
class _HomeOrderScreen extends State<HomeOrderScreen>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: const SizedBox(
            width: 0,
            height: 0,
          ),
          backgroundColor: UIColors.white,
          leadingWidth: 0,
          title: Image.asset(
            IconAssets.logo,
            fit: BoxFit.contain,
            height: 40,
          ),
          actions: [
            IconButton(
              onPressed: () {

              },
              icon:  Icon(Icons.search, size: 26,color: UIColors.black ,),
            ),
            IconButton(
              onPressed: () {
              },
              icon:  Icon(Icons.notifications_none, size: 26,color: UIColors.black),
            ),
          ],
        ),
        body: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: SpaceValues.space24,vertical: SpaceValues.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.only(bottom: SpaceValues.space16),
                child: Row(
                  children: const [
                    Icon(Icons.list,color: UIColors.navNonSelected,),
                    SizedBox(width: SpaceValues.space4,),
                    Text(
                        'Tất cả đơn hàng',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: UIColors.black70
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: OrderListScreen()),
            ],
          ),
        ),
      );
  }

}
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          centerTitle: true,
          leading: const SizedBox(
            width: 0,
            height: 0,
          ),
          backgroundColor: UIColors.white,
          leadingWidth: 0,
          title: const Text('Đơn hàng của bạn',
            style: TextStyle(
              fontSize: 14
          ),),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //
          //     },
          //     icon:  Icon(Icons.search, size: 26,color: UIColors.black ,),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //     },
          //     icon:  Icon(Icons.notifications_none, size: 26,color: UIColors.black),
          //   ),
          // ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              color: UIColors.white,
              margin: EdgeInsets.only(top: 1,bottom: 2),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    prefixIconConstraints: const BoxConstraints.expand(
                        height: SpaceValues.space16,
                        width: SpaceValues.space48),
                    prefixIcon:  SvgPicture.asset('resources/icons/search.svg',color: UIColors.black),
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm đơn hàng...',
                    hintStyle: const TextStyle(
                        color: UIColors.black
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: UIColors.black10),
                      borderRadius: BorderRadius.circular(SpaceValues.space48),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: UIColors.black10),
                      borderRadius: BorderRadius.circular(SpaceValues.space48),
                    ) ,
                    suffixIconConstraints: const BoxConstraints(
                        maxHeight: SpaceValues.space24, minWidth: 0),

                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: UIColors.white,
                child:  ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 32,right: 32),
                      child: InkWell(
                        onTap: (){
                          print('Next screen ${index}');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                               const Text(
                                'HD-123456',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: UIColors.appBar
                                ),
                              ),
                              SizedBox(height: 6,),
                              Row(
                                children: [
                                    SvgPicture.asset('resources/icons/person.svg',height: 16,),
                                    SizedBox(width: 6,),
                                    const Expanded(
                                      child: Text(
                                          'Pham Quang Vu',
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        textAlign: TextAlign.start,
                                      ),
                                    )
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SvgPicture.asset('resources/icons/location_pin.svg',height: 16,),
                                  SizedBox(width: 6,),
                                  Expanded(
                                    child: Text(
                                      '104/38/15 Âu Dương Lân, Phường 3, Quận 8, Tp. Hồ Chí Minh',
                                      style: TextStyle(
                                          fontSize: 12
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SvgPicture.asset('resources/icons/event_note.svg',height: 16,),
                                  SizedBox(width: 6,),
                                  Text(
                                    '20:12',
                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  const Text(
                                    '10.000.000đ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: UIColors.brandA
                                    ),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.only(left: 32,right: 32),
                    child: Container(height: 1, color: UIColors.black10,),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      );
  }

}
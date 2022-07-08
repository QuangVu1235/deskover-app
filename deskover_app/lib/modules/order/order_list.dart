
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';


class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderListScreen();
}

class _OrderListScreen extends State<OrderListScreen> {
  final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return
            Card(
            margin: const EdgeInsets.only(bottom: SpaceValues.space16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                          Text(
                            'Order ID:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: UIColors.navNonSelected,
                              fontSize: 14
                            ),
                          ),
                        Text(
                          '#15625',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIColors.black50,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SpaceValues.space12,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: UIColors.yellow40,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.real_estate_agent_outlined, color: UIColors.yellow,
                            ),
                          ),
                        ),
                        const SizedBox(width: SpaceValues.space16,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                  Text(
                                      'Địa chỉ kho hàng:',
                                    style: TextStyle(
                                      color: UIColors.black70,
                                      fontSize: 12, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                Text(
                                  'Quận 9, TP Hồ Chí Minh',
                                  style: TextStyle(
                                      color: UIColors.black,
                                      fontSize: 16, fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                        ))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: const [
                          Icon(Icons.keyboard_double_arrow_down,size: 10,color: UIColors.black50,),
                          Icon(Icons.keyboard_double_arrow_down,size: 10,color: UIColors.black50,),
                          Icon(Icons.keyboard_double_arrow_down,size: 12,color: UIColors.black50,)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: UIColors.yellow40,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_on_outlined, color: UIColors.yellow,
                            ),
                          ),
                        ),
                        const SizedBox(width: SpaceValues.space16,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Địa chỉ giao hàng:',
                                  style: TextStyle(
                                      color: UIColors.black70,
                                      fontSize: 12, fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'Quận 9, TP Hồ Chí Minh',
                                  style: TextStyle(
                                      color: UIColors.black,
                                      fontSize: 16, fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(height: SpaceValues.space24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.local_offer_outlined,color: UIColors.black70,),
                        SizedBox(width: SpaceValues.space4,),
                        Text(
                          '500.000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIColors.black,
                              fontSize: 14
                          ),
                        ),
                        Text(
                          'đ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIColors.black,
                              fontSize: 14
                          ),
                        ),
                        SizedBox(width: SpaceValues.space24,),
                        Icon(Icons.access_time,color: UIColors.black70,),
                        SizedBox(width: SpaceValues.space4,),
                        Text(
                          '12:00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIColors.black,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SpaceValues.space24,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: SpaceValues.space32,right: SpaceValues.space32),
                        child: SizedBox(
                          // width: width *0.4,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: UIColors.green, // background
                              onPrimary: Colors.white,
                              // foreground
                            ),
                            onPressed: () => {},
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('TIẾP NHẬN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: UIColors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

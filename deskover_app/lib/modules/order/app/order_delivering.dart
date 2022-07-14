import 'package:deskover_app/config/injection_config.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:deskover_app/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../global/global_image.dart';
import '../../../themes/space_values.dart';
import '../../receive_orders/order_model.dart';
import '../widgets/delivery/delivery_model.dart';

class OrderDelivering extends StatefulWidget{

  final String? OrderCode;

  const OrderDelivering({Key? key,required this.OrderCode }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderDelivering();

}
class _OrderDelivering extends ViewWidget<OrderDelivering, DeliveryModel>{
  @override
  void initState()  {
    super.initState();
      viewModel.orderDelivery(widget.OrderCode!,'DG');
  }
  Future<void> get()async {


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        title: Obx(()=>Text('Đơn hàng của: ${viewModel.orderReponese.value?.fullName!}'
          ,style: TextStyle(
              fontSize: 14
          ),
        ),)
      ),
      body:
      Obx(
              ()=>     Visibility(
                visible: viewModel.orderReponese.value != null,
                child: Card(
                  elevation: 0.0,
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        style: BorderStyle.solid,
                        color: UIColors.black10,
                        width: 1
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Mã vận đơn:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: UIColors.black,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(width: 4,),
                                    Text(
                                      viewModel.orderReponese.value?.orderCode ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: UIColors.black,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12,),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: UIColors.yellow40,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: UIColors.yellow,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SpaceValues.space16,
                                    ),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children:  [
                                            const Text(
                                              'Địa chỉ giao hàng:',
                                              style: TextStyle(
                                                  color: UIColors.black70,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: 4,),
                                            Text(
                                              viewModel.orderReponese.value?.address ?? '',
                                              style: const TextStyle(
                                                  color: UIColors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: SpaceValues.space16,
                                ),
                                const SizedBox(
                                  height: SpaceValues.space16,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: viewModel.orderReponese.value?.orderItem?.length ?? 0,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
                                      elevation: 0.0,
                                      margin: EdgeInsets.zero,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.2,
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: GlobalImage(viewModel.orderReponese.value?.orderItem?[index].img ?? ''),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    viewModel.orderReponese.value?.orderItem?[index].name ?? '',
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    'x ${viewModel.orderReponese.value?.orderItem?[index].quantity}',
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Giá: ${viewModel.orderReponese.value?.orderItem?[index].price}',
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),

                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 10,),

                                ),
                                const SizedBox(height: SpaceValues.space12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Ghi chú',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14
                                      ),
                                    ),

                                  ],
                                ),
                                const SizedBox(height: SpaceValues.space12,),
                                const TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Nhập ghi chú (nếu có)',

                                      hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                      floatingLabelAlignment: FloatingLabelAlignment.center
                                  ),
                                  minLines: 3,
                                  maxLines: 3,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Divider(color: UIColors.black,thickness: 0.5,endIndent: 20,indent: 20,height: 10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:  [
                                    const Text(
                                      'Tổng tiền: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: UIColors.black,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      width: SpaceValues.space4,
                                    ),
                                    Text(
                                      viewModel.orderReponese.value?.totalPrice ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: UIColors.black,
                                          fontSize: 14),
                                    ),
                                    const Text(
                                      'đ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: UIColors.black,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      width: SpaceValues.space24,
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: UIColors.white,
                                          // elevation: 0.0,
                                          shape:  RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              side: BorderSide(color: UIColors.red,width: 1)
                                          )
                                      ) ,
                                      onPressed: (){

                                      },
                                      child: const Text(
                                        'Huỷ đơn hàng',
                                        style: TextStyle(
                                            color: UIColors.red
                                        ),
                                      )),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: UIColors.appBar,
                                          shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          )
                                      ) ,
                                      onPressed: (){
                                          viewModel.dataOrderDelivering.refresh();
                                          Get.back();
                                      },
                                      child: Text(
                                        'Xác nhận đơn hàng',
                                        style: TextStyle(

                                        ),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                replacement: Container(
                  margin: EdgeInsets.only(top: 1),
                  color: UIColors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('resources/images/search.svg'),
                    ],
                  ),
                ),
              ),
      )
    );
  }

  @override
  DeliveryModel createViewModel() => getIt<DeliveryModel>();

}
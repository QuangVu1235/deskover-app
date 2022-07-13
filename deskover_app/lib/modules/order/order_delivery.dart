import 'package:deskover_app/config/injection_config.dart';
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:deskover_app/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'app/order_delivering.dart';
import 'order_delivery_model.dart';

class HomeOrderScreen extends StatefulWidget{
  const HomeOrderScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeOrderScreen();
}
class _HomeOrderScreen extends  ViewWidget<HomeOrderScreen,OrderDelivery>{
  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2,
        // initialIndex: widget.initScreen,
        child: Scaffold(
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
              // Container(
              //   color: UIColors.white,
              //   margin: EdgeInsets.only(top: 1,bottom: 2),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         contentPadding: const EdgeInsets.all(14),
              //         prefixIconConstraints: const BoxConstraints.expand(
              //             height: SpaceValues.space16,
              //             width: SpaceValues.space48),
              //         prefixIcon:  SvgPicture.asset('resources/icons/search.svg',color: UIColors.black),
              //         border: InputBorder.none,
              //         hintText: 'Tìm kiếm đơn hàng...',
              //         hintStyle: const TextStyle(
              //             color: UIColors.black
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: const BorderSide(color: UIColors.black10),
              //           borderRadius: BorderRadius.circular(SpaceValues.space48),
              //         ),
              //         focusedBorder:OutlineInputBorder(
              //           borderSide: const BorderSide(color: UIColors.black10),
              //           borderRadius: BorderRadius.circular(SpaceValues.space48),
              //         ) ,
              //         suffixIconConstraints: const BoxConstraints(
              //             maxHeight: SpaceValues.space24, minWidth: 0),
              //
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 2,),
              Container(
                width: double.infinity,
                color: UIColors.white,
                child: Center(
                  child: TabBar(
                    indicatorColor: UIColors.navSelected,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: UIColors.navSelected,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                    unselectedLabelColor: UIColors.navNonSelected,
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    indicatorWeight: 2,
                    labelPadding: EdgeInsets.zero,
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: SpaceValues.space64, vertical: 0),
                    isScrollable: true,
                    tabs: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5 - SpaceValues.space16,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: UIColors.dividerDark, width: 1),
                          ),
                        ),
                        child: const Tab(
                          // text: 'Kích hoạt bảo hành',
                          child: Text('Đơn hàng tiếp nhận', style: TextStyle(
                            fontSize: 16,
                          ),),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .5 - SpaceValues.space16,
                        decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: UIColors.dividerDark, width: 1),),
                        ),
                        child: const Tab(
                          // text: 'Kích hoạt bảo hành',
                          child: Text('Đơn hàng đang giao', style: TextStyle(
                            fontSize: 16,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2,),
              Expanded(
                  child: TabBarView(
                    children: [
                      Obx(()=>
                          Container(
                            color: UIColors.white,
                            child:  ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.dataOrderDelivery.value.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 32,right: 32),
                                  child: InkWell(
                                    onTap: (){
                                      print('Next screen ${index}');
                                      Get.to(()=> OrderDelivering(OrderCode: viewModel.dataOrderDelivery[index].orderCode! ,));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          Text(
                                            viewModel.dataOrderDelivery[index].orderCode ?? '',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: UIColors.appBar
                                            ),
                                          ),
                                          const SizedBox(height: 6,),
                                          Row(
                                            children: [
                                              SvgPicture.asset('resources/icons/person.svg',height: 16,),
                                              const SizedBox(width: 6,),
                                              Expanded(
                                                child: Text(
                                                  viewModel.dataOrderDelivery[index].fullName ??'',
                                                  style: const TextStyle(
                                                      fontSize: 12
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SvgPicture.asset('resources/icons/location_pin.svg',height: 16,),
                                              const SizedBox(width: 6,),
                                              Expanded(
                                                child: Text(
                                                  viewModel.dataOrderDelivery[index].address ??'',
                                                  style: const TextStyle(
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
                                                viewModel.dataOrderDelivery[index].createdAt!,
                                                style: const TextStyle(
                                                    fontSize: 12
                                                ),
                                              ),
                                              Expanded(child: const SizedBox()),
                                              Text(
                                                viewModel.dataOrderDelivery[index].totalPrice!+' đ',
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
                      Obx(()=>
                          Visibility(
                            visible: viewModel.dataOrderDelivering.value.length != 0,
                            child: Container(
                              color: UIColors.white,
                              child:  ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.dataOrderDelivering.value.length,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 32,right: 32),
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(()=> OrderDelivering(OrderCode: viewModel.dataOrderDelivering[index].orderCode,));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            Text(
                                              viewModel.dataOrderDelivering[index].orderCode ?? '',
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: UIColors.appBar
                                              ),
                                            ),
                                            const SizedBox(height: 6,),
                                            Row(
                                              children: [
                                                SvgPicture.asset('resources/icons/person.svg',height: 16,),
                                                const SizedBox(width: 6,),
                                                Expanded(
                                                  child: Text(
                                                    viewModel.dataOrderDelivering[index].fullName ??'',
                                                    style: const TextStyle(
                                                        fontSize: 12
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                SvgPicture.asset('resources/icons/location_pin.svg',height: 16,),
                                                const SizedBox(width: 6,),
                                                Expanded(
                                                  child: Text(
                                                    viewModel.dataOrderDelivering[index].address ??'',
                                                    style: const TextStyle(
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                SvgPicture.asset('resources/icons/event_note.svg',height: 16,),
                                                const SizedBox(width: 6,),
                                                Text(
                                                  viewModel.dataOrderDelivering[index].createdAt!,
                                                  style: const TextStyle(
                                                      fontSize: 12
                                                  ),
                                                ),
                                                const Expanded(child: SizedBox()),
                                                Text(
                                                  viewModel.dataOrderDelivering[index].totalPrice!+' đ',
                                                  style: const TextStyle(
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
                            replacement: Container(
                              color: UIColors.white,
                              child: Column(
                                children: [
                                  SvgPicture.asset('resources/images/search.svg'),
                                ],
                              ),
                            ),
                          ),


                      ),
                    ],

                  ) ),



            ],
          ),
        ),
      );
  }

  @override
  OrderDelivery createViewModel() => getIt<OrderDelivery>();

}
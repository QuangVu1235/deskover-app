import 'package:deskover_app/config/injection_config.dart';
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:deskover_app/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/dialogs/loading_dialog.dart';
import '../main_page/home_page.dart';
import 'chart_bar.dart';
import 'dashboard_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends ViewWidget<DashboardScreen,DashBoardModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doGetToTalPrice7DaysAgo;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.appBar.withOpacity(0.01),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: UIColors.white),
        backgroundColor: UIColors.appBar,
      ),
      drawer: Drawer(
        // backgroundColor: UIColors.white,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              focusColor: UIColors.white,
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 15,
          color: UIColors.appBar,
          onRefresh: () async{
            await Future.delayed(Duration(seconds: 1));
            viewModel.refresh;
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    color: UIColors.appBar,
                    // borderRadius: BorderRadius.only(bottomRight: Radius.circular(32),bottomLeft: Radius.circular(32))
                  ),
                ),
                ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      height: 150,
                      decoration: BoxDecoration(
                          color: UIColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                color: UIColors.appBar.withOpacity(0.23))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: SpaceValues.space8,
                                    ),
                                    const Text(
                                      'Đơn hàng mới!',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      'Kiểm tra đơn hàng',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: SpaceValues.space8,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: UIColors.appBar, // background
                                          onPrimary: Colors.white,
                                          // foreground
                                        ),
                                        onPressed: () {
                                          Get.offAll(()=> const HomePage(indexTap: 1,));
                                        },
                                        child: const Text(
                                          'Kiểm tra',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SpaceValues.space8,
                                    ),
                                  ],
                                ),
                                SvgPicture.asset('resources/images/giaohang.svg')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 13 / 10,
                              shrinkWrap: true,
                              crossAxisSpacing: SpaceValues.space12,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: UIColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'resources/icons/price.svg',
                                            width: 40,
                                            color: UIColors.yellow,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Obx(
                                                  ()=> Expanded(
                                                    child: RichText(
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                        text: TextSpan(
                                                            text: viewModel.totalPricePerMonth.value,
                                                            style: const TextStyle(

                                                                color: UIColors.black,
                                                                fontSize: 16, fontWeight: FontWeight.w700
                                                            ),
                                                            children: const <TextSpan>[
                                                              TextSpan(
                                                                  text: ' đ',
                                                                  style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w400
                                                                  )
                                                              )
                                                            ]
                                                        )),
                                                  )),


                                            ],
                                          ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               const Text(
                                                "Tổng doanh thu tháng: ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                               Obx(
                                                   ()=>Text(
                                                     viewModel.month.value,
                                                     textAlign: TextAlign.center,
                                                     style: TextStyle(
                                                         fontSize: 14,
                                                         fontWeight: FontWeight.w700),
                                                   ))

                                             ],
                                           ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: UIColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'resources/icons/tongdon.svg',
                                            width: 40,
                                            color: UIColors.yellow,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Obx(()=> Text(
                                                viewModel.countOrderPerMonth.value,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700),
                                              ),),
                                          const Text(
                                            "Tổng số đơn hàng",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SpaceValues.space12,
                            ),
                            Obx(
                                ()=> Visibility(
                                  visible: viewModel.totalPrice7DaysAgo.isEmpty,
                                  child: const LoadingDialog(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    message: 'Đang tìm thống kê...',
                                  ),
                                  replacement: BarChartSample()  ,
                                ))

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  DashBoardModel createViewModel() => getIt<DashBoardModel>();

}

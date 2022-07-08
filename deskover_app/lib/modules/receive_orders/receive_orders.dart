
import 'package:deskover_app/config/injection_config.dart';
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../global/global_qr_code.dart';
import '../../themes/ui_colors.dart';
import 'order_model.dart';

class ReceiveOrders extends StatefulWidget{
  const ReceiveOrders({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReceiveOrders();
}
class _ReceiveOrders extends ViewWidget<ReceiveOrders,OrderModel>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123+'),
        backgroundColor: UIColors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(top: 8,bottom: 8),
            color: UIColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpaceValues.space16, vertical: SpaceValues.space8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: TextFormField(
                  //     controller: viewModel.inputOrderCode,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //       prefixIconConstraints: const BoxConstraints(minHeight: SpaceValues.space24, maxHeight: SpaceValues.space24, minWidth: 0),
                  //       prefixIcon: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: SpaceValues.space8),
                  //         child: SvgPicture.asset('resources/icons/loading.png', color: UIColors.black70,),
                  //       ),
                  //       hintText: 'Nhập mã vận đơn',
                  //       // errorText: viewModel.validBarcode.value,
                  //     ),
                  //   ),
                  //
                  // ),

                  Expanded(
                     child: Obx(() {
                      return
                        Form(
                            key: viewModel.formKey,
                            child: TextFormField(
                              controller: viewModel.inputOrderCode,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIconConstraints: const BoxConstraints(minHeight: SpaceValues.space24, maxHeight: SpaceValues.space24, minWidth: 0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: SpaceValues.space8),
                                  child: SvgPicture.asset('resources/icons/loading.png', color: UIColors.black70,),
                                ),
                                hintText: 'Nhập số serial',
                                errorText: viewModel.validBarcode.value,
                              ),
                            ));

                  }),
                   ),
                  const SizedBox(width: SpaceValues.space12,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UIColors.black70,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // padding: const EdgeInsets.symmetric(vertical: 9.5),
                        minimumSize: Size.zero,
                        fixedSize: const Size(56, 42)
                    ),
                    onPressed: ()=>{
                      viewModel.onSearch()
                    },
                    // viewModel.btnQRScaner,
                    child: Center(child: Icon(Icons.search,color: UIColors.white, size: 25)),
                  ),
                  SizedBox(width: SpaceValues.space8,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UIColors.appBar,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // padding: const EdgeInsets.symmetric(vertical: 9.5),
                        minimumSize: Size.zero,
                        fixedSize: const Size(56, 42)
                    ),
                    onPressed: ()=>{
                      btnQRScaner()
                    },
                    // viewModel.btnQRScaner,
                    child: Center(child: Icon(Icons.qr_code,color: UIColors.white, size: 25)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 4,bottom: SpaceValues.space32),
                color: UIColors.white,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void btnQRScaner() {
    Get.to(GlobalQRScannerScreen(
      onDetect: (barcode, args) {
        String rowcode = barcode.rawValue ?? '';
        print(rowcode);
        // String? result;

        // if (result?.isEmpty ?? true) {
        //   loading(() async => throw 'Vui lòng quét Barcode hoặc QRcode sản phẩm của Mutosi');
        // }
        // inputBarcode.text = result ?? '';
        Get.back();

      },
    ));
  }

  @override
  OrderModel createViewModel() => getIt<OrderModel>();

}
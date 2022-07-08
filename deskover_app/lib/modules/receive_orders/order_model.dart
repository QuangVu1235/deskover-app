import 'package:deskover_app/modules/receive_orders/service/service/order_service.dart';
import 'package:deskover_app/usercases/order_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';

import '../../entity/order/order_response.dart';
import '../../utils/AppUtils.dart';

@injectable
class OrderModel extends ViewModel{
    final OrderService _orderService;
    final OrderUsercase _orderUsercase;

    TextEditingController inputOrderCode = TextEditingController();
    final Rx<String?> validBarcode = Rx<String?>(null);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    @factoryMethod
    OrderModel(this._orderService, this._orderUsercase);

    bool validAll() {
      bool result = formKey.currentState?.validate() ?? false;

      if (inputOrderCode.text.isEmpty) {
        validBarcode.value = 'Nhập mã vận đơn hoặc quét QR';
        result = false;
      } else {
        validBarcode.value = null;
      }
      return result;
    }

    onSearch() async{
      validBarcode.value = null;
      if (!validAll() || !(formKey.currentState?.validate() ?? false)) {
        await loading(() async {
          throw 'Vui lòng kiểm tra lại thông tin';
        });
        return;
      }

     await loading(() async{
       OrderReponse data = await _orderUsercase.findByOrderCode(inputOrderCode.text, 'C-LH');
       print(data.orderStatus?.code);

      }, showErrorDialog: true).then((result){
        print(result);
      }).catchError ((error){

       // print('Got error: ${error.response?.data?['message']}');
       loading(() async {
         throw validBarcode.value ?? 'Vui lòng kiểm tra lại thông tin';
       });
      });
    }

}
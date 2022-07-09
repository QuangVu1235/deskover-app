import 'package:deskover_app/modules/receive_orders/service/service/order_service.dart';
import 'package:deskover_app/usercases/dashboard_usercase.dart';
import 'package:deskover_app/usercases/order_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';

import '../../entity/order/order_response.dart';

@Injectable()
class OrderModel extends ViewModel{

    final OrderUsercase _orderUsercase;
    TextEditingController inputOrderCode = TextEditingController();
    final Rx<String?> validBarcode = Rx<String?>(null);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Rxn<OrderReponse> orderReponese = Rxn();

    @factoryMethod
    OrderModel(this._orderUsercase);

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
      orderReponese.value = null;
      validBarcode.value = null;
      if (!validAll() || !(formKey.currentState?.validate() ?? false)) {
        await loading(() async {
          throw 'Vui lòng kiểm tra lại thông tin';
        });
        return;
      }
     await loading(() async{
       await _orderUsercase.findByOrderCode(inputOrderCode.text, 'C-LH').then((value) async{
         orderReponese.value = value;
         print(orderReponese.value?.orderStatus?.code);
       }).catchError((error){
         orderReponese.value ?? '';
       });
     });
    }
    Future<void> loadOrderByCode() async{
      validBarcode.value = null;
      orderReponese.value = null;
      if (!validAll() || !(formKey.currentState?.validate() ?? false)) {
        await loading(() async {
          throw 'Vui lòng kiểm tra lại thông tin';
        });
        return;
      }
      await _orderUsercase.findByOrderCode(inputOrderCode.text, 'C-LH').then((value) async{
        orderReponese.value = value;
      });
    }

}
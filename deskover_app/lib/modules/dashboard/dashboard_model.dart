import 'package:deskover_app/modules/dashboard/reponse/message.dart';
import 'package:deskover_app/usercases/dashboard_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../entity/order/order_response.dart';

@injectable
class DashBoardModel extends ViewModel {
  final DashBoardUserCase _dashBoardUserCase;

  // final Rx<String?> pricePerMonth = Rx<String?>(null);
  // final Rxn<Message> pricePerMonth = Rxn();
  // final Rxn<OrderReponse> orderReponese = Rxn();

  final Rx<String> pricePerMonth = ''.obs;

  @factoryMethod
  DashBoardModel(this._dashBoardUserCase);

  @override
  initState() {
    print('1111111111111111111111');
    getPerMonth();
    print(pricePerMonth.value);
  }

  getPerMonth() async {
    pricePerMonth.value = '';
    loading(() async{
      await _dashBoardUserCase.getPricePerMonth('minhnh').then((value) {
        pricePerMonth.value = value;
      });
    });

  }
}

import 'package:deskover_app/modules/main_page/home_page.dart';
import 'package:deskover_app/usercases/dashboard_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashBoardModel extends ViewModel{

  final DashBoardUserCase _boardUserCase;
  // final RxList<String> listData = Rxn
  final RxString totalPricePerMonth = ''.obs;
  final RxString countOrderPerMonth = ''.obs;
  final RxString month = ''.obs;
  @factoryMethod
  DashBoardModel(this._boardUserCase);

  @override
  void initState()  {
    super.initState();
    refresh();
  }

  Future<void> refresh() => Future.wait([
        getPriceByMonth(),
        getCountOrderPerMonth()
  ]);

 Future<void> getPriceByMonth() async{
    month.value = '';
    var now = DateTime.now();
    month.value = now.month.toString();

    totalPricePerMonth.value = '';
   _boardUserCase.getPricePerMonth().then((value) async{
        totalPricePerMonth.value = value;
   });
  }
  Future<void> getCountOrderPerMonth() async{
    _boardUserCase.getCountOrderPerMonth().then((value) async {
      countOrderPerMonth.value = value;
    });
  }

}
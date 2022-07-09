import 'package:deskover_app/usercases/dashboard_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashBoardModel extends ViewModel{

  final DashBoardUserCase _boardUserCase;
  final RxString totalPricePerMonth = ''.obs;
  final RxString month = ''.obs;
  @factoryMethod
  DashBoardModel(this._boardUserCase);

  @override
  void initState()  {
    super.initState();

  }

  getPriceByMonth(){

    month.value = '';
    var now = new DateTime.now();
    month.value = now.month.toString();


    totalPricePerMonth.value = '';
   _boardUserCase.getPricePerMonth('minhnh').then((value) async{
        totalPricePerMonth.value = value;
   });
  }

}
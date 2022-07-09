import 'package:deskover_app/usercases/dashboard_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashBoardModel extends ViewModel{

  final DashBoardUserCase _boardUserCase;

  @factoryMethod
  DashBoardModel(this._boardUserCase);

  getPriceByMonth(){
    loading(() async{
        await _boardUserCase.getPricePerMonth('minhnh').then((value) async{
          print('valueaeeeeeeeeeee');
            print(value);
        });
    });
  }

}
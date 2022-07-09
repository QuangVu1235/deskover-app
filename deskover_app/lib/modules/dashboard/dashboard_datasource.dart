import 'package:deskover_app/modules/dashboard/reponse/message.dart';
import 'package:deskover_app/modules/dashboard/service/dashboard_api.dart';
import 'package:injectable/injectable.dart';

abstract class DashBoardDataSource {
  Future<Message> getPricePerMonth(String userModified);
}

@LazySingleton(as:DashBoardDataSource)
class DashBoardDataSourceImpl extends DashBoardDataSource {

  final DashboardAPI _dashboardAPI;
  DashBoardDataSourceImpl(this._dashboardAPI);

  @override
  Future<Message> getPricePerMonth(String  userModified)
  => _dashboardAPI.getTotalPerMonth(userModified);
}

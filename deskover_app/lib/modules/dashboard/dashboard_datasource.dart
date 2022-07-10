import 'package:deskover_app/modules/dashboard/reponse/message.dart';
import 'package:deskover_app/modules/dashboard/service/dashboard_api.dart';
import 'package:injectable/injectable.dart';

abstract class DashBoardDataSource {
  Future<String> getPricePerMonth();
  Future<String> getCountOrderPerMonth();
}

@LazySingleton(as:DashBoardDataSource)
class DashBoardDataSourceImpl extends DashBoardDataSource {

  final DashboardAPI _dashboardAPI;
  DashBoardDataSourceImpl(this._dashboardAPI);

  @override
  Future<String> getPricePerMonth()
  => _dashboardAPI.getTotalPerMonth();

  @override
  Future<String> getCountOrderPerMonth()
  => _dashboardAPI.getCountOrderPerMonth();
}

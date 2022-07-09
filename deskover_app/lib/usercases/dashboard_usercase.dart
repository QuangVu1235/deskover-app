import 'package:deskover_app/modules/dashboard/dashboard_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DashBoardUserCase {
  final DashBoardDataSource _dashBoardDataSource;

  @factoryMethod
  DashBoardUserCase(this._dashBoardDataSource);

  Future<String> getPricePerMonth(String userModified) =>
      _dashBoardDataSource.getPricePerMonth(userModified);
}

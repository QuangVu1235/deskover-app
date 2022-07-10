import 'package:deskover_app/config/base_api.dart';
import 'package:deskover_app/modules/dashboard/reponse/message.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'dashboard_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class DashboardAPI {
  @factoryMethod
  factory DashboardAPI(Dio dio) = _DashboardAPI;
//Dùng @Path @Query= @Param
  @GET('/v1/api/admin/order-total-per-month')
  Future<String> getTotalPerMonth();

  @GET('/v1/api/admin/order-count-order-per-month')
  Future<String> getCountOrderPerMonth();

}

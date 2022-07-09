import 'package:deskover_app/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../entity/order/order_response.dart';

part 'find_by_order_code_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class OrderApi{

    @factoryMethod
    factory OrderApi(Dio dio) = _OrderApi;

    @GET('/v1/api/admin/order/{orderCode}')
    Future<OrderReponse> getByOrderCodeAndStatusCode(@Path('orderCode') String orderCode,@Query('status') String? status);

}
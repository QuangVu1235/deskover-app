import 'package:injectable/injectable.dart';

import '../../../../entity/order/order_response.dart';
import '../../../../entity/order/order_responses.dart';
import '../find_by_order_code_api.dart';

abstract class OrderService{
    Future<OrderReponses> findByOrderCode(String orderCode, String status);
}

@LazySingleton(as:OrderService)
class OrderServiceImpl extends OrderService{

  final OrderApi _orderApi;
  OrderServiceImpl(this._orderApi);

  @override
  Future<OrderReponses> findByOrderCode(String orderCode, String status)
    => _orderApi.getByOrderCodeAndStatusCode(orderCode, status);


}
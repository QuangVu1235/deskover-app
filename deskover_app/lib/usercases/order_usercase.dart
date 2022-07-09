import 'package:deskover_app/modules/receive_orders/service/service/order_service.dart';
import 'package:injectable/injectable.dart';

import '../entity/order/order_response.dart';

@LazySingleton()
class OrderUsercase {
  final OrderService _orderService;

  @factoryMethod
  OrderUsercase(this._orderService);

  Future<OrderReponse> findByOrderCode(String orderCode, String status)
  => _orderService.findByOrderCode(orderCode, status);

}
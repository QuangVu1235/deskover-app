import 'package:deskover_app/config/injection_config.dart';
import 'package:deskover_app/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../receive_orders/order_model.dart';

class OrderDelivering extends StatefulWidget{

  final String? OrderCode;

  const OrderDelivering({Key? key,required this.OrderCode }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderDelivering();

}
class _OrderDelivering extends ViewWidget<OrderDelivering, OrderModel>{
  @override
  void initState() {
    super.initState();
    print(widget.OrderCode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng của'),
      ),
    );
  }

  @override
  OrderModel createViewModel() => getIt<OrderModel>();

}
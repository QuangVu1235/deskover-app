import 'package:deskover_app/entity/order/order_responses.dart';
import 'package:deskover_app/usercases/order_usercase.dart';
import 'package:deskover_app/utils/widgets/view_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDelivery extends ViewModel{
    final OrderUsercase orderUsercase;

    final RxList<OrderReponses>  dataOrderDelivery = RxList.empty();
    final RxList<OrderReponses>  dataOrderDelivering = RxList.empty();

    @factoryMethod
    OrderDelivery(this.orderUsercase);

    @override
    void initState() async  {
        super.initState();
        refresh();
    }

    Future<void> refresh() => Future.wait([
        getAllOrderDelivery(),
        getAllOrderDelivering()
    ]);

    Future<void> getAllOrderDelivery() async{
        loading(()async{
         await orderUsercase.doGetAllOrderDelivery('LH-TC').then((value) async{
             dataOrderDelivery.value = value.data ?? [OrderReponses()];
         });
        }).then((value) async{

        });
    }

    Future<void> getAllOrderDelivering() async{
        loading(()async{
            await orderUsercase.doGetAllOrderDelivery('DG').then((value) async{
                dataOrderDelivering.value = value.data ?? [OrderReponses()];
            });
        }).then((value) async{

        });
    }


}
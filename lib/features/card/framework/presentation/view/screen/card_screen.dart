import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';
import 'package:platzi_trips_app/features/card/di/framework.module.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/custom_app_bar.dart';
import 'package:platzi_trips_app/widgets/skeletons/listview_cart.skeletons.dart';
import 'package:skeletons/skeletons.dart';

class ProductCart extends ConsumerStatefulWidget {
  ProductCart({Key? key}) : super(key: key);
  final NavigationServices? _navigation = locator<NavigationServices>();

  @override
  _ProductCart createState() => _ProductCart();
}

class _ProductCart extends ConsumerState<ProductCart> with TickerProviderStateMixin, BaseView {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(cartViewModelStateNotifierProvider.notifier).getCartInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(cartViewModelStateNotifierProvider.notifier).isLoading,
        builder: (context, snapshotFlag) {
          final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(cartViewModelStateNotifierProvider.notifier).cartInfo,
              builder: (context, snapshotProducts) {
                final _cartInfo = snapshotProducts.hasData ? snapshotProducts.data as CartResponseDto : CartResponseDto();
                return Scaffold(
                    appBar: AppBarCustom(
                      titleToolbar: Text(_cartInfo?.title?.text ?? "", style: TextStyle(color: Colors.black)),
                      allowBack: false,
                      colorBackground: Colors.white,
                    ),
                    body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.53,
                        child: isLoading
                            ? skeletonCartCardsView()
                            : (_cartInfo?.products?.length ?? 0) > 0
                                ? FadeAnimation(
                                    1.4,
                                    AnimatedList(
                                        padding: EdgeInsets.only(top: 12),
                                        scrollDirection: Axis.vertical,
                                        initialItemCount: _cartInfo.products!.length,
                                        itemBuilder: (context, index, animation) {
                                          return Dismissible(
                                            key: Key("${_cartInfo.products![index]}"),
                                            child: SizeTransition(
                                              sizeFactor: animation,
                                              child: cartItem(_cartInfo.products![index], index, animation),
                                            ),
                                            background: Container(color: Colors.green),
                                            onDismissed: (direction) {},
                                          );
                                        }),
                                  )
                                : Container(),
                      ),
                      SizedBox(height: 15),
                      FadeAnimation(
                        1.2,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              isLoading
                                  ? SkeletonLine(
                                      style: SkeletonLineStyle(
                                          padding: EdgeInsets.only(top: 10.0), borderRadius: BorderRadius.circular(24), width: 120))
                                  : Text(_cartInfo?.payInfo?.shippingLabel ?? "", style: TextStyle(fontSize: 20)),
                              isLoading
                                  ? SkeletonLine(
                                      style: SkeletonLineStyle(
                                          padding: EdgeInsets.only(top: 10.0), borderRadius: BorderRadius.circular(24), width: 120))
                                  : Text(_cartInfo?.payInfo?.shippingLabelValue ?? "",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      FadeAnimation(
                          1.3,
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: DottedBorder(
                                color: Colors.grey.shade400, dashPattern: [10, 10], padding: EdgeInsets.all(0), child: Container()),
                          )),
                      FadeAnimation(
                          1.3,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                isLoading
                                    ? SkeletonLine(
                                        style: SkeletonLineStyle(
                                            padding: EdgeInsets.only(top: 10.0), borderRadius: BorderRadius.circular(24), width: 120))
                                    : Text(_cartInfo?.payInfo?.totalLabel ?? "", style: TextStyle(fontSize: 20)),
                                isLoading
                                    ? SkeletonLine(
                                        style: SkeletonLineStyle(
                                            padding: EdgeInsets.only(top: 10.0), borderRadius: BorderRadius.circular(24), width: 120))
                                    : Text(_cartInfo?.payInfo?.totalLabelValue ?? "",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                              ],
                            ),
                          )),
                      SizedBox(height: 10),
                      FadeAnimation(
                        0.2,
                        Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              child: buttonGreen(
                                onPressed: () {
                                  var page = _cartInfo?.button?.screen ?? "";
                                  widget._navigation?.navigateTo(page);
                                },
                                tittle: _cartInfo?.button?.text ?? "",
                                isLoading: isLoading,
                              ),
                            )),
                      ),
                    ]));
              });
        });
  }

  cartItem(Product product, int index, animation) {
    return GestureDetector(
      onTap: () {},
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product?.url_imagen ?? "",
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Text(
                  product?.segunda_mano ?? false ? "Usado" : "nuevo",
                  style: TextStyle(
                    color: Colors.orange.shade400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  product?.nombre_producto ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '\$${product.precio}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 10),
              ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 10,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade400,
                    size: 30,
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    ),
                  ),
                ),
                MaterialButton(
                  padding: EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: Colors.yellow[700],
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  initObservers() {
    ref.watch(cartViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

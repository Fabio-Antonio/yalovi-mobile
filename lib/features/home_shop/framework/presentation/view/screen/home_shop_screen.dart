import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/core/navigation/constants/router_paths.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';
import 'package:platzi_trips_app/features/home_shop/di/framework.module.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/modals/add_to_card_modal.dart';
import 'package:platzi_trips_app/widgets/modals/show_filter_Modal.dart';
import 'package:platzi_trips_app/widgets/product_cart.dart';
import 'package:platzi_trips_app/widgets/product_horizontal_product.dart';
import 'package:platzi_trips_app/widgets/skeletons/listview_cards.skeletons.dart';
import 'package:skeletons/skeletons.dart';

class HomeShop extends ConsumerStatefulWidget {
  HomeShop({Key? key}) : super(key: key);
  final NavigationServices? _navigation = locator<NavigationServices>();

  @override
  _HomeShopState createState() => _HomeShopState();
}

class _HomeShopState extends ConsumerState<HomeShop> with TickerProviderStateMixin, BaseView {
  late ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController.addListener(_listenToScrollChange);
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      await ref.watch(drawerViewModelStateNotifierProvider.notifier).getProducts();
    });
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      ref.watch(drawerViewModelStateNotifierProvider.notifier).listenToScrollChangeFlag(true);
    } else {
      ref.watch(drawerViewModelStateNotifierProvider.notifier).listenToScrollChangeFlag(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).isScrolled,
        builder: (context, snapshotFlag) {
          _isScrolled = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).isLoadingHome,
              builder: (context, snapshotFlag) {
                final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
                return StreamBuilder(
                    stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).productsList,
                    builder: (context, snapshotProducts) {
                      final productList = snapshotProducts.hasData ? snapshotProducts.data as HomeDto : HomeDto();
                      return Stack(
                        children: <Widget>[
                          CustomScrollView(controller: _scrollController, slivers: [
                            SliverAppBar(
                              expandedHeight: 300.0,
                              elevation: 0,
                              pinned: true,
                              floating: true,
                              stretch: true,
                              backgroundColor: Colors.grey.shade50,
                              flexibleSpace: FlexibleSpaceBar(
                                  collapseMode: CollapseMode.pin,
                                  titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 100),
                                  stretchModes: [
                                    StretchMode.zoomBackground,
                                    // StretchMode.fadeTitle
                                  ],
                                  title: AnimatedOpacity(
                                    opacity: _isScrolled ? 0.0 : 1.0,
                                    duration: Duration(milliseconds: 500),
                                    child: FadeAnimation(
                                        1,
                                        isLoading
                                            ? SkeletonLine(
                                                style: SkeletonLineStyle(
                                                padding: EdgeInsets.only(top: 195.0),
                                                borderRadius: BorderRadius.circular(24),
                                              ))
                                            : Text(productList.title?.text ?? "",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: productList.title?.fontSize,
                                                ))),
                                  ),
                                  background: isLoading
                                      ? Container()
                                      : Image.network(
                                          productList?.imgUrl ?? "",
                                          fit: BoxFit.cover,
                                        )),
                              bottom: AppBar(
                                toolbarHeight: 70,
                                elevation: 0,
                                automaticallyImplyLeading: false,
                                backgroundColor: Colors.transparent,
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: FadeAnimation(
                                          1.4,
                                          Container(
                                            height: productList?.button?.height,
                                            margin: EdgeInsets.only(bottom: 50),
                                            child: buttonGreen(
                                              onPressed: () {
                                                widget._navigation?.navigateTo(pageCatalogue);
                                              },
                                              tittle: productList?.button?.text ?? "",
                                              isLoading: isLoading,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverList(
                              delegate:
                                  SliverChildListDelegate(List.generate(isLoading ? 3 : productList.sections?.length ?? 0, (idx) {
                                return Container(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    height: isLoading ? 320 : productList?.sections![idx].height,
                                    child: Column(children: [
                                      FadeAnimation(
                                          1.4,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              isLoading
                                                  ? SkeletonLine(
                                                      style: SkeletonLineStyle(
                                                      width: 120,
                                                      padding: EdgeInsets.only(left: 30, right: 30),
                                                      borderRadius: BorderRadius.circular(24),
                                                    ))
                                                  : Text(
                                                      productList?.sections![idx]?.title ?? "",
                                                      style:
                                                          TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                                    ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 20.0),
                                                child: isLoading
                                                    ? SkeletonLine(
                                                        style: SkeletonLineStyle(
                                                        width: 30,
                                                        padding: EdgeInsets.only(left: 30, right: 30),
                                                        borderRadius: BorderRadius.circular(24),
                                                      ))
                                                    : Text(
                                                        productList?.sections![idx]?.label ?? "",
                                                        style: TextStyle(color: Colors.black, fontSize: 14),
                                                      ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                          child: isLoading
                                              ? skeletonCardsView()
                                              : ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: productList.sections![idx].products?.length,
                                                  itemBuilder: (context, index) {
                                                    return productList.sections?[idx].cardType == "normal"
                                                        ? productCart(productList?.sections?[idx]?.products?[index], () {
                                                            addToCartModal(
                                                                productList?.sections?[idx]?.products?[index]?.selectSections);
                                                          }, () {
                                                            widget._navigation?.navigateTo(pageVipProducts);
                                                          })
                                                        : forYou(productList.sections![idx].products![index]);
                                                  }))
                                    ]));
                              })),
                            )
                          ])
                        ],
                      );
                    });
              });
        });
  }

  addToCartModal(List<SelectSectionDto>? sections) {
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: AnimationController(duration: Duration(milliseconds: 400), vsync: this),
        builder: (context) => StatefulBuilder(
              builder: (context, setState) {
                return addToCardModal(
                  selectSections: sections ?? [],
                );
              },
            ));
  }

  showFilterModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return ShowFilterModal();
        });
      },
    );
  }

  initObservers() {
    ref.watch(drawerViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

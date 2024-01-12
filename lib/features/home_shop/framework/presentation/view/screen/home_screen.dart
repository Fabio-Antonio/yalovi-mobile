import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/features/card/framework/presentation/view/screen/card_screen.dart';
import 'package:platzi_trips_app/features/history_shop/framework/presentation/view/screen/history_screen.dart';
import 'package:platzi_trips_app/features/home_shop/di/framework.module.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_info_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/view/screen/home_shop_screen.dart';
import 'package:platzi_trips_app/features/login/di/framework.module.dart';
import 'package:platzi_trips_app/widgets/custome_body.dart';
import 'package:platzi_trips_app/widgets/modals/custome_drawer.dart';

class Home extends ConsumerStatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with BaseView {
  int indexTap = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(drawerViewModelStateNotifierProvider.notifier).getDrawerInfo();
    });
  }

  final List<Widget> widgetsChildren = [HomeShop(), HistoryScreen(), ProductCart()];

  void onTapTapped(int? index) {
    ref.watch(drawerViewModelStateNotifierProvider.notifier).onTapped(index ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).tappedIndex,
        builder: (context, snapshot) {
          indexTap = snapshot.hasData ? snapshot.data as int : 0;
          return StreamBuilder(
              stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).isLoading,
              builder: (context, snapshot) {
                final isLoading = snapshot.hasData ? snapshot.data as bool : false;
                return Scaffold(
                    body: setCustomBody(body: widgetsChildren[indexTap]),
                    bottomNavigationBar: Theme(
                        data: Theme.of(context).copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
                        child: BottomNavigationBar(onTap: onTapTapped, currentIndex: indexTap, items: [
                          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                          BottomNavigationBarItem(icon: Icon(Icons.shopify_outlined), label: ""),
                          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
                        ])),
                    drawer: Drawer(
                        child: StreamBuilder(
                            stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).isLoading,
                            builder: (context, snapshot) {
                              return StreamBuilder(
                                  stream: ref.watch(drawerViewModelStateNotifierProvider.notifier).drawerInfo,
                                  builder: (context, snapshot) {
                                    final DrawerInfoDto? drawerInfo = snapshot.hasData
                                        ? snapshot.data as DrawerInfoDto
                                        : ref.watch(drawerViewModelStateNotifierProvider)?.options != null
                                            ? ref.watch(drawerViewModelStateNotifierProvider)
                                            : DrawerInfoDto();
                                    return DrawerInfo(
                                      drawerInfoDto: drawerInfo,
                                      isLoading: isLoading,
                                      singOutEvent: () {
                                        ref.watch(loginViewModelStateNotifierProvider.notifier).signOut();
                                      },
                                    );
                                  });
                            })));
              });
        });
  }

  initObservers() {
    ref.watch(drawerViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

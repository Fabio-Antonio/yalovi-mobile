import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/core/navigation/constants/router_paths.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';
import 'package:platzi_trips_app/features/catalogue/di/framework.module.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/category.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';
import 'package:platzi_trips_app/widgets/custom_app_bar.dart';
import 'package:platzi_trips_app/widgets/modals/add_to_card_modal.dart';
import 'package:platzi_trips_app/widgets/product_cart.dart';
import 'package:platzi_trips_app/widgets/skeletons/basic_card.skeletons.dart';
import 'package:platzi_trips_app/widgets/skeletons/listview_cards.skeletons.dart';
import 'package:skeletons/skeletons.dart';

class CatalogueScreen extends ConsumerStatefulWidget {
  CatalogueScreen({Key? key}) : super(key: key);

  final NavigationServices? _navigation = locator<NavigationServices>();

  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends ConsumerState<CatalogueScreen> with TickerProviderStateMixin, BaseView {
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(catalogueViewModelStateNotifierProvider.notifier).getCatalogueInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(catalogueViewModelStateNotifierProvider.notifier).isLoading,
        builder: (context, snapshotFlag) {
          final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(catalogueViewModelStateNotifierProvider.notifier).catalogueInfo,
              builder: (context, snapshotProducts) {
                final _catalogueInfo =
                    snapshotProducts.hasData ? snapshotProducts.data as CatalogueResponseDto : CatalogueResponseDto();
                return Scaffold(
                  appBar: AppBarCustom(
                    appBarSize: Size(00.0, 100.0),
                    toolbarHeigh: 90,
                    titleToolbar: SafeArea(
                        child: Container(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: FadeAnimation(
                                1.4,
                                Container(
                                  height: 50,
                                  child: isLoading
                                      ? SkeletonLine(
                                          style: SkeletonLineStyle(
                                            padding: EdgeInsets.all(16.0),
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                        )
                                      : TextField(
                                          readOnly: false,
                                          cursorColor: Colors.grey,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                                            hintText: _catalogueInfo?.input?.textHint,
                                            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                                          ),
                                        ),
                                )),
                          ),
                          SizedBox(width: 10),
                          FadeAnimation(
                              1.5,
                              Container(
                                height: 50,
                                width: 75,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      isLoading
                          ? Container(
                              width: 450,
                              height: 90,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 44),
                              child: basicCardView(height: 80, width: 80),
                            )
                          : catalog(_catalogueInfo?.categories)
                    ]))),
                    allowBack: true,
                    colorBackground: Colors.white,
                  ),
                  body: Stack(
                    children: <Widget>[
                      isLoading
                          ? skeletonCardsView(scrollDirection: Axis.vertical)
                          : CustomScrollView(controller: _scrollController, slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate(List.generate(_catalogueInfo?.products?.length ?? 0, (idx) {
                                  return Container(
                                      padding: EdgeInsets.only(top: 20, left: 20),
                                      child: Column(children: [
                                        FadeAnimation(
                                          1.4,
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ),
                                        Container(
                                            height: MediaQuery.of(context).size.height * .35,
                                            width: MediaQuery.of(context).size.width * .85,
                                            child: productCart(_catalogueInfo?.products?[idx], () {
                                              addToCartModal(_catalogueInfo?.products?[idx]?.selectSections);
                                            }, () {
                                              widget._navigation?.navigateTo(pageVipProducts);
                                            }))
                                      ]));
                                })),
                              )
                            ])
                    ],
                  ),
                );
              });
        });
  }

  Widget catalog(List<CategoryDto>? categories) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 1.8,
            ),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 44),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 3.0,
                  children: List<Widget>.generate(
                    categories?.length ?? 0,
                    (int index) {
                      return ChoiceChip(
                        label: Container(
                            alignment: Alignment.center,
                            width: 70,
                            child: Text(
                              categories?[index]?.value ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            )),
                        selected: categories?[index]?.isSelected ?? false,
                        selectedColor: Colors.black12,
                        backgroundColor: Colors.black,
                        onSelected: (bool selected) {},
                      );
                    },
                  ).toList(),
                ))));
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

  initObservers() {
    ref.watch(catalogueViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

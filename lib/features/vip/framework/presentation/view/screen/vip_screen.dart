import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/core/utils/dynamic_size.dart';
import 'package:platzi_trips_app/features/vip/di/framework.module.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/view/widget/color_section_list.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/view/widget/standar_section.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/skeletons/cart.skeletons.dart';
import 'package:skeletons/skeletons.dart';

class VipProductScreen extends ConsumerStatefulWidget {
  const VipProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  _VipProductScreen createState() => _VipProductScreen();
}

class _VipProductScreen extends ConsumerState<VipProductScreen> with BaseView {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(vipViewModelStateNotifierProvider.notifier).getVipInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(vipViewModelStateNotifierProvider.notifier).isLoading,
        builder: (context, snapshotFlag) {
          final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(vipViewModelStateNotifierProvider.notifier).vipInfo,
              builder: (context, snapshotProducts) {
                final _vipInfo = snapshotProducts.hasData ? snapshotProducts.data as VipResponseDto : VipResponseDto();
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: CustomScrollView(slivers: [
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.6,
                      elevation: 0,
                      snap: true,
                      floating: true,
                      stretch: true,
                      backgroundColor: Colors.grey.shade50,
                      flexibleSpace: FlexibleSpaceBar(
                          stretchModes: [
                            StretchMode.zoomBackground,
                          ],
                          background: !isLoading
                              ? Image.network(
                                  _vipInfo?.productImage ?? '',
                                  fit: BoxFit.cover,
                                )
                              : cartView()),
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(45),
                          child: Transform.translate(
                            offset: Offset(0, 1),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                  child: Container(
                                width: 50,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                            ),
                          )),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      isLoading
                                          ? SkeletonLine(
                                              style: SkeletonLineStyle(
                                                  padding: EdgeInsets.all(5.0), borderRadius: BorderRadius.circular(24), width: 120))
                                          : Text(
                                              _vipInfo?.productName ?? '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      isLoading
                                          ? SkeletonLine(
                                              style: SkeletonLineStyle(
                                                  padding: EdgeInsets.all(5.0), borderRadius: BorderRadius.circular(24), width: 120))
                                          : Text(
                                              _vipInfo?.productBrand ?? '',
                                              style: TextStyle(
                                                color: Colors.orange.shade400,
                                                fontSize: 14,
                                              ),
                                            ),
                                      isLoading
                                          ? SkeletonLine(
                                              style: SkeletonLineStyle(
                                                  padding: EdgeInsets.all(5.0), borderRadius: BorderRadius.circular(24), width: 120))
                                          : Text(
                                              _vipInfo?.productPriceLabel ?? '',
                                              style: TextStyle(color: Colors.black, fontSize: 16),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: DynamicSize.getDynamicSize<String>(
                                    99.0, _vipInfo?.productDescriptions ?? [], 400.0), // Set a fixed height or adjust as needed
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                                  itemCount: _vipInfo.productDescriptions?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(_vipInfo?.productDescriptions?[index] ?? ""),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              isLoading
                                  ? cartView()
                                  : Container(
                                      height: DynamicSize.getDynamicSize<SelectSectionDto>(
                                          115.0, _vipInfo?.selectSections ?? [], 800.0), // Set a fixed height or adjust as needed
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(), // Disable scrolling
                                        itemCount: _vipInfo.selectSections?.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          var selection = _vipInfo?.selectSections?[index];

                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                selection?.title ?? "",
                                                style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              selection?.isColor ?? false
                                                  ? colorSection(selection?.values ?? [], 0)
                                                  : getStandarSection(selection?.values ?? [], 0)
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                0.2,
                                Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      child: buttonGreen(
                                        onPressed: () {},
                                        tittle: _vipInfo?.button?.text ?? "",
                                        isLoading: isLoading,
                                      ),
                                    )),
                              ),
                            ],
                          )))
                    ])),
                  ]),
                );
              });
        });
  }

  initObservers() {
    ref.watch(vipViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/features/checkout/di/framework.module.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/banner_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/method_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/presentation/view/widget/pay_method_banner.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/skeletons/basic_card.skeletons.dart';
import 'package:platzi_trips_app/widgets/skeletons/cart.skeletons.dart';
import 'package:skeletons/skeletons.dart';

import '../widget/list_methods_items.dart';

class PayScreen extends ConsumerStatefulWidget {
  PayScreen({Key? key}) : super(key: key);

  @override
  _PayScreen createState() => _PayScreen();
}

class _PayScreen extends ConsumerState<PayScreen> with BaseView {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(payViewModelStateNotifierProvider.notifier).getPayInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(payViewModelStateNotifierProvider.notifier).isLoading,
        builder: (context, snapshotFlag) {
          final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(payViewModelStateNotifierProvider.notifier)?.payInfo,
              builder: (context, snapshotProducts) {
                final _payInfo = snapshotProducts.hasData ? snapshotProducts.data as PayResponseDto : PayResponseDto();
                final _foundSelected =
                    _payInfo?.paymentMethods?.methods?.firstWhere((element) => element.isSelected == true, orElse: () => MethodDto());

                return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text(
                        _payInfo?.title?.text ?? '',
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: BackButton(
                        color: Colors.black,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isLoading || _foundSelected?.isSelected == null
                                ? cartView()
                                : bannerWidget(
                                    isCash: _foundSelected?.isCash ?? false, banner: _foundSelected?.banner ?? BannerDto()),
                            SizedBox(
                              height: 50,
                            ),
                            FadeAnimation(
                                1.2,
                                isLoading
                                    ? SkeletonLine(
                                        style: SkeletonLineStyle(
                                        padding: EdgeInsets.all(16.0),
                                        borderRadius: BorderRadius.circular(24),
                                      ))
                                    : Text(
                                        _payInfo?.paymentMethods?.title ?? "",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      )),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                                1.3,
                                Container(
                                    height: 50,
                                    child: isLoading
                                        ? Container(
                                            width: 250,
                                            child: basicCardView(),
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _payInfo?.paymentMethods?.methods?.length,
                                            itemBuilder: (context, idx) {
                                              return listMethodItemWidget(
                                                  isSelected: _payInfo?.paymentMethods?.methods?[idx]?.isSelected ?? false,
                                                  onTap: () {
                                                    ref.watch(payViewModelStateNotifierProvider.notifier).setSelected(idx);
                                                  },
                                                  icon: _payInfo?.paymentMethods?.methods?[idx]?.icon ?? "");
                                            }))),
                            SizedBox(
                              height: 30,
                            ),
                            Visibility(
                                visible: _foundSelected?.isCash == true ? false : true,
                                child: FadeAnimation(
                                    1.4,
                                    Container(
                                        padding: EdgeInsets.only(left: 20, bottom: 30, top: 20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              isLoading
                                                  ? Container(
                                                      width: 250,
                                                      height: 250,
                                                      child: SkeletonLine(
                                                          style: SkeletonLineStyle(
                                                        padding: EdgeInsets.all(16.0),
                                                        borderRadius: BorderRadius.circular(24),
                                                      )))
                                                  : Text(
                                                      _payInfo?.cardForm?.title ?? "",
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                    ),
                                            ],
                                          ),
                                          TextFormField(
                                              decoration: InputDecoration(
                                                border: UnderlineInputBorder(),
                                                labelText: _payInfo?.cardForm?.nameHint ?? "",
                                              ),
                                              keyboardType: TextInputType.name),
                                          TextFormField(
                                              decoration: InputDecoration(
                                                border: UnderlineInputBorder(),
                                                labelText: _payInfo?.cardForm?.cardNumberHint ?? "",
                                              ),
                                              keyboardType: TextInputType.number),
                                          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                                            Container(
                                              width: 50,
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    labelText: _payInfo?.cardForm?.monthHint ?? "",
                                                  ),
                                                  keyboardType: TextInputType.number),
                                            ),
                                            Container(
                                              width: 50,
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    labelText: _payInfo?.cardForm?.yearHint ?? "",
                                                  ),
                                                  keyboardType: TextInputType.number),
                                            ),
                                            Container(
                                              width: 50,
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    labelText: _payInfo?.cardForm?.securityHint ?? "",
                                                  ),
                                                  keyboardType: TextInputType.number),
                                            )
                                          ])
                                        ])))),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                                1.5,
                                Container(
                                    padding: EdgeInsets.only(left: 20, bottom: 30),
                                    width: double.infinity,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _payInfo?.addressForm?.title ?? "",
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  isLoading
                                                      ? Container(
                                                          width: 250,
                                                          height: 250,
                                                          child: SkeletonLine(
                                                              style: SkeletonLineStyle(
                                                            padding: EdgeInsets.all(16.0),
                                                            borderRadius: BorderRadius.circular(24),
                                                          )))
                                                      : Text(_payInfo?.address?.title ?? ""),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 20,
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                      TextFormField(
                                          decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: _payInfo?.addressForm?.cityHint ?? "",
                                          ),
                                          keyboardType: TextInputType.name),
                                      TextFormField(
                                          decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: _payInfo?.addressForm?.countyHint ?? "",
                                          ),
                                          keyboardType: TextInputType.name),
                                      TextFormField(
                                          decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: _payInfo?.addressForm?.streetHint ?? "",
                                          ),
                                          keyboardType: TextInputType.name),
                                      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                                        Container(
                                          width: 150,
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                border: UnderlineInputBorder(),
                                                labelText: _payInfo?.addressForm?.numberHint ?? "",
                                              ),
                                              keyboardType: TextInputType.number),
                                        ),
                                        Container(
                                          width: 150,
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                border: UnderlineInputBorder(),
                                                labelText: _payInfo?.addressForm?.zipHint ?? "",
                                              ),
                                              keyboardType: TextInputType.number),
                                        )
                                      ])
                                    ]))),
                            SizedBox(
                              height: 60,
                            ),
                            FadeAnimation(
                                1.5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    isLoading
                                        ? Container(
                                        width: 150,
                                        height: 250,
                                        child: SkeletonLine(
                                            style: SkeletonLineStyle(
                                              padding: EdgeInsets.all(16.0),
                                              borderRadius: BorderRadius.circular(24),
                                            )))
                                        :  Text(
                                      _payInfo?.paymentMethods?.totalLabel ?? "",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                    isLoading
                                        ? Container(
                                        width: 150,
                                        height: 250,
                                        child: SkeletonLine(
                                            style: SkeletonLineStyle(
                                              padding: EdgeInsets.all(16.0),
                                              borderRadius: BorderRadius.circular(24),
                                            )))
                                        :   Text(_payInfo?.paymentMethods?.totalLabelValue ?? "",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                                  ],
                                )),
                            SizedBox(height: 20),
                            FadeAnimation(
                              1.4,
                              buttonGreen(
                                onPressed: () {},
                                tittle: _payInfo?.button?.text ?? "",
                                isLoading: isLoading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              });
        });
  }

  initObservers() {
    ref.watch(payViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

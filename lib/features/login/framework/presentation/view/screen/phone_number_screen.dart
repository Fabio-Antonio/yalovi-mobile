import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/navigation/constants/router_paths.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';
import 'package:platzi_trips_app/features/login/di/framework.module.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/custome_body.dart';
import 'package:platzi_trips_app/widgets/modals/otp_modal.dart';

class MyPhone extends ConsumerStatefulWidget {
  final NavigationServices? _navigation = locator<NavigationServices>();
  MyPhone({Key? key}) : super(key: key);

  @override
  _MyPhoneState createState() => _MyPhoneState();
}

class _MyPhoneState extends ConsumerState<MyPhone> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.read(loginViewModelStateNotifierProvider.notifier).getVerificationInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: ref.watch(loginViewModelStateNotifierProvider.notifier).isLoading,
            builder: (context, snapshot) {
              final isLoading = snapshot.hasData ? snapshot.data as bool : false;
              return setCustomBody(
                  body: StreamBuilder(
                      stream: ref.watch(loginViewModelStateNotifierProvider.notifier).getVerificationInfoComponents,
                      builder: (context, snapshot) {
                        final infoComponents = snapshot.hasData ? snapshot.data as VerificationResponse : null;
                        countryController.text = infoComponents?.countryCode ?? "";
                        final phoneValidation = infoComponents?.user?.requirePhoneValidation ?? false;
                        return Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Skeleton(
                                  isLoading: isLoading,
                                  skeleton: SkeletonLine(
                                      style: SkeletonLineStyle(
                                          padding: EdgeInsets.all(22.0),
                                          borderRadius: BorderRadius.circular(24),
                                          height: 22)),
                                  child: Text(
                                    infoComponents?.title ?? "",
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Skeleton(
                                    isLoading: isLoading,
                                    skeleton: SkeletonLine(
                                        style: SkeletonLineStyle(borderRadius: BorderRadius.circular(24), height: 16)),
                                    child: Text(
                                      infoComponents?.subTitle ?? "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Visibility(
                                    visible: isLoading || phoneValidation,
                                    child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Skeleton(
                                            isLoading: isLoading,
                                            skeleton: SkeletonLine(
                                                style: SkeletonLineStyle(
                                                    borderRadius: BorderRadius.circular(24), height: 22)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                    width: 40,
                                                    child: TextField(
                                                      controller: countryController,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                      ),
                                                    )),
                                                Text(
                                                  "|",
                                                  style: TextStyle(fontSize: 33, color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    keyboardType: TextInputType.phone,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: infoComponents?.inputHint ?? "",
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )))),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: isLoading || phoneValidation,
                                  child: Skeleton(
                                      isLoading: isLoading,
                                      skeleton: SkeletonLine(
                                          style: SkeletonLineStyle(
                                              padding: EdgeInsets.only(left: 50.0, right: 20.0),
                                              borderRadius: BorderRadius.circular(24),
                                              height: 50,
                                              width: 250)),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: buttonGreen(
                                          onPressed: () {
                                            showOtpModal(context, infoComponents?.bottomShetText);
                                          },
                                          isLoading: isLoading,
                                          tittle: infoComponents?.btnLabel ?? "",
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
            }));
  }

  void whatToDoOtp(String otp) async {
    widget._navigation!.navigateTo(pageHome);
  }

  showOtpModal(context, titleBottomSheet) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return OtpModal(
            callBack: whatToDoOtp,
            title: titleBottomSheet,
          );
        });
      },
    );
  }

  initObservers() {
    ref.watch(loginViewModelStateNotifierProvider.notifier).showOtpModal.listen((_title) {
      showOtpModal(context, _title);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/features/history_shop/di/framework.module.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';
import 'package:platzi_trips_app/features/history_shop/framework/presentation/view/widgets/history_card.dart';
import 'package:platzi_trips_app/widgets/custome_tab_view.dart';
import 'package:platzi_trips_app/widgets/skeletons/tab_bar.skeletons.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  HistoryScreen({
    Key? key,
  });

  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends ConsumerState<HistoryScreen> with BaseView {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initObservers();
      ref.watch(historyViewModelStateNotifierProvider.notifier).getHistoryInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(historyViewModelStateNotifierProvider.notifier).isLoading,
        builder: (context, snapshotFlag) {
          final isLoading = snapshotFlag.hasData ? snapshotFlag.data as bool : false;
          return StreamBuilder(
              stream: ref.watch(historyViewModelStateNotifierProvider.notifier).historyInfo,
              builder: (context, snapshotProducts) {
                final _history = snapshotProducts.hasData ? snapshotProducts.data as HistoryDto : HistoryDto();
                return Scaffold(
                    body: isLoading
                        ? TabBarSkeletonView()
                        : CustomTabView(
                            initPosition: 0,
                            itemCount: _history.tabs?.length ?? 0,
                            tabBuilder: (context, index) => Tab(
                                child: Text(
                              _history.tabs![index].text ?? "",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              ),
                            )),
                            pageBuilder: (context, index) => Center(
                                child: ListView.builder(
                                    itemCount: _history.tabs![index].tabList?.length,
                                    itemBuilder: (context, idx) {
                                      return Card(
                                        elevation: 4.0,
                                        child: HistoryCard(_history.tabs![index].tabList![idx]) ,
                                      )

                                        ;
                                    })),
                            onPositionChange: (index) {},
                            onScroll: (position) {},
                          ));
              });
        });
  }

  initObservers() {
    ref.watch(historyViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

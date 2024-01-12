import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/skeletons/listview.skeletons.dart';
import 'package:skeletons/skeletons.dart';

Widget TabBarSkeletonView() => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          bottom: TabBar(
            tabs: [
              Tab(
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    padding: EdgeInsets.all(16.0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Tab(
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    padding: EdgeInsets.all(16.0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Tab(
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    padding: EdgeInsets.all(16.0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SkeletonView(),
            SkeletonView(),
            SkeletonView(),
          ],
        ),
      ),
    );

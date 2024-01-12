import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_info_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/view/widgets/profile_header.dart';
import 'package:platzi_trips_app/widgets/skeletons/avatar.skeletons.dart';
import 'package:platzi_trips_app/widgets/skeletons/listview.skeletons.dart';

class DrawerInfo extends StatelessWidget {
  final DrawerInfoDto? drawerInfoDto;
  final bool isLoading;
  final VoidCallback? singOutEvent;

  DrawerInfo({Key? key, this.drawerInfoDto, required this.isLoading, this.singOutEvent});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: DrawerHeader(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                gradient: LinearGradient(
                    colors: [Color(0xFFF6E2CA), Color(0xFFE5CDB3)],
                    begin: FractionalOffset(0.3, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: drawerInfoDto?.userAuth != null ? ProfileHeader(drawerInfoDto!.userAuth) : AvatarsView(),
          )),
      Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: isLoading
              ? SkeletonView()
              : ListView.separated(
                  itemCount: drawerInfoDto!.options?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(drawerInfoDto!.options![index]?.title ?? ""),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    //The calculate is to show white divider each two elements
                    return (index + 1) % 2 == 0 ? const Divider(color: Colors.white) : Container(height: 1);
                  })),
      ListTile(
        title: const Text('Salir'),
        onTap: singOutEvent,
      ),
    ]));
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/view/widgets/user_info.dart';
import 'package:platzi_trips_app/features/login/framework/model/user.dart';

class ProfileHeader extends StatelessWidget {
  UserAuth? _user;
  ProfileHeader(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 10.0, top: 0.0),
      child: Column(
        children: <Widget>[UserInfoComponent(_user)],
      ),
    );
  }
}

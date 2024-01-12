import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/base_view.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/view/screen/home_screen.dart';
import 'package:platzi_trips_app/features/login/di/framework.module.dart';
import 'package:platzi_trips_app/features/login/framework/model/user.dart';
import 'package:platzi_trips_app/features/login/framework/presentation/view/screen/phone_number_screen.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class SignInScreen extends ConsumerStatefulWidget {
  SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> with BaseView {
  late bool permissionGranted = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      ref.watch(loginViewModelStateNotifierProvider.notifier).permissionService();
      initObservers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: ref.watch(loginViewModelStateNotifierProvider.notifier).getSessionStatus(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final user = snapshot.hasData ? snapshot.data as User : null;

          return StreamBuilder(
              stream: ref.watch(loginViewModelStateNotifierProvider.notifier).permissionGranted,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final status = snapshot.hasData ? snapshot.data as bool : false;
                if (!snapshot.hasData || snapshot.hasError) {
                  return signInGoogleUI();
                } else {
                  if (status == false || (user?.uid ?? '').isEmpty) {
                    return signInGoogleUI();
                  } else if (ref.watch(loginViewModelStateNotifierProvider.notifier).isLogin) {
                    setUser(user);
                    return MyPhone();
                  } else {
                    setUser(user);
                    return Home();
                  }
                }
              });
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "¡BIENVENIDO A\n VIVERCIDAD!",
                style: TextStyle(fontSize: 37.0, fontFamily: "Lato", color: Color(0xFF184F0C), fontWeight: FontWeight.bold),
              ),
              buttonGreen(
                onPressed: () {
                  ref.watch(loginViewModelStateNotifierProvider.notifier).signIn();
                },
                isLoading: false,
                tittle: "Ingresar con Google",
              )
            ],
          )
        ],
      ),
    );
  }

  setUser(User? user) {
    ref.watch(loginViewModelStateNotifierProvider.notifier).setUserAuth(UserAuth(
        name: user?.displayName ?? "", email: user?.email ?? "", photoURL: user?.photoURL ?? "", phoneNumber: user?.phoneNumber));
  }

  initObservers() {
    ref.watch(loginViewModelStateNotifierProvider.notifier).showModalError.listen((_error) {
      messageError(context, _error);
    });
  }
}

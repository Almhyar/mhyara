import 'package:bot_toast/bot_toast.dart';
import 'package:empty_project/UI/views/splash_screen/splash_screen_view.dart';
import 'package:empty_project/core/enums/connectivity_status.dart';
import 'package:empty_project/core/translation/app_translation.dart';
import 'package:empty_project/core/utils/general_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      initialData: ConnectivityStatus.ONLINE,
      child: GetMaterialApp(
          defaultTransition:
              GetPlatform.isAndroid ? Transition.fadeIn : Transition.cupertino,
          transitionDuration: Duration(milliseconds: 300),
          translations: AppTranlation(),
          locale: getLocal(),
          fallbackLocale: getLocal(),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //       // backgroundColor: Colors.transparent,
          //       ),
          // ),
          title: 'Flutter Demo',
          home: const SplashScreenView()),
    );
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}

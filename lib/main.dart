import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/getIt.dart';
import 'package:pozitive/Pages/lancherPage.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';

Future<void> main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console

      );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(18, 122, 69, 1), //Colors.blue // navigation bar color
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AutService().user),
        ChangeNotifierProvider<SiteListProvider>.value(
          value: SiteListProvider(),
        ),
        ChangeNotifierProvider<GroupQuotaionDetailsProvider>.value(
          value: GroupQuotaionDetailsProvider(),
        ),
        ChangeNotifierProvider<TabController3Provider>.value(
          value: TabController3Provider(),
        ),
      ],
      child: MaterialApp(
        title: 'Pozitive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          fontFamily: "Roboto",
          primarySwatch: MaterialColor(
            Color.fromRGBO(18, 122, 69, 1).value,
            {
              50: Color.fromRGBO(18, 122, 69, 1),
              100: Color.fromRGBO(18, 122, 69, 1),
              200: Color.fromRGBO(18, 122, 69, 1),
              300: Color.fromRGBO(18, 122, 69, 1),
              400: Color.fromRGBO(18, 122, 69, 1),
              500: Color.fromRGBO(18, 122, 69, 1),
              600: Color.fromRGBO(18, 122, 69, 1),
              700: Color.fromRGBO(18, 122, 69, 1),
              800: Color.fromRGBO(18, 122, 69, 1),
              900: Color.fromRGBO(18, 122, 69, 1)
            },
          ),
          scaffoldBackgroundColor: Color.fromRGBO(228, 241, 215, 1),
        ),
        home: LaunchScreen(),
      ),
    );
  }
}

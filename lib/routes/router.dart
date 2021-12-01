import 'package:flutter_app/resources/pages/form_doi_tuong_page.dart';
import 'package:flutter_app/resources/pages/form_kiem_tra_page.dart';
import 'package:flutter_app/resources/pages/giam_sat_page.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/kiem_tra_page.dart';
import 'package:flutter_app/resources/pages/thu_thap_page.dart';
import 'package:flutter_app/resources/pages/tra_cuu_page.dart';

import 'package:nylo_framework/nylo_framework.dart';
import 'package:page_transition/page_transition.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| // Run the below in the terminal to create new a page and controller.
| // "flutter pub run nylo_framework:main make:page my_page -c"
| // Learn more https://nylo.dev/docs/2.x/router
|--------------------------------------------------------------------------
*/

buildRouter() => nyRoutes((router) {
      // router.route("/", (context) => MyHomePage(title: "Hello World"));

      // Add your routes here
      router.route(MyHomePage.route, (context) => MyHomePage(),
          transition: PageTransitionType.fade);
      router.route(ThuThapPage.route, (context) => ThuThapPage(),
          transition: PageTransitionType.fade);
      router.route(KiemTraPage.route, (context) => KiemTraPage(),
          transition: PageTransitionType.fade);
      router.route(TraCuuPage.route, (context) => TraCuuPage(),
          transition: PageTransitionType.fade);
      router.route(GiamSatPage.route, (context) => GiamSatPage(),
          transition: PageTransitionType.fade);
      router.route(FormDoiTuongPage.route, (context) => FormDoiTuongPage(),
          transition: PageTransitionType.fade);
      router.route(FormKiemTraPage.route, (context) => FormKiemTraPage(),
          transition: PageTransitionType.fade);
      // router.route("/new-page", (context) => NewPage(), transition: PageTransitionType.fade);
    });

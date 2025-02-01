import 'package:football_app/app/modules/auth/views/login_view.dart';
import 'package:football_app/app/modules/auth/views/sign_up_view.dart';
import 'package:football_app/app/modules/bottom_navigation/view/bottom_nav_view.dart';
import 'package:football_app/app/modules/gallery/view/gallery_view.dart';
import 'package:football_app/app/modules/match_statistics/view/match_statistic_view.dart';
import 'package:football_app/app/modules/splash/view/splash_view.dart';
import 'package:football_app/app/modules/standings/binding/standings_binding.dart';
import 'package:football_app/app/modules/standings/view/standings_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/auth/binding/auth_binding.dart';
import '../modules/bottom_navigation/binding/bottom_nav_binding.dart';
import '../modules/gallery/binding/gallery_binding.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/match_statistics/binding/match_statistic_binding.dart';
import '../modules/player_statistics/binding/player_statistics_binding.dart';
import '../modules/player_statistics/view/player_statistics_view.dart';
import '../modules/splash/binding/splash_binding.dart';

class AppRoutes {
  static const splash = '/splash';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const bottomNavBar='/bottomNavBar';
  static const home = '/home';
  static const standings='/standings';
  static const matchStatistics='/match-statistics';
  static const playerStatistics="/player-statistics";

  static const image="/image";




  static final routes =[
  GetPage(
    name: splash,
    page: () => SplashView(),
    binding: SplashBinding(),
  ),
    GetPage(
      name: signIn,
      page: () =>  LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: signUp,
      page: () =>  SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: bottomNavBar,
      page: () =>  BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: standings,
      page: () =>  StandingsView(),
      binding: StandingsBinding(),
    ),
    GetPage(
      name: matchStatistics,
      page: () =>  MatchStatisticsView(),
      binding: MatchStatisticsBinding(),
    ),
    GetPage(
      name: playerStatistics,
      page: () =>  PlayerStatisticsView(),
      binding: PlayerStatisticsBinding(),
    ),
    GetPage(
      name: image,
      page: () =>  GalleryView(),
      binding: GalleryBinding(),
    ),
  ];
}
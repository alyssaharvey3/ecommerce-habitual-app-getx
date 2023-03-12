// ignore_for_file: avoid_classes_with_only_static_members

import 'package:get/get.dart';

import '../presentation/base_screen/base_screen.dart';
import '../presentation/introduction_screen/introduction_screen.dart';
import '../presentation/onboarding_screen/onboarding1_screen.dart';
import '../presentation/onboarding_screen/onboarding2_screen.dart';
import '../presentation/onboarding_screen/onboarding3_screen.dart';

// part 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.introRoute;

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.introRoute,
      page: () => const IntroductionScreen(),
      transitionDuration: Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    ),
    /* 
    * ===== Onboarding Pages =====
     */
    GetPage(
      name: AppRoutes.onBoarding1Route,
      page: () => const OnBoarding1Screen(),
      transitionDuration: Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onBoarding2Route,
      page: () => const OnBoarding2Screen(),
      transitionDuration: Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onBoarding3Route,
      page: () => const OnBoarding3Screen(),
      transitionDuration: Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.baseRoute,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class AppRoutes {
  static const introRoute = '/intro';
  static const onBoarding1Route = '/onBoarding1';
  static const onBoarding2Route = '/onBoarding2';
  static const onBoarding3Route = '/onBoarding3';
  static const registration1Route = '/registration1';
  static const registration2Route = '/registration2';
  static const registration3Route = '/registration3';
  static const registration4Route = '/registration4';
  static const registrationCompleteRoute = '/registrationComplete';
  static const baseRoute = '/';
  static const cartRoute = '/cart';
  static const categoriesRoute = '/categories';
  static const checkoutRoute = '/checkout';
  static const myInterestsRoute = '/myInterests';
  static const orderConfirmationRoute = '/orderConfirmation';
  static const productDetailsRoute = '/productDetails';
  static const profileRoute = '/profile';
  static const searchRoute = '/search';
  static const wishlistRoute = '/wishlist';
  static const deliveryRoute = '/delivery';
}

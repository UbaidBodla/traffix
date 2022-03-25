import 'package:traffix/app/modules/select_plan/views/select_plan_view.dart';
import 'package:traffix/app/modules/select_plan/bindings/select_plan_binding.dart';
import 'package:traffix/app/modules/feedback/views/feedback_view.dart';
import 'package:traffix/app/modules/feedback/bindings/feedback_binding.dart';
import 'package:traffix/app/modules/monitored_location/views/add_location.dart';
import 'package:traffix/app/modules/monitored_location/views/monitored_location_view.dart';
import 'package:traffix/app/modules/monitored_location/bindings/monitored_location_binding.dart';
import 'package:traffix/app/modules/forgot_password/views/reset.dart';
import 'package:traffix/app/modules/forgot_password/views/setPassword.dart';
import 'package:traffix/app/modules/payment/views/add_payment.dart';
import 'package:traffix/app/modules/profile/views/profile2.dart';
import 'package:traffix/app/modules/profile/views/profile_view.dart';
import 'package:traffix/app/modules/profile/bindings/profile_binding.dart';
import 'package:traffix/app/modules/settings/bindings/personals_bindings.dart';
import 'package:traffix/app/modules/settings/views/personal_view.dart';
import 'package:traffix/app/modules/spot/views/spot_view.dart';
import 'package:traffix/app/modules/spot/bindings/spot_binding.dart';
import 'package:traffix/app/modules/subscription/views/subscription_view.dart';
import 'package:traffix/app/modules/subscription/bindings/subscription_binding.dart';
import 'package:traffix/app/modules/settings/views/settings_view.dart';
import 'package:traffix/app/modules/settings/bindings/settings_binding.dart';
import 'package:traffix/app/modules/payment/views/payment_view.dart';
import 'package:traffix/app/modules/payment/bindings/payment_binding.dart';
import 'package:traffix/app/modules/wallet/views/wallet_view.dart';
import 'package:traffix/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:traffix/app/modules/location/views/location_view.dart';
import 'package:traffix/app/modules/location/bindings/location_binding.dart';
import 'package:traffix/app/modules/notification/views/notification_view.dart';
import 'package:traffix/app/modules/notification/bindings/notification_binding.dart';
import 'package:traffix/app/modules/search_screen/views/search_screen_view.dart';
import 'package:traffix/app/modules/search_screen/bindings/search_screen_binding.dart';
import 'package:traffix/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:traffix/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:traffix/app/modules/sign_up/views/sign_up_view.dart';
import 'package:traffix/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:traffix/app/modules/sign_in/views/sign_in_view.dart';
import 'package:traffix/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:traffix/app/modules/onboarding/views/onboarding_view.dart';
import 'package:traffix/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:traffix/app/modules/home/views/home_view.dart';
import 'package:traffix/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:traffix/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
  
    GetPage(
      name: Routes.PROFILEDETAILS,
      page: () => ProfileDetails(),
    ),
    GetPage(
      name: Routes.ONBOARDING, 
      page:()=> OnboardingView(), 
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN, 
      page:()=> SignInView(), 
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP, 
      page:()=> SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD, 
      page:()=> ForgotPasswordView(), 
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_SCREEN, 
      page:()=> SearchScreenView(), 
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION, 
      page:()=> NotificationView(), 
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.LOCATION, 
      page:()=> LocationView(), 
      binding: LocationBinding(),
    ),
    GetPage(
      name: Routes.WALLET, 
      page:()=> WalletView(), 
      binding: WalletBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT, 
      page:()=> PaymentView(), 
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS, 
      page:()=> SettingsView(), 
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.PersonalView,
      page: () => PersonalView(),
    ),
    GetPage(
      name: Routes.SUBSCRIPTION, 
      page:()=> SubscriptionView(), 
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: Routes.SPOT,
      page: () => SpotView(),
      binding: SpotBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.ADDPAYMENT,
      page: () => AddPayment(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Routes.SETPASSWORD,
      page: () => SetPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.RESETOTP,
      page: () => ResetOTP(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.MONITORED_LOCATION, 
      page:()=> MonitoredLocationView(), 
      binding: MonitoredLocationBinding(),
    ),
    GetPage(
      name: Routes.FEEDBACK, 
      page:()=> FeedbackView(), 
      binding: FeedbackBinding(),
    ),
  GetPage(
      name: Routes.ADDLOCATION,
      page: () => AddLocation(),
      binding: MonitoredLocationBinding(),
    ),
    GetPage(
      name: Routes.SELECT_PLAN,
      page: () => SelectPlanView(),
      binding: SelectPlanBinding(),
    ),
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => SplashScreen(),
      // binding: SelectPlanBinding(),
    ),
  ];
}
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/bindings/auth_binding/forget_password_binding.dart';
import 'package:eve_travel_app/view/authentication/forget_password.dart';
import 'package:eve_travel_app/view/splash_screen/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.createAccountScreen,
      page: () => const CreateAccountScreen(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.createEventScreen,
      page: () => const CreateEventScreen(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.massageScreen,
      page: () => const MassageScreen(),
      binding: MassageBinding(),
    ),
    GetPage(
      name: AppRoutes.filterScreen,
      page: () => const FilterScreen(),
      binding: FilterScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.attendanceScreen,
      page: () => const AttendanceScreen(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
  ];
}

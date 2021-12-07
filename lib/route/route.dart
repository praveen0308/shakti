import 'package:flutter/material.dart';
import 'package:shakti/ui/dashboard/main_dashboard.dart';
import 'package:shakti/ui/services/government_scheme_detail.dart';
import 'package:shakti/ui/services/request_document.dart';
import 'package:shakti/ui/services/request_free_tuition.dart';
import 'package:shakti/ui/services/request_scheme.dart';
import 'package:shakti/ui/services/request_service.dart';
import 'package:shakti/ui/welcome/forgot_password.dart';
import 'package:shakti/ui/welcome/login.dart';
import 'package:shakti/ui/welcome/register.dart';
import 'package:shakti/ui/welcome/verify_otp.dart';
import 'package:shakti/ui/welcome/welcome_screen.dart';
// importing our pages into our route.dart

// variable for our route names
const String welcome = 'welcome';
const String loginPage = 'login';
const String verifyOtp = 'verifyOtp';
const String register = 'register';
const String forgotPassword = 'forgotPassword';
const String mainDashboard = 'mainDashboard';
const String requestDocument = 'requestDocument';
const String requestService = 'requestService';
const String governmentSchemeDetail = 'governmentSchemeDetail';
const String requestScheme = 'requestScheme';
const String requestTuition = 'requestTuition';

void login() {}

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case welcome:
      return MaterialPageRoute(builder: (context) => const WelcomeScreen());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const Login());
    case verifyOtp:
      return MaterialPageRoute(
          builder: (context) => const VerifyOtp(), settings: settings);
    case register:
      return MaterialPageRoute(builder: (context) => const Register());
    case forgotPassword:
      return MaterialPageRoute(builder: (context) => const ForgotPassword());
    case mainDashboard:
      return MaterialPageRoute(builder: (context) => const MainDashboardPage());
    case requestDocument:
      return MaterialPageRoute(
          builder: (context) => const RequestDocument(), settings: settings);
    case requestService:
      return MaterialPageRoute(
          builder: (context) => const RequestService(), settings: settings);
    case governmentSchemeDetail:
      return MaterialPageRoute(
          builder: (context) => const GovernmentSchemeRequest(),
          settings: settings);
    case requestScheme:
      return MaterialPageRoute(
          builder: (context) => const RequestScheme(), settings: settings);
    case requestTuition:
      return MaterialPageRoute(
          builder: (context) => const RequestFreeTuition(), settings: settings);
    default:
      throw ('this route name does not exist');
  }
}

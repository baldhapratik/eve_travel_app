import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eve_travel_app/app_imports/app_imports.dart';
import 'package:eve_travel_app/model/add_event_model.dart';
import 'package:eve_travel_app/model/add_room_model.dart';
import 'package:eve_travel_app/model/get_profile_event_model.dart';
import 'package:eve_travel_app/model/get_room_model.dart';
import 'package:eve_travel_app/model/image_upload_model.dart';
import 'package:eve_travel_app/model/resend_otp.dart';
import 'package:eve_travel_app/model/reset_password_model.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();

  factory NetworkRepository() {
    return _networkRepository;
  }

  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();
  Circle circle = Circle();

// user Login
  userLogin(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.login,
        data: authUserData,
      );
      log('Login Response : $authUserResponse');
      return checkResponse(
          authUserResponse, LoginModel.fromJson(authUserResponse['body']));
    } catch (e) {
      // customToast(e.toString());
      customSnackBar('Error', AppColor.redColor, e.toString());
      circle.hide(context);
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  resendOtpApi(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.resendOtp,
        data: authUserData,
      );
      log('Login Response : $authUserResponse');
      return checkResponse(
          authUserResponse, OtpSendModel.fromJson(authUserResponse['body']));
    } catch (e) {
      // customToast(e.toString());
      customSnackBar('Error', AppColor.redColor, e.toString());

      circle.hide(context);
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  //user sign-up
  userSignUp(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.signUp,
        data: authUserData,
      );
      log('SignUp Response : $authUserResponse');
      return checkResponse(
          authUserResponse, SignUpModel.fromJson(authUserResponse['body']));
    } catch (e) {
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  //send OTP to user emailAddress
  otpVerification(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.otpVerification,
        data: authUserData,
      );
      log('OTP Response : $authUserResponse');
      return checkResponse(
          authUserResponse, OtpModel.fromJson(authUserResponse['body']));
    } catch (e, st) {
      log(st.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  resendOtp(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.resendOtp,
        data: authUserData,
      );
      log('OTP Response : $authUserResponse');
      return checkResponse(
          authUserResponse, OtpModel.fromJson(authUserResponse['body']));
    } catch (e, st) {
      log(st.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  forgetPassword(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.forgotPassword,
        data: authUserData,
      );
      log('OTP Response : $authUserResponse');
      return checkResponse(authUserResponse,
          ForgetPasswordModel.fromJson(authUserResponse['body']));
    } catch (e, st) {
      log(st.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  resetPassword(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: Urls.baseUrl + Urls.resetPassword,
        data: authUserData,
      );
      log('OTP Response : $authUserResponse');
      return checkResponse(authUserResponse,
          ResetPasswordModel.fromJson(authUserResponse['body']));
    } catch (e, st) {
      log(st.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getEvent({eventData}) async {
    try {
      final eventDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.homeEvent,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
        data: eventData,
      );
      log('eventData Response : $eventDataResponse');
      return checkResponse(
          eventDataResponse, GetEventModel.fromJson(eventDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getProfileData() async {
    try {
      final profileDataResponse = await NetworkDioHttp.getDioHttpMethod(
        url: Urls.baseUrl + Urls.profile,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          ProfileModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getUserEvent({required String token}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.userEvent,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
        data: {},
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          GetProfileEventModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getUserEventHistory({required String token}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.eventHistory,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
        data: {},
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          GetProfileEventModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getUserFollowers() async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.followers,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
        data: {},
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          FollowersModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getUserFollowing({required String token}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.following,
        // header: Options(
        //   headers: {'Content-Type': 'application/json', 'authorization': token},
        // ),
        data: {},
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          FollowingModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  uploadImage({required String path}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.uploadImage(
        url: Urls.baseUrl + Urls.uploadImage,
        path: path,
      );
      // log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          ImageUploadModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  addEvent({required Map data}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.addEvent,
        data: data,
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          EventModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  addRoom({required Map data}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.addRoom,
        data: data,
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          AddRoomModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getEventParticipate({required Map data}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.eventParticipate,
        data: data,
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          EventModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  getRoom({required Map data}) async {
    try {
      final profileDataResponse = await NetworkDioHttp.postDioHttpMethod(
        url: Urls.baseUrl + Urls.getRoom,
        data: data,
      );
      log('eventData Response : $profileDataResponse');
      return checkResponse(profileDataResponse,
          GetRoomModel.fromJson(profileDataResponse['body']));
    } catch (e, st) {
      log(st.toString());
      log(e.toString());
      // CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  // //forgot password
  // forgotPass(context, authUserData) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.forgotPassword,
  //       data: authUserData,
  //     );
  //     log('forgot password Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         ForgotPasswordModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // // user forgot password OTP verification
  // forgotPassOTPVerification(context, authUserData) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint +
  //           ApiAppConstants.forgotPassVerification,
  //       data: authUserData,
  //     );
  //     log('forgot OTP Verification Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         ForgotPassOtpVerificationModel.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // // Re-set password
  // resetPassword(context, authUserData) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.resetPass,
  //       data: authUserData,
  //     );
  //     log('reset password Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         ChangePasswordModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // changePassword(context, data, token) async {
  //   try {
  //     final res = await NetworkDioHttp.postDioHttpMethod(
  //         context: context,
  //         url: ApiAppConstants.apiEndPoint + ApiAppConstants.changePass,
  //         data: data,
  //         header: token);
  //
  //     return res;
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // //OTP verification
  // // ignore: non_constant_identifier_names
  // OTPVerification(context, authUserData) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.OTPVerification,
  //       data: authUserData,
  //     );
  //     log('OTP Verification Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         OtpVerifyModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // uploadProfileImage(context, data) async {
  //   try {
  //     final res = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.uploadImage,
  //       data: data,
  //     );
  //     log('OTP Verification Response : $res');
  //     return res;
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // //Get user profile
  // getUserProfile(context) async {
  //   try {
  //     final response = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getUserProfile,
  //     );
  //     log("message......>>> $response");
  //     return checkResponse(
  //         response, GetUserProfileModelClass.fromJson(response['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future addTrustee(context, data) async {
  //   try {
  //     final res = await NetworkDioHttp.putDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.updateTrustee,
  //       data: data,
  //     );
  //     log('OTP Verification Response : $res');
  //     return res;
  //   } catch (e) {
  //     log(e.toString());
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getDeathDeclaredby(context) async {
  //   try {
  //     final response = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.userthetdeathdeclare,
  //     );
  //     return checkResponse(
  //         response, DeathDeclareData.fromJson(response['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future rejectDeathDeclaration(context) async {
  //   try {
  //     final response = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint +
  //           ApiAppConstants.rejectDeathDeclaration,
  //     );
  //     return response;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getUserProfileDataById(context, id) async {
  //   try {
  //     final response = await NetworkDioHttp.getDioHttpMethod(
  //         context: context,
  //         url: ApiAppConstants.apiEndPoint +
  //             ApiAppConstants.getUserProfileDetailsById +
  //             id);
  //     return response;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future deleteAccount(context) async {
  //   try {
  //     final response = await NetworkDioHttp.deleteDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.deleteAccount,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     return response;
  //   } catch (e) {
  //     CommonMethod()
  //         .getXSnackBar("Error", "Something went wrong, please try again", red);
  //   }
  // }
  //
  // Future logOut(context) async {
  //   try {
  //     final response = await NetworkDioHttp.deleteDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.logOut,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     return response;
  //   } catch (e) {
  //     CommonMethod()
  //         .getXSnackBar("Error", "Something went wrong, please try again", red);
  //   }
  // }
  //
  // //Update user profile
  // Future updateProfile(context, data) async {
  //   log("Upload image Profile data==> $data");
  //   try {
  //     final response = await NetworkDioHttp.putDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.updateUserProfile,
  //       data: data,
  //     );
  //     return checkResponse2(response);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // // All trustee list
  // trustList(context, authUserData) async {
  //   log('trusteeList Response : $authUserData');
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.trusteeList,
  //       data: authUserData,
  //     );
  //     log('trusteeList Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         TrusteeListModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // myTrustList(context, authUserData) async {
  //   log('trusteeList Response : $authUserData');
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getMyTrusteeStatus,
  //       data: authUserData,
  //     );
  //     log('myy trusteeList Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         TrusteeListModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // getUsers(context, data) async {
  //   log('trusteeList Response : $data');
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getusers,
  //       data: data,
  //     );
  //     log('trusteeList Response : $authUserResponse');
  //     return checkResponse(
  //         authUserResponse, PublicUsersList.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future googleSignin(context, data) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //         context: context,
  //         url: ApiAppConstants.apiEndPoint + ApiAppConstants.googlelogin,
  //         data: data,
  //         header: Options(headers: {'Content-Type': 'application/json'}));
  //     log('google login Response : $authUserResponse');
  //     return checkResponse2(authUserResponse);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future appleLogin(context, data) async {
  //   try {
  //     log("-----body ---$data");
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //         context: context,
  //         url: ApiAppConstants.apiEndPoint + ApiAppConstants.applelogin,
  //         data: data,
  //         header: Options(headers: {'Content-Type': 'application/json'}));
  //     log('google login Response : $authUserResponse');
  //     return checkResponse2(authUserResponse);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // nomineeActionsList(context, authUserData) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.nomineeActions,
  //       data: authUserData,
  //     );
  //     log('trusteeList Response : $authUserResponse');
  //     return checkResponse(authUserResponse,
  //         TrusteeListModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // nomineedeathActionsList(context, data) async {
  //   try {
  //     final response = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.nomineedeathActions,
  //       data: data,
  //     );
  //     log('death action Response : $response');
  //     return checkResponse2(response);
  //     // return checkResponse(authUserResponse,
  //     //     TrusteeListModelClass.fromJson(authUserResponse['body']));
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // getPostbyUserId(context, data) async {
  //   log("=======>?==> $data");
  //   try {
  //     final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getuserspostbyId,
  //       data: data,
  //     );
  //     log('trusteeList Response : $authUserResponse');
  //     return checkResponse2(authUserResponse);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // uploadPostData(context, uploadData) async {
  //   log("datatatatatatatatatatatata ==> $uploadData");
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.uploadPostData,
  //       data: uploadData,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('trusteeList Response : $uploadRes');
  //     return uploadRes;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future createFolder(context, data) async {
  //   log("createFolder ==> $data");
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.userFolder,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('createFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future updateFolder(context, data) async {
  //   log("createFolder ==> $data");
  //   try {
  //     final uploadRes = await NetworkDioHttp.putDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.userFolder,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('createFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e, st) {
  //     print("object $e");
  //     print("object $st");
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future checkEmail(context, data) async {
  //   log("createFolder ==> $data");
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.emailcheck,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('createFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getFolder(context, data) async {
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getuserFolder,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getFolderNominee(context, page) async {
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getfoldernominee,
  //       data: {"page": page, "limit": 10, "status": 0, "search": ""},
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future folderNomineeAction(context, data) async {
  //   log("folderNomineeAction ==> $data");
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.foldernomineeAction,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     print("folderNomineeAction ==> $e");
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future addPostintoFolder(context, data) async {
  //   log("folderNomineeAction ==> $data");
  //   try {
  //     final uploadRes = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.addPostIntoFolder,
  //       data: data,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return uploadRes;
  //   } catch (e) {
  //     print("folderNomineeAction ==> $e");
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getPostFolderDataByID(context, id) async {
  //   log("folderNomineeAction ==> $id");
  //   try {
  //     final uploadRes = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint +
  //           ApiAppConstants.addPostIntoFolderByID +
  //           id,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     print("folderNomineeAction ==> $e");
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getFolderByID(context, id) async {
  //   try {
  //     final uploadRes = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getFolderById + id,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future deleteFolderPostByID(context, id) async {
  //   try {
  //     final uploadRes = await NetworkDioHttp.deleteDioHttpMethod(
  //       context: context,
  //       url:
  //           ApiAppConstants.apiEndPoint + ApiAppConstants.deleteFolderPost + id,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('getFolder : $uploadRes');
  //     return checkResponse2(uploadRes);
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // updatePostData(context, uploadData) async {
  //   log("datatatatatatatatatatatata ==> $uploadData");
  //   try {
  //     final uploadRes = await NetworkDioHttp.putDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.uploadPostData,
  //       data: uploadData,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('trusteeList Response : $uploadRes');
  //     return uploadRes;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // deleteFolder(context, id) async {
  //   log("datatatatatatatatatatatata ==> $id");
  //   try {
  //     final uploadRes = await NetworkDioHttp.deleteDioHttpMethod(
  //       context: context,
  //       url:
  //           ApiAppConstants.apiEndPoint + ApiAppConstants.deleteMainFolder + id,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('trusteeList Response : $uploadRes');
  //     return uploadRes;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // gethomePostData(context, getPostData) async {
  //   log("Home Get Post data ==> $getPostData");
  //   try {
  //     final res = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getHomeData,
  //       data: getPostData,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('gget home date res : $res');
  //     return checkResponse2(res);
  //     // return res;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // getNotifications(context, getPostData) async {
  //   log("Home Get Post data ==> $getPostData");
  //   try {
  //     final res = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint + ApiAppConstants.getNotifications,
  //       data: getPostData,
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //     log('gget home date res : $res');
  //     return res;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // deletePostData(context, postId) async {
  //   log("Home Get Post data ==> $postId");
  //   try {
  //     final res = await NetworkDioHttp.deleteDioHttpMethod(
  //       context: context,
  //       url: ApiAppConstants.apiEndPoint +
  //           ApiAppConstants.deletePostData +
  //           postId,
  //
  //       // header: Options(
  //       //   headers: {
  //       //     'authorization': dataStorages.read("token"),
  //       //   },
  //       // ),
  //     );
  //     log('gget home date res : $res');
  //     return res;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  // Future getPostDatabyId(context, id) async {
  //   // log("Home Get Post data ==> $getPostData");
  //   try {
  //     final res = await NetworkDioHttp.getDioHttpMethod(
  //       context: context,
  //       url: "${ApiAppConstants.apiEndPoint}${ApiAppConstants.getpostbyId}$id",
  //       header: Options(
  //         headers: {
  //           'authorization': dataStorages.read("token"),
  //         },
  //       ),
  //     );
  //
  //     return res;
  //   } catch (e) {
  //     // CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }
  //
  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    log("response check------>$response---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {
      await dataStorage.erase();
      await dataStorage.write("showtimeline", true);
      // Get.offAll(() => const LoginScreen());
    }
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
        // } else {
        //   showErrorDialog(message: response['body']['message']);
        // }
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        log("--Fail--3333");
        return modelResponse;
      } else if (response['body']['status'] == 400 ||
          response['body']['status'] == "400") {
        log("--Fail--12");
        return modelResponse;
      } else if (response['body']['status'] == 404 ||
          response['body']['status'] == "404") {
        log("--Fail--111");
        return modelResponse;
      } else if (response['body']['status'] == 206 ||
          response['body']['status'] == "206") {
        log("--Fail--206");
        return modelResponse;
      } else {
        log("--Fail--1");
        // showErrorDialog(message: response['body']['message']);
        return modelResponse;
      }
    }
    // else {
    //   if (response['body']['status'] == 401 ||
    //       response['body']['status'] == '401') {
    //     showErrorDialog(message: response['body']['message']);
    //     Future.delayed(Duration(seconds: 2), () {
    //       // Get.to(LoginScreen());
    //     });
    // }
    else {
      log("--Fail--");
      // if (dataStorage.read("token") != null) {
      showErrorDialog(message: response['body']['message']);
      // }
    }

    // }
  }

  //
  // Future<void> checkResponse2(
  //   response,
  // ) async {
  //   log("response check------>2${response['body']['message']}---->Checked");
  //   if ((response['body']['status'] == 401 ||
  //           response['body']['status'] == 410) &&
  //       dataStorage.read("token") != null) {
  //     await dataStorages.erase();
  //     await dataStorages.write("showtimeline", true);
  //     Get.offAll(() => const LoginScreen());
  //   }
  //   if (response["error_description"] == null ||
  //       response["error_description"] == 'null') {
  //     if (response['body']['status'] == 200 ||
  //         response['body']['status'] == "200") {
  //       log('${response['body']}');
  //       return response['body'];
  //     } else if (response['body']['status'] == 500 ||
  //         response['body']['status'] == "500") {
  //       showErrorDialog(message: response['body']['message']);
  //       return response['body'];
  //     } else {
  //       showErrorDialog(message: response['body']['message']);
  //     }
  //   } else {
  //     if (dataStorage.read("token") != null) {
  //       showErrorDialog(message: response['error_description']);
  //     }
  //   }
  // }
  //
  void showErrorDialog({required String message}) {
    customSnackBar('Error', AppColor.redColor, message);
    // customToast(message);
  }
}

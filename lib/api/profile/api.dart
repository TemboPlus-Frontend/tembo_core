import 'dart:convert';

import 'package:tembo_core/utils/source.dart';

import '../../constants/typedefs.dart';
import '../../exceptions/source.dart';
import '../../models/profile.dart';
import '../source.dart';

class ProfileRemoteAPI extends BaseHTTPAPI {
  ProfileRemoteAPI(String rootURL) : super(rootURL, "profile");

  Future<MapSD> editProfile(String body) async {
    final result = await patch<MapSD>("me", body);
    if (result["reason"] != null) throw result["reason"];
    return result;
  }

  Future<MapSD> createProfile(String body) async {
    try {
      return await post("me", body: body);
    } catch (e, trace) {
      throw handleError(e, trace);
    }
  }

  Future<MapSD> getUserProfile() async {
    try {
      return await get("me");
    } catch (e, trace) {
      throw handleError(e, trace);
    }
  }

  Future<Profile> updateProfile(MapSD data) async {
    try {
      final body = jsonEncode(data);
      final result = await patch<MapSD>("me", body);
      if (result["reason"] != null) throw result["reason"];

      final profile = Profile.fromMap(result);
      return profile;
    } catch (e, trace) {
      throw handleError(e, trace);
    }
  }

  Future<void> markEmailAsVerified(String fbToken) async {
    try {
      final body = jsonEncode({"token": fbToken});
      codehandler(int code) {
        if (code == 400) throw "email-taken";
      }

      await post(
        "verify-email",
        body: body,
        checkBody: false,
        statusCodeHandler: codehandler,
      );
    } catch (e, trace) {
      if (e == "email-taken") {
        const msg = Message(
          enMessage: "We have an account linked with this email",
          swMessage: "Tuna akaunti tayari iliyounganishwa na hii barua pepe",
        );
        throw msg;
      }

      throw handleError(e, trace);
    }
  }

  Future<({bool success, bool hasNotSetProfile})> sendOTP(
    PhoneNumber phoneNumber,
  ) async {
    void codeHandler(int code) {
      if (code == 400) throw "no-profile";
      if (!code.success) throw "An error happened while sending OTP";
    }

    final body = jsonEncode({
      "msisdn": phoneNumber.getNumberWithFormat(MobileNumberFormat.s255),
    });

    try {
      await post(
        "send-otp",
        body: body,
        checkBody: false,
        statusCodeHandler: codeHandler,
      );
      return (success: true, hasNotSetProfile: false);
    } catch (e) {
      if (e == "no-profile") return (success: false, hasNotSetProfile: true);

      return (success: false, hasNotSetProfile: false);
    }
  }

  Future<({bool success, bool hasNotSetProfile})> verifyPhone(
      String otp) async {
    final body = jsonEncode({"token": otp});
    void codeHandler(int code) {
      if (code == 400) throw "no-profile";
      if (!code.success) throw "An error happened while verifying OTP";
    }

    try {
      await post(
        "verify-phone",
        body: body,
        statusCodeHandler: codeHandler,
        checkBody: false,
      );

      return (success: true, hasNotSetProfile: false);
    } catch (e) {
      if (e == "no-profile") {
        return (success: false, hasNotSetProfile: true);
      }
      return (success: false, hasNotSetProfile: false);
    }
  }
}

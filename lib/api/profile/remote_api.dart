import 'dart:convert';

import '../../constants/typedefs.dart';
import '../../exceptions/source.dart';
import '../source.dart';

typedef OTPResult = ({bool success, bool hasNotSetProfile});

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

  Future<MapSD> updateProfile(MapSD data) async {
    try {
      final body = jsonEncode(data);
      final result = await patch<MapSD>("me", body);
      if (result["reason"] != null) throw result["reason"];

      return result;
    } catch (e, trace) {
      throw handleError(e, trace);
    }
  }

  Future<void> markEmailVerified(String fbToken) async {
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
}

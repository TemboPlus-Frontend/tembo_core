import 'dart:convert';

import '../utils/phone_utils/phone_number.dart';

class Profile {
  final String id;
  final bool? isKycCompleted;
  final bool? isEmailVerified;
  final bool? isPhoneVerified;
  final String? firstName;
  final String? lastName;
  final String? displayName;
  final PhoneNumber? phone;
  final String? email;
  final String? nin;
  final String? onboardId;
  final String? accountNo;
  final DateTime? cardExpiryDate;
  final DateTime? cardIssueDate;

  String get name {
    if (displayName != null && displayName!.trim().isNotEmpty) {
      return displayName!.trim();
    }
    if (firstName == null && lastName == null) {
      return "";
    }
    return "$firstName $lastName".trim();
  }

  bool get hasVerifiedNIDA {
    return isKycCompleted ?? false;
  }

  bool get hasCompletedKYC {
    return isKycCompleted ?? false;
  }

  bool get hasVerifiedPhone {
    return isPhoneVerified ?? false;
  }

  bool get hasVerifiedEmail {
    return isEmailVerified ?? false;
  }

  bool get hasEmail {
    return (email ?? "").trim().isNotEmpty;
  }

  String get businessName => "$firstName $lastName";

  const Profile({
    required this.id,
    this.firstName,
    this.lastName,
    this.displayName,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.phone,
    this.accountNo,
    this.email,
    this.nin,
    this.onboardId,
    this.isKycCompleted = false,
    this.cardExpiryDate,
    this.cardIssueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone?.compactNumber,
      'accountNo': accountNo,
      'email': email,
      'isKycCompleted': isKycCompleted,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'nin': nin,
      'onboardId': onboardId,
      'cardExpiryDate': cardExpiryDate?.toIso8601String(),
      'cardIssueDate': cardIssueDate?.toIso8601String(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      phone: map['phone'] != null ? PhoneNumber.from(map['phone']) : null,
      accountNo: map['accountNo'] as String?,
      nin: map['nin'] as String?,
      email: map["email"] as String?,
      onboardId: map['onboardId'] as String?,
      isKycCompleted: map['isKycCompleted'] as bool?,
      isEmailVerified: map['isEmailVerified'] as bool?,
      isPhoneVerified: map['isPhoneVerified'] as bool?,
      cardExpiryDate: map['cardExpiryDate'] != null
          ? DateTime.parse(map['cardExpiryDate'])
          : null,
      cardIssueDate: map['cardIssueDate'] != null
          ? DateTime.parse(map['cardIssueDate'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, isKycCompleted: $isKycCompleted, firstName: $firstName, lastName: $lastName, displayName: $displayName, phone: $phone, email: $email, accountNo: $accountNo, isEmailVerified: $isEmailVerified, isPhoneVerified: $isPhoneVerified, nin: $nin, onboardId: $onboardId)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.email == email &&
        other.nin == nin &&
        other.onboardId == onboardId &&
        other.isKycCompleted == isKycCompleted &&
        other.accountNo == accountNo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        isKycCompleted.hashCode ^
        nin.hashCode ^
        onboardId.hashCode ^
        accountNo.hashCode;
  }
}

extension NullableProfileExt on Profile? {
  bool get hasVerifiedNIDA => this?.hasVerifiedNIDA ?? false;

  bool get hasCompletedKYC => this?.hasCompletedKYC ?? false;

  bool get hasAccountNo {
    final e = this?.accountNo?.trim().isNotEmpty ?? false;
    return e;
  }

  bool get hasVerifiedEmail {
    return this?.isEmailVerified ?? false;
  }

  bool get hasEmail {
    final email = this?.email ?? "";
    return email.trim().isNotEmpty;
  }

  bool get hasVerifiedPhone {
    return this?.isPhoneVerified ?? false;
  }
}

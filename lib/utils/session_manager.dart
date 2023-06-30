

import 'session_manager_methods.dart';

class SessionManager {
  /*
  "user_id": "18",
  "name": "Jay Mistry",
  "email": "jay.m@coronation.in",
  "phone": "7433036724",
  "dob": "04 Jun 2018",
  "referral_code": "YQB427",
  "has_login_pin": true,
  "image": "https://apis.roboadviso.com/assets/uploads/profiles/profile_1626788768_98.jpg"
*/
  final String isLoggedIn = "isLoggedIn";
  final String userId = "user_id";
  final String firstName = "first_name";
  final String lastName = "last_name";
  final String email = "email";
  final String mobileNumber = "mobileNumber";
  final String dateOfBirth = "dateOfBirth";
  final String employeeCode = "employeeCode";
  final String accountNumber = "accountNumber";
  final String employeeNumber = "employeeNumber";
  final String deviceToken = "deviceToken";
  final String profile_pic = "profile_pic";
  final String draft = "draft";
  final String isHint = "isHint";
  final String isHintForUniaabhar = "isHintForUniaabhar";



  bool? checkIsLoggedIn() {
    return SessionManagerMethods.getBool(isLoggedIn);
  }

  //set data into shared preferences...
  Future createLoginSession(String apiUserId,String apiFirstName ,String apiLastName,String apiEmail,String apiMobileNumber,
      String apidateOfBirth, String apiemployeeCode, String apiaccountNumber, String apiemployeeNumber, String apiprofile_pic) async {
    await SessionManagerMethods.setBool(isLoggedIn, true);
    await SessionManagerMethods.setString(userId,apiUserId);
    await SessionManagerMethods.setString(firstName,apiFirstName);
    await SessionManagerMethods.setString(lastName,apiLastName);
    await SessionManagerMethods.setString(email,apiEmail);
    await SessionManagerMethods.setString(mobileNumber, apiMobileNumber);
    await SessionManagerMethods.setString(dateOfBirth, apidateOfBirth);
    await SessionManagerMethods.setString(employeeCode, apiemployeeCode);
    await SessionManagerMethods.setString(accountNumber, apiaccountNumber);
    await SessionManagerMethods.setString(employeeNumber, apiemployeeNumber);
    await SessionManagerMethods.setString(profile_pic, apiprofile_pic);

  }

  String? getUserId() {
    return SessionManagerMethods.getString(userId);
  }

  Future<void> setName(String apiFirstName)
  async {
    await SessionManagerMethods.setString(firstName, apiFirstName);
  }

  String? getName() {
    return SessionManagerMethods.getString(firstName);
  }


  String? getLastName() {
    return SessionManagerMethods.getString(lastName);
  }

  Future<void> setEmail(String apiEmail)
  async {
    await SessionManagerMethods.setString(email, apiEmail);
  }

  String? getEmail() {
    return SessionManagerMethods.getString(email);
  }

  Future<void> setPhone(String apiMobileNumber)
  async {
    await SessionManagerMethods.setString(mobileNumber, apiMobileNumber);
  }

  String? getPhone() {
    return SessionManagerMethods.getString(mobileNumber);
  }


  Future<void> setDeviceToken(String apiDeviceToken)
  async {
    await SessionManagerMethods.setString(deviceToken, apiDeviceToken);
  }

  String? getDeviceToken() {
    return SessionManagerMethods.getString(deviceToken);
  }

  Future<void> setImage(String apiImage)
  async {
    await SessionManagerMethods.setString(profile_pic, apiImage);
  }

  String? getImagePic() {
    return SessionManagerMethods.getString(profile_pic);
  }

  String? getEmployeeCode() {
    return SessionManagerMethods.getString(employeeCode);
  }

  Future<void> setEmployeeCode(String apiemployeeCode)
  async {
    await SessionManagerMethods.setString(employeeCode, apiemployeeCode);
  }

  String? getDraft(){
    return SessionManagerMethods.getString(draft);
  }

  Future<void> setDraft(String apiRecentSearch)
  async {
    await SessionManagerMethods.setString(draft, apiRecentSearch);
  }

  Future<void> setIsHint(bool apiIsHint)
  async {
    await SessionManagerMethods.setBool(isHint, apiIsHint);
  }

  bool? checkIsHint() {
    return SessionManagerMethods.getBool(isHint);
  }


  Future<void> setIsHintForUniaabhar(bool apiIsHint)
  async {
    await SessionManagerMethods.setBool(isHintForUniaabhar, apiIsHint);
  }

  bool? checkIsHintForUniaabhar() {
    return SessionManagerMethods.getBool(isHintForUniaabhar);
  }
}
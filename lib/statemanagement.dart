import 'package:get/get.dart';

class StateManage extends GetxController{
  var showPass = true.obs;
  void showPassFunc(){
    showPass.value = !showPass.value;
  }

  var showRePass = true.obs;
  void showRePassFunc(){
    showRePass.value = !showRePass.value;
  }

  var passAuth = true.obs;
  void passwordValid(String password){
    RegExp passRegExp = RegExp(    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$',);
    passAuth.value = passRegExp.hasMatch(password);
  }

  var emailAuth = true.obs;
  void emailValid(String email){
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    emailAuth.value =  emailRegExp.hasMatch(email);
  }

}
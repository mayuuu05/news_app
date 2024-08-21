import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() async {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      isLoading.value = false;
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        'Error',
        'Please enter a username and password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void guestLogin() {
    Get.snackbar('Guest Mode', 'Logged in as a guest', snackPosition: SnackPosition.BOTTOM,);

    Get.offAllNamed('/home');
  }

  void forgotPassword() {
    Get.snackbar('Forgot Password', 'Password reset link sent');
  }
}

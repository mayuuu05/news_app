import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: [
                Color(0xff32343b),
                Color(0xff1c1e22),
              ],
            ),
          ),
        ),
        title: Text(
          'MODERN NEWS',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w200,
            letterSpacing: 3,
            wordSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Screenshot_2024-08-13_193713-removebg-preview.png',
                    height: screenHeight * 0.2,
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  TextField(
                    onChanged: (value) =>
                    loginController.username.value = value,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  Obx(() => TextField(
                    obscureText: !loginController.isPasswordVisible.value,
                    onChanged: (value) =>
                    loginController.password.value = value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginController.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: loginController.togglePasswordVisibility,
                      ),
                    ),
                  )),

                  SizedBox(height: screenHeight * 0.015),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => loginController.forgotPassword(),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  Obx(() => ElevatedButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : () => loginController.login(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1,
                          colors: [
                            Color(0xff32343b),
                            Color(0xff1c1e22),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: screenHeight * 0.07,
                        width: screenWidth*0.7,
                        alignment: Alignment.center,
                        child: loginController.isLoading.value
                            ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  )),


                  SizedBox(height: screenHeight * 0.03),
                  TextButton(
                    onPressed: () => loginController.guestLogin(),
                    child: Text(
                      'Try as guest',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

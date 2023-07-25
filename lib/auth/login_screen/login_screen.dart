import 'package:api_demo/auth/login_screen/login_controller.dart';
import 'package:api_demo/utils/common_button.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ScreenBackGround(),
          SingleChildScrollView(
            child: Form(
              key: loginController.loginKey,
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    "Wel come",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 170),
                  GlassContainer(
                    blur: 1,
                    height: Get.height * 0.65,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    color: Colors.transparent,
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                    shadowColor: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: loginController.emailController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.7),
                            hintText: "email",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: loginController.passwordController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent.withOpacity(0.7),
                            hintText: "password",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0XFF11DCE8),
                            ),
                          ),
                        ),
                        loginController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : CommonButton(
                                text: "Sign in",
                                onTap: () {
                                  loginController.userLogin();
                                },
                                width: double.infinity,
                              ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 1,
                              width: Get.width * 0.27,
                              color: const Color(0XFF8D8E99),
                            ),
                            const Text(
                              "or sign in using",
                              style: TextStyle(color: Color(0XFF8D8E99)),
                            ),
                            Container(
                              height: 1,
                              margin: const EdgeInsets.only(left: 5),
                              width: Get.width * 0.27,
                              color: const Color(0XFF8D8E99),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                "assets/icons/facebook_icon.png",
                                height: 30,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                "assets/icons/facebook_icon.png",
                                height: 30,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                "assets/icons/google_icon.png",
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don`t have an account?",
                              style: TextStyle(
                                color: Color(0XFF8D8E99),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Color(0XFF11DCE8),
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

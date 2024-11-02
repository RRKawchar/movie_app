import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/assets_path.dart';
import 'package:movie_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:movie_app_demo/src/features/home/view/page/home_page.dart';

class AuthExample extends StatelessWidget {
  const AuthExample({super.key});


  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to MovieApp',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Log in to save your watchlist and favorite movies!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Image.asset(AssetsPath.movieIllustrations),

              // Login Button
              _buildLoginButton(authController),
              SizedBox(height: 16),
              // Skip Button
              TextButton(
                onPressed: () {
                  Get.offAll(() => HomePage());
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(AuthController authController){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:authController.handleLogin,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

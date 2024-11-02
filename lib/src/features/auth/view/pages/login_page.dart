import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/widgets/k_button.dart';
import 'package:movie_app_demo/src/core/widgets/k_text_field.dart';
import 'package:movie_app_demo/src/features/auth/view/widgets/cinema_logo_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isShowPass=true.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Sign In",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CinemaLogoWidget(),
              const SizedBox(height: 40),
              const KTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              Obx(() => KTextField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obSecureText:isShowPass.value,
                suffixIcon: IconButton(
                  onPressed: (){
                    isShowPass.value=!isShowPass.value;
                  },
                  icon:  Icon(isShowPass.value?Icons.visibility_off:Icons.visibility,size: 30,),
                ),
              ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.registerPage);
                    },
                    child: const Text(
                      "Register",
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              KButton(
                onTap: () {},
                child: Text(
                   "Login",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //text: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}

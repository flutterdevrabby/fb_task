import 'package:fb_journal_app/common_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/custom_text_field_widget.dart';
import '../../../const/assets_path.dart';
import '../../../providers/sign_in_provider.dart';
import '../../../routes/routes.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                CustomTextFormField(
                  hintText: "Email",
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is required";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10.h),

                Consumer<SignInProvider>(
                  builder: (context, provider, child) {
                    return CustomTextFormField(
                      obscureText: !provider.passwordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: "Password",
                      controller: _passwordController,

                      suffixIcon: IconButton(
                        onPressed: provider.togglePasswordVisibility,
                        icon: Image.asset(
                          provider.passwordVisible
                              ? AssetsIcon.eyeOnIcon
                              : AssetsIcon.eyeOffIcon,

                          width: 24.w,
                          height: 24.h,
                          color: Color(0xFF82797A),

                          fit: BoxFit.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    );
                  },
                ),

                SizedBox(height: 20.h),

                CustomButton(
                  buttonName: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.push(AppRoutes.journalHomeScreen);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

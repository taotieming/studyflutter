import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/config/app_routes.dart';
import 'package:study_flutter/config/app_string.dart';
import 'package:study_flutter/provider/app_repo.dart';
import 'package:study_flutter/provider/login_page_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Hello welcome back!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                TextField(
                  // controller: usernameController,
                  onChanged: (value) {
                    context.read<LoginProvider>().username = value;
                  },
                  decoration: InputDecoration(
                      hintText: "username",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5)),
                ),
                Spacer(),
                TextField(
                  // controller: passwordController,
                  onChanged: (value) {
                    context.read<LoginProvider>().password = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("click forget password");
                    },
                    child: Text("Forgot password?"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      //先获取到token
                      await context.read<LoginProvider>().login().then((value) {
                        print("先获取到token");
                        context.read<LoginProvider>().usertoken = value.token;
                        context.read<AppRepo>().token = value.token;
                        
                      });

                      await context
                          .read<LoginProvider>()
                          .getuserinfo()
                          .then((value) {
                        context.read<AppRepo>().user = value.user;
                        print("在获取到用户信息");
                      });
                      print("再跳转");
                      Navigator.of(context).pushReplacementNamed(AppRoute.main);
                    },
                    child: Text("Log in"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black),
                  ),
                ),
                Spacer(),
                const Text(
                  "or sign in with",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 22,
                            width: 22,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          const Text("Login with Google")
                        ],
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/facebook.png",
                            height: 22,
                            width: 22,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text("Login with Facebook")
                        ],
                      )),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have account ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.amber),
                        ))
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

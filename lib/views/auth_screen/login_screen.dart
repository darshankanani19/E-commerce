// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:ffi';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/views/auth_screen/signup_screen.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:ecommerce/widgets_common/applogo_widget.dart';
import 'package:ecommerce/widgets_common/bg_widget.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';
import 'package:ecommerce/widgets_common/our_button.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller= Get.put(AuthController());
    TextEditingController emailController= TextEditingController();
    TextEditingController passwordController= TextEditingController();
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false
      ,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
applogoWidget(),
            10.heightBox,
            "Log in to $appname ".text.fontFamily(bold).size(18).white.make(),
            15.heightBox,

            Obx(
                ()=> Column(
                children: [
                  customTextField(title: email,hint: emailHint,isPass: false,controller: controller.emailController),
                  customTextField(title: password,hint: passwordHint,isPass: true,controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetpass.text.make())),
                  5.heightBox,
                 controller.isloading.value ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),) :ourButton(color: redColor,title: login,textColor: whiteColor,onPress: () async {

                      controller.isloading(true);
                      await controller.loginMethod(context: context).then((value){
                        if(value!=null){
                          VxToast.show(context, msg: loggedIn);
                          Get.offAll(()=>Home());
                        }else{
                          controller.isloading(false);

                        }

                      });

                  }).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  creatNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(color:  lightGolden,title: signup,textColor: redColor,onPress: (){
                    Get.to(()=>SignupScreen());
                  }).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index)=>Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,

                        backgroundColor: lightGrey,
                        child: Image.asset(socialIconList[index],width: 30,),
                      ),
                    )),
                  ),

                ],

              ).box.rounded.white.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
            ),
          ],
        ),
      ),
    ));
  }
}

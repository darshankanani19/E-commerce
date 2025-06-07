// import 'package:flutter/material.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:get/get.dart';
import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/widgets_common/applogo_widget.dart';
import 'package:ecommerce/widgets_common/bg_widget.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';
import 'package:ecommerce/widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck=false;
  var controller = Get.put(AuthController());

  // text controller

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false
      ,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname ".text.fontFamily(bold).size(18).white.make(),
            15.heightBox,

            Obx(
                ()=> Column(
                  children: [
                    customTextField(title: name,hint: nameHint,controller: nameController,isPass: false),
                    customTextField(title: email,hint: emailHint,controller: emailController,isPass: false),
                    customTextField(title: password,hint: passwordHint,controller: passwordController,isPass: true),
                    customTextField(title: retypePassword,hint: passwordHint,controller: passwordRetypeController,isPass: true),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: forgetpass.text.make())),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: whiteColor,
                            activeColor: redColor,

                            value: isCheck,
                            onChanged: (newValue){
                              setState(() {
                                isCheck =newValue;

                              });
                            }),
                        10.widthBox,

                        Expanded(
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "i agree to the ",style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )
                                ),
                                TextSpan(text: termAndCond,style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )
                                ),
                                TextSpan(text: " & ",style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )
                                ),
                                TextSpan(text: privacyPolicy,style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )
                                ),
                              ]
                          )),
                        ),
                      ],
                    ),
                    5.heightBox,
                   controller.isloading.value? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),) : ourButton(color: isCheck==true? redColor : lightGrey,title: signup,textColor: whiteColor,onPress: ()async{
                      if(isCheck!=false){
                        controller.isloading(true);
                        try{
                          await controller
                              .signupMethod(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          )
                              .then((value) => controller
                              .storeUserData(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          )
                              .then((value) {
                            VxToast.show(context, msg: loggedIn);

                            Get.offAll(Home());
                          }));
                        }catch(e){
                          controller.signOutMethod();
                          VxToast.show(context, msg: e.toString());
                          controller.isloading(false);
                        }
                      }
                    }).box.width(context.screenWidth-50).make(),

                    10.heightBox,
                    RichText(text: TextSpan(
                        children:[
                          TextSpan(text: alreadyHaveAccount,
                              style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey
                              )
                          ),
                          TextSpan(text: login,
                              style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor
                              )
                          ),
                        ]
                    )).onTap((){
                      Get.back();
                    }),
                  ],

                ).box.rounded.white.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),

            ),
            ],
        ),
      ),
    ));
  }
}

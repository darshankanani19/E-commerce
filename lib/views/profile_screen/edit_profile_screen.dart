import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/widgets_common/bg_widget.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';
import 'package:ecommerce/widgets_common/our_button.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(),
      body:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
      10.heightBox,
          ourButton(title: "Change",onPress: (){},color: redColor,textColor: whiteColor),
          Divider(),
          20.heightBox,
          customTextField(
            title: name,
            hint: nameHint,
            isPass: false,

          ),
          10.heightBox,
          customTextField(
            title: password,
            hint: passwordHint,
            isPass: true ,

          ),
          10.heightBox,

          SizedBox(
              width: context.screenWidth-60,
              child: ourButton(title: "save",textColor: whiteColor,color: redColor,onPress: (){})),
        ],
      ).box.padding(EdgeInsets.all(16)).shadowSm.margin(EdgeInsets.only(top: 50,left: 12,right: 12)).rounded.white.make(),
    ));
  }
}

import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/views/auth_screen/login_screen.dart';
import 'package:ecommerce/views/profile_screen/edit_profile_screen.dart';
import 'package:ecommerce/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import 'components/details_card.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(Scaffold(body: SafeArea(child: Container(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          // edit button session
          Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.edit,color: whiteColor,).onTap(()=>Get.to(EditProfileScreen()))),
          // profile details session
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                10.widthBox,
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  "Dummy user".text.fontFamily(semibold).white.make(),
                  5.heightBox,
                  "james.buchanan@examplepetstore.com".text.white.make(),

                ],),),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: whiteColor
                    )
                  ),
                  onPressed: () async {
                    try{
                      await controller.signOutMethod();
                      VxToast.show(context, msg: loggedOut);
                      Get.offAll(()=>LoginScreen());

                    }catch(e){
                      VxToast.show(context, msg: e.toString());
                    }
                  }, child: logout.text.fontFamily(semibold).white.make(),),


              ],
            ),
          ),

          20.heightBox,

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(width: context.screenWidth/3.4,count: "00",title: "In your cart"),
                detailsCard(width: context.screenWidth/3.4,count: "35",title: "In your wishlist"),
                detailsCard(width: context.screenWidth/3.4,count: "4562",title: "Your orders"),
              ],
            ),
          ),
        //   button session
          ListView.separated(
            shrinkWrap: true,
              separatorBuilder: (context, index) {return Divider(color: lightGrey,);},
              itemCount:  profileButtonsList.length,itemBuilder: (BuildContext context,index){
              return ListTile(
                leading: Image.asset(profileButtonIcons[index],width: 22,),
                title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
              );
          }).box.shadowSm.padding(EdgeInsets.all(16)).rounded.white.margin(EdgeInsets.all(18)).make().box.color(redColor).make(),
        ],
      ),),
      )
      ,));
  }
}

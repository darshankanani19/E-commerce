import "package:ecommerce/consts/consts.dart";
Widget featureButton({String?title,icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.color(darkFontGrey).fontFamily(semibold).make()
    ],
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).white.roundedSM.outerShadowSm.padding(EdgeInsets.all(4)).make();
}
import 'package:get/get.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/views/home_screen/Components/features_button.dart';
import 'package:ecommerce/widgets_common/home_buttons.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      padding: EdgeInsets.all(12),
      child: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnything,
                hintStyle: TextStyle(color: textfieldGray)
              ),
            ),
          ),
10.heightBox,
Expanded(
  child: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        //   swiper brands
  
        VxSwiper.builder(
          aspectRatio: 16/9,
          height: 150,
          autoPlay: true,
          enlargeCenterPage: true,
          itemCount: slidersList.length,itemBuilder: (context,index){
          return Image.asset(slidersList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
        },),
        10.heightBox,
        //   deal button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(2, (index)=>HomeButton(
            height: context.screenHeight*0.15,
            width: context.screenWidth/2.5,
            icon: index==0?icTodaysDeal:icFlashDeal,
            title: index==0?todayDeal:flashSale,
          )),
        ),
        10.heightBox,
        // second swiper
        VxSwiper.builder(
          aspectRatio: 16/9,
          height: 150,
          autoPlay: true,
          enlargeCenterPage: true,
          itemCount: secondSlidersList.length,itemBuilder: (context,index){
          return Image.asset(secondSlidersList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
        },),
  
        //   category buttons
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index)=>HomeButton(
            height: context.screenHeight*0.15,
            width: context.screenWidth/3.5,
            icon: index==0?icTopCategories:index==1?icBrands:icTopSeller,
            title: index==0?topCategories:index==1?brand:topSeller,
          )),
        ),
        //   featured categories
        20.heightBox,
        Align(
            alignment: Alignment.centerLeft,
            child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
      20.heightBox,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: List.generate(3, (index)=>Column(
              children: [
                featureButton(title: featuredTitle1[index],icon: featuredImages1[index]),
                10.heightBox,

                featureButton(title: featuredTitle2[index],icon: featuredImages2[index]),
              ],

            )).toList(),
          ),
        ),

      //   Featured Product

        20.heightBox,
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: redColor
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              featuredProduct.text.fontFamily(semibold).white.size(18).make(),
              10.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(6, (index)=>Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                    10.heightBox,
                    "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    "\$600".text.fontFamily(bold).color(redColor).size(16).make(),
                  ],
                  ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(8)).roundedSM.make()).toList(),
                ),
              ),
            ],
          ),
        ),


      // third swiper

        20.heightBox,
        VxSwiper.builder(
          aspectRatio: 16/9,
          height: 150,
          autoPlay: true,
          enlargeCenterPage: true,
          itemCount: secondSlidersList.length,itemBuilder: (context,index){
          return Image.asset(secondSlidersList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
        },),

        20.heightBox,
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300), itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imgP1,width: 200,height: 200,fit: BoxFit.cover,),
              Spacer(),
              "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
              10.heightBox,
              "\$600".text.fontFamily(bold).color(redColor).size(16).make(),
            ],
          ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(12)).roundedSM.make();
        })

      ],
    ),
  ),
),
        ],
      )),
    );
  }
}

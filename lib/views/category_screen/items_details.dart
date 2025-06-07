import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/widgets_common/our_button.dart';
class ItemsDetails extends StatelessWidget {
 final String? title;
  const ItemsDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_rounded,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(padding: EdgeInsets.all(8),child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(itemCount: 3,
                    height: 350,
                    aspectRatio: 16/9,
                    autoPlay: true,
                    itemBuilder: (context,index){return Image.asset(imgFc1,width: double.infinity,fit: BoxFit.cover,  );}),
                10.heightBox,
                // title
                title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                // rating
                10.heightBox,
                VxRating(onRatingUpdate: (String value) {  },normalColor: textfieldGray,selectionColor: golden,size: 25,stepInt: true,count: 5,),
                10.heightBox,
                "\$30,000".text.color(redColor).fontFamily(bold).size(18).make(),
                10.heightBox,
                Row(
                  children: [
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.fontFamily(semibold).white.make(),
                        10.heightBox,
                        "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                      ],
                    )),
                    CircleAvatar(backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded,color: darkFontGrey,),
                    ),
                  ],
                ).box.color(textfieldGray).height(60).padding(EdgeInsets.symmetric(horizontal: 16)).make(),
20.heightBox,
                // color selection
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 100,
                        child: "Color: ".text.color(textfieldGray).make(),),
                        Row(
                          children:List.generate(3, (index)=>VxBox().size(40,40).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 4)).make()),
                        )
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                    // quantity row
                    Row(
                      children: [
                        SizedBox(width: 100,
                          child: "Quantity: ".text.color(textfieldGray).make(),),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                            "0".text.size(16).fontFamily(bold).color(darkFontGrey).make(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGray).make(),
                            
                          ],
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                  // total row
                    Row(
                      children: [
                        SizedBox(width: 100,
                          child: "Total: ".text.color(textfieldGray).make(),),
                        "\$0.00".text.size(16).fontFamily(bold).color(redColor).make(),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                      ],

                ).box.shadowSm.white.make(),
                // description

                10.heightBox,
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                "This is dummy item and dummy description".text.color(darkFontGrey).make(),
                10.heightBox,

              //   button list
                
                ListView(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  children: List.generate(itemDetailButtonsList.length, (index){return ListTile(
                    title: itemDetailButtonsList[index].text.make(),
                    trailing: Icon(Icons.arrow_forward),
                  );}),
                ),
              20.heightBox,
              //   product you may also like
                productYouMayLike.text.color(darkFontGrey).fontFamily(bold).size(16).make(),
                10.heightBox,
                // copied widget from homScreen
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
          ),)),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ourButton(onPress: (){},title: "Add to cart",color: redColor,textColor: whiteColor),
          ),


        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/views/category_screen/items_details.dart';
import 'package:ecommerce/widgets_common/bg_widget.dart';
class CategoriesDetails extends StatelessWidget {

  final String? title;
  const CategoriesDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),

      body:Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index)=>"Baby Clothing".text.color(darkFontGrey).fontFamily(semibold).size(12).makeCentered().box.roundedSM.size(120, 60).margin(EdgeInsets.symmetric(horizontal: 4)).white.make()),
              ),
            ),

          20.heightBox,
          //   items Container
            Expanded(child: Container(
              color: lightGrey,
              child: GridView.builder(physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250), itemBuilder: (context,index){
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imgP1,width: 200,height: 150,fit: BoxFit.cover,),
                    // Spacer(),
                    "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    "\$600".text.fontFamily(bold).color(redColor).size(16).make(),
                  ],
                ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).outerShadowSm .padding(EdgeInsets.all(12)).roundedSM.make().onTap((){
                  Get.to(()=>ItemsDetails(title: "Dummy Item"));
                    });
                ;
              }),
            )),
          ],
        ),
      ),
    ));
  }
}

import 'package:get/get.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/views/category_screen/categories_details.dart';

import '../../widgets_common/bg_widget.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: categories.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 8,mainAxisExtent: 200,mainAxisSpacing: 8), itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset(categoriesImages[index],width: 200,height: 120,fit: BoxFit.cover,),
              10.heightBox,
              categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
            ],
          ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap((){
            Get.to(CategoriesDetails(title: categoriesList[index]));
          });
        }),
      ),
    ));
  }
}

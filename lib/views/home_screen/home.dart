import 'package:get/get.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/views/cart_screen/cart_screen.dart';
import 'package:ecommerce/views/category_screen/category_screen.dart';
import 'package:ecommerce/views/home_screen/home_screen.dart';
import 'package:ecommerce/views/profile_screen/profile_screen.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init home controller
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account),
    ];
    var navBody =[
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          selectedItemColor: redColor,
          currentIndex: controller.currentIndex.value,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type:BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
onTap: (value){
            controller.currentIndex.value =value;
},
          items: navbarItem),),

      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentIndex.value))),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isloading = false.obs;


//   login
Future<UserCredential?> loginMethod({context}) async {
UserCredential? userCredential;
try{

  await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

} on FirebaseAuthException catch(e){
  VxToast.show(context, msg: e.message!);
}
return userCredential;
}
//   Signup
Future<UserCredential?> signupMethod({email,password,context}) async {
UserCredential? userCredential;
try{

  await auth.createUserWithEmailAndPassword(email: email, password: password);

} on FirebaseAuthException catch(e){
  VxToast.show(context, msg: e.message!);
}
return userCredential;
}

// storing data

storeUserData({name,email,password}) async {
  DocumentReference store = await firestore.collection(usersCollection).doc(auth.currentUser!.uid);
  store.set({
    "name":name,
    "email":email,
    "password":password,
    "imageUrl":"",
    "id":currentUseer!.uid
  });

}


// SignOut method

signOutMethod({context}) async{
  try {
    auth.signOut();
  } catch(e){
     VxToast.show(context, msg: e.toString());
  }

}


}
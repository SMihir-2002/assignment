import 'package:assignment/modules/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FDAddUserProfile {
  final String name;
  final String email;
  final String location;
  final String contactNo;

  FDAddUserProfile(
      {required this.name,
      required this.contactNo, 
      required this.email,
      required this.location}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection("UserProfile");
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    userProfile.doc(_firebaseAuth.currentUser!.uid).set({
      "name": name,
      'email': email,
      "mobile_number": contactNo,
      'location':location,
      'created_at': Timestamp.fromDate(DateTime.now()),
      'updated_at': Timestamp.fromDate(DateTime.now()),
    }).then((value) {
      GetStorage _storage = GetStorage();
      _storage.write("isUserPresent", true);
      _storage.write("UserDetails", {
       "name": name,
      'email': email,
      "mobile_number": contactNo,
      'location':location,
      });
      Get.offAll(() => HomeScreen());
    });
  }
}

class FDFetchUserProfile {
  fDFetchUserProfile() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    DocumentReference userProfile =
        firestore.collection("UserProfile").doc(_firebaseAuth.currentUser!.uid);
    try {
      DocumentSnapshot profileDoc = await userProfile.get();

      Map userData = profileDoc.data() as Map;
      GetStorage _storage = GetStorage();

      _storage.write("isUserPresent", true);
      _storage.write("UserDetails", {
        "name": userData["name"],
        "email": userData["email"],
        'mobile_number':userData['mobile_number'],
        "location": userData["location"],
      }).then((value) => Get.offAll(() =>  HomeScreen()));
    } catch (e) {

      print(e);
    }
  }
}

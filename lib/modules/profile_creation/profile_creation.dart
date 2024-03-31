import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/firestore_database/user_profile.dart';
import 'package:assignment/modules/auth/widgets/primary_button.dart';
import 'package:assignment/modules/profile_creation/widgets/profile_text_field.dart';
import 'package:assignment/modules/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileCompletion extends StatelessWidget {
  ProfileCompletion({super.key, required this.email});
  final String email;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoConroller = TextEditingController();
  TextEditingController currentWorkingStyleController = TextEditingController();
  TextEditingController location = TextEditingController();

  RxBool isWFH = true.obs;

  @override
  Widget build(BuildContext context) {
    emailController.text = email;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Just Need Few Details:-",
                style: fTitle,
              ),
              Text(
                "Note :- \n This details cannot be modified later on",
                style: fNote,
              ),
              ProfileTextField(
                icn: Icons.person,
                controller: nameController,
                label: "Name",
                isEnabled: true,
              ),
              ProfileTextField(
                icn: Icons.assignment_ind_outlined,
                controller: emailController,
                label: "Email",
                isEnabled: false,
              ),
              ProfileTextField(
                icn: Icons.contact_phone_outlined,
                controller: phoneNoConroller,
                label: "Mobile",
                isEnabled: true,
              ),
              Row(
                children: [
                  Icon(
                    Icons.house_outlined,
                    size: 26.h,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 200,
                    child: DropdownButtonFormField(
                        style: fSubHeading3,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Working Type"),
                        items: [
                          DropdownMenuItem(
                            value: true,
                            child: Text(
                              "Work From Home",
                              style: fSubHeading3,
                            ),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text(
                              "In Office",
                              style: fSubHeading3,
                            ),
                          )
                        ],
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        borderRadius: BorderRadius.circular(14.r),
                        onChanged: (value) {
                          if (!value!) {
                            location.clear();
                          } else {
                            location.text = "Work From Home";
                          }
                          isWFH.value = value;
                        }),
                  ),
                ],
              ),
              Obx(
                () => !isWFH.value == true
                    ? ProfileTextField(
                        icn: Icons.apartment,
                        controller: location,
                        label: "Current Location",
                        isEnabled: true)
                    : Container(),
              ),
              Center(
                  child: PrimaryButton(
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          CustomSnackBar().errorSnackBar(
                              context: context,
                              content: "Please Enter your Name");
                        } else if (phoneNoConroller.text.length != 10) {
                          CustomSnackBar().errorSnackBar(
                              context: context,
                              content: "Please Input valid Contact No");
                        } else if (location.text.isEmpty) {
                          CustomSnackBar().errorSnackBar(
                              context: context,
                              content: "Please select Location");
                        } else if (emailController.text.isEmpty) {
                          CustomSnackBar().errorSnackBar(
                              context: context, content: "Please add Email");
                        } else {
                          FDAddUserProfile(
                              name: nameController.text,
                              email: emailController.text,
                              contactNo: phoneNoConroller.text,
                                  
                              location: location.text);
                        }
                      },
                      text: "            Submit            ")),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

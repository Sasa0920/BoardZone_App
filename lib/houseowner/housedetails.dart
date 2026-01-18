import 'package:boardzone_app/houseowner/owner_home.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';
import 'package:boardzone_app/services/database.dart';




class HouseDetail extends StatefulWidget{
  const HouseDetail({super.key});

  @override
  State<HouseDetail> createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail>{
  bool isChecked = false,
       isChecked2 = false,
       isChecked3 = false,
       isChecked4 = false;

      File? selectedImage;
      final ImagePicker _picker = ImagePicker();

  TextEditingController housenamecontroller = new TextEditingController();
  TextEditingController rentfeecontroller = new TextEditingController();
  TextEditingController houseaddresscontroller = new TextEditingController();
  TextEditingController additionaldetailscontroller = new TextEditingController();

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 161, 38),
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("House Details", style: AppWidget.headlinetextstyle(26.0),)
         ],
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft:Radius.circular(30), topRight: Radius.circular(30))),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  selectedImage!=null?Container(
                  height: 200,
                  width:200,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Image.file(selectedImage!,fit: BoxFit.cover,),
                  ),
                  
                ):GestureDetector(
                  onTap:(){
                  getImage();
                  },
                  child:Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(width:2.0, color: Colors.black45)),
                      child: Icon(Icons.camera_alt, color: const Color.fromARGB(255, 161, 145, 1), size: 35.0,),
                    ),
                  ),
                ),
                  SizedBox(height: 20.0),
                  Text("House Name", style: AppWidget.normaltextstyle(22.0),),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(color:Color(0xFFececf8), borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(controller: housenamecontroller, decoration: InputDecoration(border: InputBorder.none, hintText: "Enter House Name", hintStyle: AppWidget.normaltextstyle(18.0),),),
                  ),
                  SizedBox(height: 20.0),
                  Text("Monthly Rent Fee", style: AppWidget.normaltextstyle(22.0),),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(color:Color(0xFFececf8), borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(controller: rentfeecontroller, decoration: InputDecoration(border: InputBorder.none, hintText: "Enter Monthly Rent Fee", hintStyle: AppWidget.normaltextstyle(18.0),),),
                  ),
                  SizedBox(height: 20.0),
                  Text("House Address", style: AppWidget.normaltextstyle(22.0),),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(color:Color(0xFFececf8), borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(controller: houseaddresscontroller, decoration: InputDecoration(border: InputBorder.none, hintText: "Enter House Address", hintStyle: AppWidget.normaltextstyle(18.0),),),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "House Facilities",
                    style: AppWidget.headlinetextstyle(22.0),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState((){
                            isChecked = value!;
                          });
                        },
                      ),
                      Icon(
                        Icons.ac_unit,
                        color: const Color.fromARGB(255, 4, 104, 186),
                        size: 30.0,
                      ),
                      SizedBox(width: 10.0),
                      Text("Air Conditioner", style: AppWidget.normaltextstyle(18.0),)
                    ]
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState((){
                            isChecked2 = value!;
                          });
                        },
                      ),
                      Icon(
                        Icons.kitchen,
                        color: const Color.fromARGB(255, 4, 104, 186),
                        size: 30.0,
                      ),
                      SizedBox(width: 10.0),
                      Text("Kitchen", style: AppWidget.normaltextstyle(18.0),)
                    ]
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState((){
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Icon(
                        Icons.bathtub,
                        color: const Color.fromARGB(255, 4, 104, 186),
                        size: 30.0,
                      ),
                      SizedBox(width: 10.0),
                      Text("Bathroom", style: AppWidget.normaltextstyle(18.0),)
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isChecked4,
                        onChanged: (bool? value) {
                          setState((){
                            isChecked4 = value!;
                          });
                        },
                      ),
                      Icon(
                        Icons.bed,
                        color: const Color.fromARGB(255, 4, 104, 186),
                        size: 30.0,
                      ),
                      SizedBox(width: 10.0),
                      Text("Bed", style: AppWidget.normaltextstyle(18.0),)
                    ]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Additional Details",
                    style: AppWidget.headlinetextstyle(22.0),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(color:Color(0xFFececf8), borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: additionaldetailscontroller,
                      maxLines: 6,
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Enter additional details", hintStyle: AppWidget.normaltextstyle(18.0),),),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () async {
                     
                      if (housenamecontroller.text.isEmpty ||
                          rentfeecontroller.text.isEmpty ||
                          houseaddresscontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill all required fields")),
                        );
                        return;
                      }

                      
                      String addId = randomAlphaNumeric(10);
                      String downloadUrl = ""; // Default if no image selected

                      
                      if (selectedImage != null) {
                        try {
                          Reference firebaseStorageRef =
                              FirebaseStorage.instance.ref().child("houseImages").child(addId);

                          UploadTask task = firebaseStorageRef.putFile(selectedImage!);
                          TaskSnapshot snapshot = await task.whenComplete(() {});
                          downloadUrl = await snapshot.ref.getDownloadURL();
                        } catch (e) {
                          print("Error uploading image: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Failed to upload image, continuing without it")),
                          );
                        }
                      }

                      
                      Map<String, dynamic> addBoarding = {
                        "Image": downloadUrl, // empty string if no image
                        "HouseName": housenamecontroller.text.trim(),
                        "HouseAddress": houseaddresscontroller.text.trim(),
                        "RentFee": rentfeecontroller.text.trim(),
                        "AdditionalDetails": additionaldetailscontroller.text.trim(),
                        "AC": isChecked,
                        "Kitchen": isChecked2,
                        "Bathroom": isChecked3,
                        "Bed": isChecked4,
                        "Id": addId,
                      };

                      
                      try {
                        await DatabaseMethods().addBoarding(addBoarding, addId);

                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Boarding Added Successfully")),
                        );

                        
                        if (mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const OwnerHome()),
                          );
                        }
                      } catch (e) {
                        print("Error adding boarding: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Failed to add boarding")),
                        );
                      }
                    },


                  
                  child:Center(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Center(child: Text("Submit", textAlign: TextAlign.center, style: AppWidget.headlinetextstyle(26.0).copyWith(color: Colors.white),)),
                    ),
                  ),
                  ),
                  SizedBox(height: 30.0),
                ],
              
              ),
            ),
          ),
        ),
       ],
      ),),
    );
  }
}

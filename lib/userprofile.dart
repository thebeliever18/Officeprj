import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_prj/homePage.dart';
import 'dart:async';
import 'dart:io';
import 'main.dart';

class Userprofile extends StatelessWidget {
  @override
  // String name;

  // Userprofile(this.name);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  //String name;
  UserProfile();
  @override
  State createState() => new UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  // String name;
  // UserProfileState();
  File _image;
  final myController = TextEditingController();
  List<String> item = List();
  String temp;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              /**
             * Navigating back to homepage after pressing back arrow button
             */
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Nextpage(LoginPageState.accessToken);
                }),
              );
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue[900],
        title: Text("My Profile"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.list),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //padding: EdgeInsets.all(40),
              Stack(
                children: <Widget>[
                  userimg(),
                  // sizeheight(200),
                  Positioned(
                      top: 10,
                      right: 90,
                      child: Container(
                        //margin: EdgeInsets.only(top: 60, left: 200, right: 100),
                        child: FloatingActionButton(
                          onPressed: getImage,
                          tooltip: 'Pick Image',
                          child: Icon(Icons.add_a_photo),
                        ),
                      ))
                  // ),
                  // )

                  // Container(
                  //   margin: EdgeInsets.only(top: 10, left: 50),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Text(LoginPageState.customerName),
                  //       //sizeheight(10),
                  //       //Text('Address: Bouddha, kathmandu'),
                  //       //sizeheight(10),
                  //       //Text('Phone: 9860401034'),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 450),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       // Container(
                  //       //   height: 100,
                  //       //   width: 100,
                  //       //   decoration: BoxDecoration(
                  //       //       borderRadius: BorderRadius.circular(10.0),
                  //       //       color: Colors.blue),
                  //       //   // child: Column(
                  //       //   //   mainAxisAlignment: MainAxisAlignment.center,
                  //       //   //   children: <Widget>[
                  //       //   // IconButton(
                  //       //   //   icon: Icon(Icons.edit),
                  //       //   //   iconSize: 40,
                  //       //   //   onPressed: (){}
                  //       //   // ),
                  //       //   // Text('Edit'),
                  //       //   //   ],

                  //       //   // )
                  //       // ),
                  //       sizewidth(10),
                  //       // Container(
                  //       //     height: 100,
                  //       //     width: 100,
                  //       //     decoration: BoxDecoration(
                  //       //         borderRadius: BorderRadius.circular(10.0),
                  //       //         color: Colors.blue),
                  //       //     child: Column(
                  //       //       mainAxisAlignment: MainAxisAlignment.center,
                  //       //       children: <Widget>[
                  //       //         IconButton(
                  //       //             icon: Icon(Icons.update),
                  //       //             iconSize: 40,
                  //       //             onPressed: () {}),
                  //       //         Text('Update'),
                  //       //       ],
                  //       //     )
                  //       //     ),
                  //       sizewidth(10),
                  //       // Container(
                  //       //     height: 100,
                  //       //     width: 100,
                  //       //     decoration: BoxDecoration(
                  //       //         borderRadius: BorderRadius.circular(10.0),
                  //       //         color: Colors.blue),
                  //       //     child: Column(
                  //       //       mainAxisAlignment: MainAxisAlignment.center,
                  //       //       children: <Widget>[
                  //       //         IconButton(
                  //       //             icon: Icon(Icons.help),
                  //       //             iconSize: 40,
                  //       //             onPressed: () {}),
                  //       //         Text('Help'),
                  //       //       ],
                  //       //     ))
                  //     ],
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Name: ${LoginPageState.customerName}"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  onChanged: (str) {
                    temp = str;
                  },
                  maxLength: 50,
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'Add your address...',
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          item.add(temp);
                        });
                      },
                    ),
                  ),
                ),
              ),
              Text('Your Stored Addresses:'),

              Container(
                height: 100,
                width: 300,
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: Center(
                  child: Card(
                    child: ListView(
                      shrinkWrap: true,
                      children: item.map((element) => Text(element)).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  userimg() {
    return Center(
      child: Container(
        // padding: EdgeInsets.only(bottom: 40.0),
        alignment: Alignment.center,
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.blue),
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ]),
        child: _image == null
            ? Text(
                'Add your photo',
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              )
            : Image.file(_image),
      ),
    );
  }
}

// SizedBox sizeheight(double a) {
//   return SizedBox(
//     height: a,
//   );
// }

// SizedBox sizewidth(double b) {
//   return SizedBox(
//     width: b,
//   );
// }

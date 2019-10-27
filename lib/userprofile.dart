import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';


class Userprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  State createState() => new UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
            },
          ),
        ],),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Stack(
          children: <Widget>[
            userimg(),
                sizeheight(200),
            Container(
              margin: EdgeInsets.only(top: 60, left: 200, right: 100),
      child: FloatingActionButton(
      onPressed: getImage,
      tooltip: 'Pick Image',
      child: Icon(Icons.add_a_photo),
    ),),
    Container(
      margin: EdgeInsets.only(top: 10, left: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
      children: <Widget>[
        Text('Name: Saugat poudel'),
        sizeheight(10),
        Text('Address: Bouddha, kathmandu'),
        sizeheight(10),
        Text('Phone: 9860401034'),
      ],
      ),
      
    ),

    Container(
      margin: EdgeInsets.only(top: 450),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue

            ),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              iconSize: 40,
              onPressed: (){}
            ),
            Text('Edit'),
              ],
              
            ) 

          ),
          sizewidth(10),
          Container(
           
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue

            ),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.update),
              iconSize: 40,
              onPressed: (){}
            ),
            Text('Update'),
              ],
              
            ) 

          ),
            sizewidth(10),
          Container(
            height: 100,
            width: 100,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue

            ),
           child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              iconSize: 40,
              onPressed: (){}
            ),
            Text('Help'),
              ],
              
            ) 

          )
        ],

      ),
    )

          ],
          
        ),
      ),
    );
  }


userimg() {
  return Container(
    margin: EdgeInsets.only(top: 60, left: 50),
    alignment: Alignment.center,
    width: 200.0,
    height: 200.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.blue),
      boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          ),]
    ),
    child: _image == null ? Text('Add your photo',style: TextStyle(color: Colors.white.withOpacity(0.6)),) : Image.file(_image),
  );
}
}

SizedBox sizeheight(double a) {
    return SizedBox(
      height: a,
    );
  }

SizedBox sizewidth(double b) {
  return SizedBox(
    width: b,
  );
}



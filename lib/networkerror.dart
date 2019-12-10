import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:office_prj/checknetconnection.dart';
import 'package:office_prj/homePage.dart';
import 'package:office_prj/main.dart';
import 'package:office_prj/orientation.dart';

class ErrorContent extends StatefulWidget {
  NetworkErrorAnimation animation;
  String accessToken;
  ErrorContent({@required AnimationController controller})
      : animation = new NetworkErrorAnimation(controller);

  @override
  _ErrorContentState createState() => _ErrorContentState();
}

class _ErrorContentState extends State<ErrorContent> {
   bool _value=false;

  void _onChangeSwitch(bool _value){
    setState(() {
      _value=!_value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CloudCutColoredImage(Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0,
                  right: 0,
                  child: Transform(
                    transform: new Matrix4.diagonal3Values(
                      1.5 - widget.animation.sizeTranslation.value,
                      1.5 - widget.animation.sizeTranslation.value,
                      .0,
                    ),
                    alignment: Alignment.center,
                    child: SafeArea(
                      child: Icon(
                        Icons.signal_wifi_off,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ),
                ),
                 
                Positioned(
                    top: 16.0,
                    right: 8.0,
                    child: Transform(
                      transform: new Matrix4.translationValues(
                        1 - widget.animation.xTranslation.value,
                        0.0,
                        0.0,
                      ),
                      child: SafeArea(
                        child: Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.27,
                        ),
                      ),
                    )),
                      
                Positioned(
                    top: 24.0,
                    left: 8.0,
                    child: Transform(
                      transform: new Matrix4.translationValues(
                        widget.animation.xTranslation.value,
                        0.0,
                        0.0,
                      ),
                      child: SafeArea(
                        child: Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                    )),
                            
                Positioned(
                    top: 30.0,
                    left: 120.0,
                    child: Transform(
                      transform: new Matrix4.translationValues(
                        widget.animation.xTranslation.value,
                        80.0,
                        20.0
                      ),
                      child: SafeArea(
                        child: Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.17,
                        ),
                      ),
                    )),
              ],
            ),
            
          )),
          
      
          Expanded(
              child: Column(
              
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              SizedBox(
                height: 30,
              ),
              Transform(
                transform: new Matrix4.diagonal3Values(
                  widget.animation.sizeTranslation.value * 2,
                  widget.animation.sizeTranslation.value * 2,
                  1.0,
                ),
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Whoops!',
                  style: Theme.of(context).textTheme.display2.copyWith(
                      color: widget.animation._colorTween.value,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AutoSizeText(
                'No internet connection found!\nTurn on wifi/mobile data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),

              RaisedButton(
                color: Colors.blue[900],
                highlightColor: Colors.pink,
                onPressed: (){
                  //Navigator.of(context).pop();
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Nextpage(LoginPageState.accessToken)),
                      );
                  //  if(a==1){
                  //   a=0;
                  //    checkInternetConnectivity(a,context);
                  //  }else{
                  //     checkInternetConnectivity(a,context);
                  //    }
                     },
                child: AutoSizeText(
                  'Try again',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    
                  ),
                 
                 ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 120,),
              //   child: SwitchListTile(
              //     value: _value,
              //     onChanged: _onChangeSwitch,
              //     activeColor: Colors.blue[900],
              //     // title: Text(
              //     //   "Cellular Data",
              //     //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    

              //     //   ),
              //   ),
              // )
            ],
          ))
        ]);
  }
}

class CloudCutColoredImage extends StatelessWidget {
  CloudCutColoredImage(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      child: new DecoratedBox(
        decoration: BoxDecoration(color: Colors.blue[300]),
        child: child,
      ),
    );
  }
}



class NetworkErrorAnimation {
  NetworkErrorAnimation(this.controller)
    : sizeTranslation = new Tween(begin: 0.4, end: 0.7).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        ),
        labelOpacity = new Tween(begin: 0.4, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        ),
        xTranslation = new Tween(begin: 60.0, end: 0.5).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        ),
        _colorTween = ColorTween(begin: Colors.black, end: Colors.blueGrey).animate(
          new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        );

  final AnimationController controller;
  final Animation<double> sizeTranslation;
  final Animation<double> labelOpacity;
  final Animation<double> xTranslation;
  final Animation _colorTween;
}

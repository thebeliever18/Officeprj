import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/commentGetApi.dart';  
Future postApiComment(getAccessToken,comment,getOrderId,context) async{
  String sendComment=comment.text;
  Map<String,String> postComment = {'comment': sendComment};
  Map<String, String> headers = {"Authorization": "Bearer $getAccessToken"};
  String postApiUrl="http://test.dsewa.com.np/api/android/order-comment-store/$getOrderId";
  http.Response response = await http.post(
        postApiUrl,
        body: postComment,
        headers: headers);
  print(response.body);
  if(response.statusCode==200){
    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CommentApi(getOrderId,getAccessToken,true);
                  }),
                );
  }else{
    print("notsuccess");
  }
}

// class CommentPostApi extends StatefulWidget{
//   String getAccessToken,
//          getOrderId;
//   var comment;
//   CommentPostApi(this.getAccessToken,
//                  this.comment,
//                  this.getOrderId);      
//   @override
//   State<StatefulWidget> createState() {
//     return CommentPostApiSate(this.getAccessToken,
//                               this.comment,
//                               this.getOrderId);
//   }
// }

// class CommentPostApiSate extends State<CommentPostApi>{
//   String getAccessToken,
//          getOrderId;
//    var comment;
//   CommentPostApiSate(this.getAccessToken,
//                      this.comment,
//                      this.getOrderId);     
//   @override
//   void initState() {
//     super.initState();
//     postApiComment(getAccessToken,comment,getOrderId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     );
//   }
// }
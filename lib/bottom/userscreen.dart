import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/provider/postprovider.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/test/ttestest.dart';
import 'package:moraeng/theme/sarantexttheme.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserProvider userProvider= Get.find();
  PostProvider postProvider= Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:Container(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('나의 페이지',style: SaranTextTheme.bigTitle,),

                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),

                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: userProvider.userFS.thumbnail,
                              imageBuilder: (context, imageProvider) => Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),))),
                              errorWidget: (context, url, error) => Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/image/kakaologo.jpeg'), fit: BoxFit.cover),
                                ),
                              ),

                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userProvider.userFS.nickName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                Text(userProvider.userFS.email),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  Get.to(Home2());
                                },
                                child: Icon(Icons.auto_fix_high))
                          ],
                        ),
                      ),
                    ),

                    ElevatedButton(onPressed: () {
                      userProvider.signOut();
                    },
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                            primary: Colors.orange
                        ),
                        child: Text('로그아웃'))
                  ],
                ),
              ),
            ),


          ],
        ),
      )

    );
  }
}

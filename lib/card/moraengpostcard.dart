import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moraeng/model/postmodelapp.dart';

class MoraengPostCard extends StatefulWidget {
  PostModelApp thisPost;
  double ratio;
  Function widgetFunction;
  bool isCircle;

  MoraengPostCard({this.thisPost,this.ratio,this.widgetFunction,this.isCircle=false});

  @override
  _MoraengPostCardState createState() => _MoraengPostCardState();
}

class _MoraengPostCardState extends State<MoraengPostCard> {
  @override
  Widget build(BuildContext context) {
    return widget.isCircle?CachedNetworkImage(
      imageUrl: widget.thisPost.thumbnail,
      imageBuilder: (context, imageProvider) => Container(
        width: 150.0,
        height: 150.0,
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
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/image/kakaologo.jpeg'), fit: BoxFit.cover),
        ),
      ),

    ): CachedNetworkImage(
      imageUrl: widget.thisPost.thumbnail,
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: widget.ratio??16/9,
        child: Container(

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
          width: 70,
          height: 70,
          child: Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),))),
      errorWidget: (context, url, error) => AspectRatio(
        aspectRatio: widget.ratio??16/9,
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage('assets/image/kakaologo.jpeg'), fit: BoxFit.cover),
          ),
        ),
      ),

    );


  }
}





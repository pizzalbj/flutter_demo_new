import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_new/widget/zb_image_view.dart';

List lists = [
  {
    "url":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=2c0ccc64ab23eb9baa5f6582e0e4f52d&imgtype=0&src=http%3A%2F%2Fpic.feizl.com%2Fupload%2Fallimg%2F170725%2F43998m3qcnyxwxck.jpg"
  },
  {
    "url":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=37d5107e6f7277bc4bfd323845a2ef32&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Fsmccloud%2Ffetch%2F2015%2F06%2F05%2F79697840747611479.JPEG"
  },
  {
    "url":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212636935&di=110a278fe4fb22f07d183a049f36cba3&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3695896267%2C3833204074%26fm%3D214%26gp%3D0.jpg"
  },
  {
    "url":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=3730dccf46e4b4f35bcb882148b973ee&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F71%2F4c5b0d26ad.jpg"
  }
];

class ImagesViewPage extends StatelessWidget {
  // 图片
  List<Widget> renderImages(BuildContext context) {
    List<Widget> array = [];
    lists.forEach((image) {
      array.add(
        new InkWell(
          child: new CachedNetworkImage(
            height: 80,
            imageUrl: image["url"],
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => new CupertinoActivityIndicator(),
          ),
          onTap: () {
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (ctx) {
                return ViewDialog(
                  image: image,
                  images: lists,
                  width: MediaQuery.of(context).size.width,
                );
              }),
            );
          },
        ),
      );
    });
    return array;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("查看图片"),
      ),
      body: new Center(
        child: new Column(
          children: renderImages(context),
        ),
      ),
    );
  }
}

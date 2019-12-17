import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridAnimationState();
  }
}

class GridAnimationState extends State<GridAnimation> {
  List<String> lists = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=2c0ccc64ab23eb9baa5f6582e0e4f52d&imgtype=0&src=http%3A%2F%2Fpic.feizl.com%2Fupload%2Fallimg%2F170725%2F43998m3qcnyxwxck.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=37d5107e6f7277bc4bfd323845a2ef32&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Fsmccloud%2Ffetch%2F2015%2F06%2F05%2F79697840747611479.JPEG",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=95860b0fd501110885cf6e191f7403f0&imgtype=0&src=http%3A%2F%2Fuploads.5068.com%2Fallimg%2F1712%2F144-1G2011I420.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212636935&di=110a278fe4fb22f07d183a049f36cba3&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3695896267%2C3833204074%26fm%3D214%26gp%3D0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=3730dccf46e4b4f35bcb882148b973ee&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F71%2F4c5b0d26ad.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=4f53fa8e1699def18e976deaee5558bf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151851_r34Se.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557758&di=ea77e663ac012b8ce7eb921454528cb8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151853_Xr2UP.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=513a2deeb0b9f66ac9f7713c1f08e38c&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109132.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=d895baef0710a780cbff871b68fbabba&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515909.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686376&di=6c670e61692a4b8a8c97fc8d751df6e9&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-8%2F2018082209071335857.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=5772b73b9349682e9883d57394655c5e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109561.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1919562808,974781852&fm=11&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
  ];

  void showPhoto(BuildContext context, f, index) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
          // appBar: AppBar(title: Text('图片${index + 1}')),
          body: SizedBox.expand(
            child: Hero(
              tag: index,
              child: new EnlargePhonePage(url: f),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('GridAnimation'),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new SafeArea(
              top: false,
              bottom: false,
              child: new GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio: 1.5,
                children: lists.map((f) {
                  return new GestureDetector(
                    onTap: () {
                      var index;
                      if (lists.contains(f)) {
                        index = lists.indexOf(f);
                      }
                      showPhoto(context, f, index);
                    },
                    child: Image.network(
                      f,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 可以放大图片的widget
class EnlargePhonePage extends StatefulWidget {
  final url;

  const EnlargePhonePage({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EnlargePhonePageState();
  }
}

class EnlargePhonePageState extends State<EnlargePhonePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  Offset _offset = Offset.zero; // 图片的偏移量
  double _scale = 1.0; // 当前放大比例
  Offset _normalizedOffset;
  double _previousScale; // 上一次放大比例
  double _kMinFlingVelocity = 600.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_animation.value);
      setState(() {
        _offset = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Offset _clampOffset(Offset offset) {
    // widget的屏幕宽度
    final Size size = context.size;
    // 限制他的最小尺寸
    final Offset minOffset = Offset(size.width, size.height) * (1.0 - _scale);
    return Offset(
      offset.dx.clamp(minOffset.dx, 0.0),
      offset.dy.clamp(minOffset.dy, 0.0),
    );
  }

  /// 与屏幕接触的指针建立了一个焦点，初始 scale 为 1.0
  void _handleOnScaleStart(ScaleStartDetails details) {
    // ScaleStartDetails(focalPoint: Offset(193.8, 408.3), localFocalPoint: Offset(193.8, 408.3))
    // focalPoint: 返回与屏幕接触的指针初始焦点(Reported in global coordinates: 屏幕左上角的绝对定位)
    // localFocalPoint: 返回与屏幕接触的指针初始焦点(Reported in local coordinates: widget 的相对定位。如设置了 Scaffold 的 appBar，会导致 focalPoint != localFocalPoint)
    // print("_handleOnScaleStart: $details");
    setState(() {
      // 之前的放大倍率（_previousScale）= 现在的放大倍率（_scale）
      _previousScale = _scale;
      // 获取双指接触屏幕后，图片的聚焦点的位置偏移量（绝对位置，距离左上角的位置偏移量）
      // _normalizedOffset(x,y) =（details.focalPoint手指接触屏幕的聚焦坐标(x,y) - _offset图片的偏移量，也就是距离左上角（0,0）的偏移值(x,y)）/ _scale放大的比例
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    // ScaleUpdateDetails(focalPoint: Offset(205.0, 385.2), localFocalPoint: Offset(205.0, 385.2), scale: 1.1870792082717232, horizontalScale: 0.7027023516057295, verticalScale: 1.2135231200779208, rotation: 0.0)
    // print("_handleOnScaleUpdate: $details");
    setState(() {
      // 获取当前的放大倍数
      // 限制放大倍数 1~3 倍。clamp: 返回范围里的值
      // _scale = (之前的放大比例 * 当前缩放过程中的返回的放大比例）
      _scale = (_previousScale * details.scale).clamp(1.0, 3.0);
      // 更新当前位置
      // _clampOffset(手指的聚焦坐标(x,y) - 图片的实际偏移量）
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    // ScaleEndDetails(velocity: Velocity(-27.3, 106.5))。Velocity: 速率
    print("_handleOnScaleEnd: $details");
    // 获取放大缩小图片的速率
    // magnitude: 大小、量级
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    print("magnitude: $magnitude");
    if (magnitude < _kMinFlingVelocity) return;
    // 速率大于 600 的话
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    // 计算当前的方向
    final double distance = (Offset.zero & context.size).shortestSide;
    // 计算放大倍速，并相应的放大宽和高，比如原来是 600*480 的图片，放大后倍数为1.25倍时，宽和高是同时变化的
    _animation = _controller.drive(Tween<Offset>(
      begin: _offset,
      end: _clampOffset(_offset + direction * distance),
    ));
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      // ClipRect: 使用矩形来剪辑 widget
      child: ClipRect(
        // Transform: 用于在绘制子组件之前转换 widget
        child: Transform(
          // Matrix4: 4D 矩阵
          // Matrix4.identity(): 返回单位矩阵
          // todo: 主要是通过这里来转变图片的位置(x,y)和大小(_scale)
          transform: Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: new CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: widget.url,
            placeholder: (context, url) => new CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          // child: Image.network(widget.url,fit: BoxFit.cover,)
        ),
      ),
    );
  }
}

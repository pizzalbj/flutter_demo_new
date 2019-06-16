import 'package:flutter/material.dart';

class RepairListQuotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RepairListQuotePagesState();
  }
}

class RepairListQuotePagesState extends State<RepairListQuotePage> {
  // 材料报价费用类型
  List<String> materialTypes = ["位置", "系列", "名称", "型号", "品牌", "单价"];

  // value: [{"name": "人工费","conl": new TextEditingController()},{},{}...]
  List<Map<String, dynamic>> materialTypesAndController =
      new List<Map<String, dynamic>>();

  // form key :
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getTypes();
  }

  // 设置 值 和 Controller
  void getTypes() {
    for (var i = 0; i < materialTypes.length; i++) {
      materialTypesAndController.add({
        'name': materialTypes[i],
        "conl": new TextEditingController(),
      });
    }
  }

  // 下拉刷新
  Future<Null> _pullToRefresh() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      materialTypesAndController[0]['conl'].text = "刷新啦 1";
      materialTypesAndController[1]['conl'].text = "刷新啦 2";
      materialTypesAndController[2]['conl'].text = "刷新啦 3";
      materialTypesAndController[3]['conl'].text = "刷新啦 4";
      materialTypesAndController[4]['conl'].text = "刷新啦 5";
      materialTypesAndController[5]['conl'].text = "刷新啦 6";
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: RefreshIndicator(
        child: new Form(
          key: _formKey,
          autovalidate: true,  // 自动消失红色提醒
          child: new Container(
            decoration: new BoxDecoration(color: const Color(0xfff6f6f6)),
            child: _buildMainContent(),
          ),
        ),
        onRefresh: _pullToRefresh,
      ),
    );
  }

  Widget _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _buildMaterialTextField(),
            _buildTips(),
            _submit(),
          ]),
        )
      ],
    );
  }

  Widget _buildMaterialTextField() {
    return new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new ListView.builder(
        itemCount: materialTypesAndController.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext ctx, int i) {
          return new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(
                      materialTypesAndController[i]['name'],
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new TextFormField(
                      controller: materialTypesAndController[i]['conl'],
                      validator: (Str) {
                        print(Str);
                        if (Str.length == 0) {
                          return "${materialTypesAndController[i]['name']} 为空";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintText: '请输入${materialTypesAndController[i]['name']}',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              i != materialTypesAndController.length - 1
                  ? new Divider()
                  : new Container(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTips() {
    return new Container(
      margin: new EdgeInsets.fromLTRB(20.0, 12.0, 0.0, 32.0),
      child: new Text(
        "如果产生费用，请填写报价，所有报价均为含税价",
        style: new TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _submit() {
    return new FlatButton(
      color: Colors.red,
      onPressed: () {
        final FormState form = _formKey.currentState;
        if (form.validate()) {
          print("form.validate");
        } else {
          print(materialTypesAndController[0]['conl'].text);
          print(materialTypesAndController[1]['conl'].text);
          print(materialTypesAndController[2]['conl'].text);
          print(materialTypesAndController[3]['conl'].text);
          print(materialTypesAndController[4]['conl'].text);
          print(materialTypesAndController[5]['conl'].text);
          print("---- ----");
        }
      },
      child: new Text("取值"),
    );
  }
}

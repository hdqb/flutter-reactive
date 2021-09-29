// import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ipwf/ActionFactory.dart';
import 'package:ipwf/ipwf.dart';
import 'package:ipwf/model/states_states_generated.dart' as S;

// /
// / Search bar.
// / Receive money.
// / Transfer money,
// / withdraw money,
// / payment code,
// / scan QR code
// /
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  S.Root state;

  //
  int floatingAppBarIndex;

  @override
  void initState() {
    // _controller.addListener(_scrollListener);
    super.initState();
    state = Ipwf.setup();
    Ipwf.stream.listen((event) {
      setState(() {
        print("state : $state");
        state = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    S.MainPage mainPage = state.page as S.MainPage;
    S.User User = state.user as S.User;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        state: mainPage,
        user: User,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.state, this.user}) : super(key: key);
  final String title;
  final S.MainPage state;
  final S.User user;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ScrollController _controller ;

  ScrollController _controller = ScrollController();

  String message;

  _onStartScroll(ScrollMetrics metrics) => setState(() {
        message = "Scroll Start";
      });

  _onUpdateScroll(ScrollMetrics metrics) => setState(() {
        message = "Scroll Update";
      });

  _onEndScroll(ScrollMetrics metrics) => setState(() {
        message = "Scroll End";
      });

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            // print(scrollNotification);
            if (scrollNotification is ScrollStartNotification) {
              message = "Scroll Start";
              // ActionFactory.createMainPageButtonClick().doAction();
              // _onStartScroll(scrollNotification.metrics);
              // ActionFactory.createMainPageButtonClick(message).doAction();
              _onStartScroll(scrollNotification.metrics);
            } else if (scrollNotification is ScrollUpdateNotification) {
              message = "Scroll Update";
              _onUpdateScroll(scrollNotification.metrics);
              //  _onUpdateScroll(scrollNotification.metrics);
              // ActionFactory.createMainPageButtonClick(message).doAction();
            } else if (scrollNotification is ScrollEndNotification) {
              message = "Scroll End";
              _onEndScroll(scrollNotification.metrics);
              //  _onEndScroll(scrollNotification.metrics);
              // ActionFactory.createMainPageButtonClick(message).doAction();
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.grey.withOpacity(0.5),
            body: CustomScrollView(
              controller: _controller,
              slivers: [
                TransitionAppBar(
                  // _scrollNotification,
                  scrollNotification: message,
                  controller: _controller,
                  extent: 250,
                  TbReceiveMn: Container(
                    child: CircleButton(
                      text: '>',
                      onPressed: () => {},
                    ),
                  ),
                  TbTransferMn: Container(
                    child: CircleButton(
                      text: '<',
                      onPressed: () => {},
                    ),
                  ),
                  TbQrCode: Container(
                    child: CircleButton(
                      text: '1',
                      onPressed: () => {},
                    ),
                  ),
                  TbScanQr: Container(
                    child: CircleButton(
                      text: '2',
                      onPressed: () => {},
                    ),
                  ),
                  TbProfile: Container(
                    child: CircleButton(
                      text: '>',
                      onPressed: () => {},
                    ),
                  ),
                  TbSearchBar: CircleInput(hintText: "Search",)
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                      color: Colors.white.withOpacity(1.0),
                      child: ListTile(
                        title: Text("${index}  ${widget.state.text.count}  "),
                      ));
                }, childCount: 25))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ));

  void _incrementCounter() {
    // print(ActionFactory.createMainPageButtonClick("bao").do_action(data));
    ActionFactory.createMainPageButtonClick("1name").doAction();
  }
}

class TransitionAppBar extends StatelessWidget {
  final Widget TbQrCode;
  final Widget TbScanQr;
  final Widget TbReceiveMn;
  final Widget TbTransferMn;
  final Widget TbProfile;
  final Widget TbSearchBar;
  final double extent;
  final ScrollController controller;

  String scrollNotification;

  TransitionAppBar({
    Key key,
    this.extent = 250,
    this.controller,
    this.scrollNotification,
    this.TbQrCode,
    this.TbScanQr,
    this.TbReceiveMn,
    this.TbTransferMn,
    this.TbSearchBar,
    this.TbProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print ("scrollNotification ${scrollNotification}");

    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        TbReceiveMn: TbReceiveMn,
        TbQrCode: TbQrCode,
        TbScanQr: TbScanQr,
        TbProfile: TbProfile,
        TbTransferMn: TbTransferMn,
        TbSearchBar: TbSearchBar,
        extent: extent > 200 ? extent : 200,
        controller: controller,
        scrollNotification: scrollNotification,
        // sn: NotificationListener<ScrollNotification>(
        //     onNotification: (scrollNotification) {
        //       print(scrollNotification);
        //       //do your logic
        //     })
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(bottom: 10, left: 30),
      end: EdgeInsets.only(left: 0.0, top: 30.0));
  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topCenter);

  final Widget TbScanQr;
  final Widget TbQrCode;
  final Widget TbTransferMn;
  final Widget TbProfile;
  final Widget TbReceiveMn;
  final Widget TbSearchBar;
  final double extent;
  final ScrollController controller;
  String scrollNotification;
  String scroll_Notification;

  _TransitionAppBarDelegate({
    this.TbScanQr,
    this.TbQrCode,
    this.TbTransferMn,
    this.TbProfile,
    this.TbReceiveMn,
    this.TbSearchBar,
    this.controller,
    this.extent = 250,
    this.scrollNotification,
  })  : assert(TbScanQr != null),
        assert(TbQrCode != null),
        assert(TbTransferMn != null),
        assert(TbProfile != null),
        assert(TbReceiveMn != null),
        assert(TbSearchBar != null),
        assert(extent == null || extent >= 200);

  // Future getExpensesByFundId(int fundId) async {
  //   Database db = await database;
  //
  //   List<Expense> expenseList = List();
  //
  //   return db.query(expTable,where: '$expTable.$expFundId = $fundId')
  //       .then((List<Map<String,dynamic>> expList){
  //     expList.forEach((Map<String, dynamic> expMap){
  //       expenseList.add(Expense.fromMap(expMap));
  //     });
  //   });
  // }
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // NotificationListener<ScrollNotification>(
    //     onNotification: (scrollNotification) {
    //       print(scrollNotification);
    //       //do your logic
    //     });
    // print ("ScrollStartNotification1 ${scrollNotification}");
    //
    // if (scrollNotification is ScrollStartNotification) {
    //
    //   print ("ScrollStartNotification ${scrollNotification.metrics}");
    //
    // } else if (scrollNotification is ScrollUpdateNotification) {
    //
    //   print ("ScrollUpdateNotification ${scrollNotification.metrics}");
    //
    // } else if (scrollNotification is ScrollEndNotification) {
    //   if (controller.offset < 103 ){
    //     // controller.animateTo(0,  curve:Curves.linear, duration: Duration (milliseconds: 100));
    //     print ("ScrollEndNotification ${scrollNotification.metrics}");
    //
    //   }
    // }
    // print(ScrollUpdateNotification);
    if (scroll_Notification != "scrollOnUpdate" &&
        scroll_Notification != "scrollUpdateDone") {
      scroll_Notification = ("scrollUpdateDone");
    }
    // else if (scrollNotification != "scrollOnUpdate" &&
    //     scrollNotification != "scrollUpdateDone") {
    //   ActionFactory.createMainPageButtonClick("scrollUpdateDone").doAction();
    // }

    if (scrollNotification == "Scroll End" &&
        controller.offset < minExtent &&
        controller.offset > kToolbarHeight &&
        scroll_Notification == "scrollUpdateDone" &&
        scroll_Notification != "scrollOnUpdate") {
      try {
        ActionFactory.createMainPageButtonClick("scrollOnUpdate").doAction();
        controller
            .animateTo(minExtent,
                curve: Curves.linear, duration: Duration(milliseconds: 100))
            .then((v) =>
                ActionFactory.createMainPageButtonClick("scrollUpdateDone")
                    .doAction());
      } catch (e) {
        print(e);
      }

      // ActionFactory.createMainPageButtonClick("1name").doAction();
      // shrinkOffset = 250;
    } else if (scrollNotification == "Scroll End" &&
        controller.offset > 0 &&
        controller.offset < kToolbarHeight &&
        scroll_Notification == "scrollUpdateDone" &&
        scroll_Notification != "scrollOnUpdate") {
      try {
        ActionFactory.createMainPageButtonClick("scrollOnUpdate").doAction();
        controller
            .animateTo(0,
                curve: Curves.linear, duration: Duration(milliseconds: 100))
            .then((v) =>
                ActionFactory.createMainPageButtonClick("scrollUpdateDone")
                    .doAction());
      } catch (e) {
        print(e);
      }

      // ActionFactory.createMainPageButtonClick("1name").doAction();
    }

    print("${controller.offset}, $scrollNotification");
    // print("ScrollNotification : $ScrollNotification ,controller : ${controller.offset} , shrinkOffset: $shrinkOffset, states: $states");

    double tempVal = 34 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    // print("Objechjkf === ${progress} ${shrinkOffset}");
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);

    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          print(scrollNotification);
          // scrollNotification = _scrollNotification ;

          // print ("ScrollStartNotification ${_scrollNotification}");

          // this._scrollNotification = scrollNotification;
          // return true;
          // _scrollNotification = scrollNotification;
        },
        child: Stack(
          children: <Widget>[
            // AnimatedContainer(
            //   duration: Duration(milliseconds: 100),
            //   height: shrinkOffset,
            //   constraints: BoxConstraints(maxHeight: kToolbarHeight*1.618),
            //   color: Colors.redAccent,
            // ),

            Container(color: Colors.blue[600].withOpacity(0.7),height: kToolbarHeight*1.618,),
            SizedBox(
              child: Padding(
                padding: EdgeInsetsTween(
                        begin: EdgeInsets.only(
                            top: kToolbarHeight / 1.618, right: 160),
                        end: EdgeInsets.only(
                            right: 200.0, left: 0.0, top: kToolbarHeight / 1.618))
                    .lerp(progress),
                child: Align(alignment: avatarAlign, child: TbReceiveMn),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsetsTween(
                        begin: EdgeInsets.only(
                            top: kToolbarHeight / 1.618, right: 0,bottom: 10),
                        end: EdgeInsets.only(
                            right: 0.0, left: 0.0, top: kToolbarHeight / 1.618))
                    .lerp(progress),
                child: Align(alignment: Alignment.bottomCenter, child: TbTransferMn),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsetsTween(
                        begin: EdgeInsets.only(
                            top: kToolbarHeight / 1.618, right: 90,bottom: 10),
                        end: EdgeInsets.only(
                            right: 0.0, left: 0.0, top: kToolbarHeight / 1.618))
                    .lerp(progress),
                child: Align(alignment: Alignment.bottomCenter, child: TbQrCode),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsetsTween(
                        begin: EdgeInsets.only(
                            top: kToolbarHeight / 1.618, left: 90, bottom: 10),
                        end: EdgeInsets.only(
                            right: 0.0, left: 0.0, top: kToolbarHeight / 1.618))
                    .lerp(progress),
                child: Align(alignment: Alignment.bottomCenter, child: TbScanQr),
              ),
            ),
            Container(
              // height: kToolbarHeight ,
              // width: 350,
              margin:  EdgeInsets.all(10) ,
              child: Padding(
                padding: EdgeInsetsTween(
                        begin: EdgeInsets.only(
                            top: kToolbarHeight / 1.618, right: 20 ),
                        end: EdgeInsets.only(
                            right: .0, left: .0, top: kToolbarHeight / 1.618))
                    .lerp(progress),
                child: Align(alignment: Alignment.topRight, child: TbProfile),
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsTween(
            //           begin: EdgeInsets.only(
            //               top: kToolbarHeight / 1.618, right: 160),
            //           end: EdgeInsets.only(
            //               right: 200.0, left: 0.0, top: kToolbarHeight / 1.618))
            //       .lerp(progress),
            //   child: Align(alignment: avatarAlign, child: TbReceiveMn),
            // ),
            Container(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsetsTween(
                          begin: EdgeInsets.only(
                              top: kToolbarHeight  /1.25 , right: MediaQuery.of(context).size.width/1.618/1.618/1.618),
                          end: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width/1.618, left: 0, top: kToolbarHeight  /1.25 ))
                      .lerp(progress),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TbSearchBar,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => (maxExtent * 68) / 100;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return TbSearchBar != oldDelegate.TbSearchBar ||
        // TbReceiveMn != oldDelegate.TbReceiveMn ||
        // TbProfile != oldDelegate.TbProfile ||
        // TbQrCode != oldDelegate.TbQrCode ||
        // TbScanQr != oldDelegate.TbScanQr ||
        TbTransferMn != oldDelegate.TbTransferMn;
  }
}

class CircleButtonBar extends StatelessWidget {
  CircleButtonBar({
    @required this.text,
    @required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: RaisedButton(
        child: RotatedBox(quarterTurns: 1, child: Text(text,style: TextStyle(color: Colors.white, fontSize: 12.0),)),
        color: Colors.blue,
        colorBrightness: Brightness.dark,
        // shape: CircleBorder(),
        onPressed: onPressed,
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  CircleButton({
    @required this.text,
    @required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: RaisedButton(
        child: RotatedBox(quarterTurns: 1, child: Text(text,style: TextStyle(color: Colors.white, fontSize: 12.0),)),
        color: Colors.blue,
        colorBrightness: Brightness.dark,
        // shape: CircleBorder(),
        onPressed: onPressed,
      ),
    );
  }
}

class CircleInput extends StatelessWidget {
  final String hintText;

  const CircleInput({Key key, this.hintText}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Row(children: <Widget>[

        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: Icon(Icons.search),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
            autofocus: false,
            // style: TextField_Style,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.all(11.5),
                hintText: hintText,
                border: InputBorder.none,
                disabledBorder: OutlineInputBorder(
                  borderSide:
                  new BorderSide(color: Colors.transparent),
                  borderRadius: new BorderRadius.circular(2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  new BorderSide(color: Colors.transparent),
                  borderRadius: new BorderRadius.circular(2),
                )),
          ),
        )
      ]),
    );
  }
}

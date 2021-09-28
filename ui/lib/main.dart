// import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ipwf/ActionFactory.dart';
import 'package:ipwf/ipwf.dart';
import 'package:ipwf/model/states_states_generated.dart' as S;

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
                  avatar: Text("Rancho"),
                  title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              hintText: "Search",
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
                  ),
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
  final Widget avatar;
  final Widget title;
  final double extent;
  final ScrollController controller;

  String scrollNotification;

  TransitionAppBar({
    this.avatar,
    this.title,
    this.extent = 250,
    this.controller,
    Key key,
    this.scrollNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print ("scrollNotification ${scrollNotification}");

    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        avatar: avatar,
        title: title,
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

  final Widget avatar;
  final Widget title;
  final double extent;
  final ScrollController controller;
  String scrollNotification;
  String scroll_Notification;

  _TransitionAppBarDelegate({
    this.controller,
    this.avatar,
    this.title,
    this.extent = 250,
    this.scrollNotification,
  })  : assert(avatar != null),
        assert(extent == null || extent >= 200),
        assert(title != null);

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
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              height: shrinkOffset,
              constraints: BoxConstraints(maxHeight: minExtent),
              color: Colors.redAccent,
            ),
            Padding(
              padding: avatarMargin,
              child: Align(alignment: avatarAlign, child: avatar),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsetsTween(
                          begin: EdgeInsets.only(top: kToolbarHeight/1.618,right: 160),
                          end: EdgeInsets.only(right: 200.0, left: 0.0, top: kToolbarHeight/1.618))
                      .lerp(progress),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: title,
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
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}

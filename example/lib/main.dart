import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Advanced Fab demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  AdvFabController mabialaFABController;
  bool useFloatingSpaceBar = false;
  bool useAsFloatingActionButton = false;
  bool useNavigationBar = true;
  @override
  void initState() {
    super.initState();
    mabialaFABController = AdvFabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AdvFabBottomBarBody(
          screens: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Push the button to expand or collapse',
                  ),
                  RaisedButton(
                    onPressed: () {
                      mabialaFABController.setExpandedWidgetConfiguration(
                        showLogs: true,
                        heightToExpandTo: 25,
                        expendedBackgroundColor: Colors.blue[300],
                        withChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: (MediaQuery.of(context).size.width),

                            ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                            ///in the next line we use 20%
                            height:
                                (MediaQuery.of(context).size.height / 100) * 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8),
                                    child: Text('Movies'),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: 7,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100) *
                                              25,

                                          //height: (MediaQuery.of(context).size.height/100)*9,
                                          color: Colors.pink,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      mabialaFABController.isCollapsed
                          ? mabialaFABController.expandFAB()
                          : mabialaFABController.collapseFAB();
                    },
                    child: Icon(Icons.add_circle),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            useFloatingSpaceBar = true;
                            useAsFloatingActionButton = false;
                            useNavigationBar = false;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Text('Use Floating bar'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            useFloatingSpaceBar = false;
                            useAsFloatingActionButton = true;
                            useNavigationBar = false;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Text('Use as Floating Action button'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            useFloatingSpaceBar = false;
                            useAsFloatingActionButton = false;
                            useNavigationBar = true;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Text('Use as Navigation bar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.orange,
            )
          ],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
        floatingActionButton: AdvFab(
          showLogs: true,
          onFloatingActionButtonTapped: () {},
          floatingActionButtonIcon: Icons.add,
          floatingActionButtonIconColor: Colors.red,
          navigationBarIconActiveColor: Colors.pink,
          navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
          collapsedColor: Colors.grey[200],
          useAsFloatingSpaceBar: useFloatingSpaceBar,
          useAsFloatingActionButton: useAsFloatingActionButton,
          useAsNavigationBar: useNavigationBar,
          controller: mabialaFABController,
          animationDuration: Duration(milliseconds: 350),
          navigationBarIcons: [
            AdvFabNavigationBarIcon(
              onTap: () {
                print('home button pressed');
              },
              title: 'Home',
              icon: Icons.home,
            ),
            AdvFabNavigationBarIcon(
              onTap: () {
                print('picture button pressed');
              },
              title: 'Picture',
              icon: Icons.image,
            ),
            AdvFabNavigationBarIcon(
              onTap: () {
                print('search button pressed');
              },
              title: 'Search',
              icon: Icons.search,
            ),
            AdvFabNavigationBarIcon(
              onTap: () {
                print('profile button pressed');
                setState(() {});
              },
              title: 'Profile',
              icon: Icons.person,
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

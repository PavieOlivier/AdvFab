///Thank you for using mmy work
///My name is Emile Pavie Olivier Mabiala
///Mail : paviemabiala@gmail.com
///instagram: emilecode
///website: emilecode.com
///You are free to use it  on your project :)
///if i could get some credit, it would be nice :)
///if you have any question/issues , anything related to this packages, feel free to contact me ,
library adv_fab;

import 'package:flutter/material.dart';

int? _sharedIndex;

class AdvFabController {
  ///Will return true if the AdvFab is collapsed and false otherwise
  bool isCollapsed = true;

  ///Use this to expand The floating action button
  Function? expandFAB;

  ///Use this to collapse the floating action button
  Function? collapseFAB;

  //Use this to swichTab if you are using the
  //floating action button as a bottom navigation bar
  late Function _switchTab;

  late double _heightToExpandTo;
  Widget? _expandedWidget;
  MainAxisAlignment? _expendedContainerMainAxisAlignment;
  CrossAxisAlignment? _expendedContainerCrossAxisAlignment;
  Color? _expendedColor;

  ///Use this to set the widget that will appear one the AdvFab is expended.
  ///If a widget was previously set, the previous/old widget will get overridden
  ///in favor of the new one
  ///
  /// [IMPORTANT:] The value of the heightToExpend must be given
  /// in the range [15...70] (percentage of the screen in the vertical );
  /// crossing these value might result in unexpected
  /// behavour.
  ///
  /// [NOTE:] By default AdvFab will not allow you to set customHeight outside the given range;
  /// to set set custom height set the property 'forceCustomHeight' to `true`.
  void setExpandedWidgetConfiguration(
      {MainAxisAlignment expendedContainerMainAxisAlignment =
          MainAxisAlignment.start,
      CrossAxisAlignment expendedContainerCrossAxisAlignment =
          CrossAxisAlignment.center,
      Color? expendedBackgroundColor,
      required Widget withChild,
      required double heightToExpandTo,
      bool showLogs = false,
      bool forceCustomHeight = false}) {
    //set the maain and cross axis alignment
    _expendedContainerMainAxisAlignment = expendedContainerMainAxisAlignment;
    _expendedContainerCrossAxisAlignment = expendedContainerCrossAxisAlignment;
    //set the color when expanded
    if (expendedBackgroundColor == null) {
      if (showLogs == true) {
        print(
            'AdvFab: A custom background color was not set for expanded widget' +
                '\n using the collapsed background color instead ');
      }
    } else {
      _expendedColor = expendedBackgroundColor;
    }

    // we actually remove the widget once we decide to configure it again
    if (forceCustomHeight == false) {
      if (heightToExpandTo < 15 || heightToExpandTo > 80) {
        print(
            '\n!==[AdvFab WARNING]==!\n[== The height percentage your provided is not withing the acceptable range [15...80], this might cause unexpected behaviour ==]\n[== Setting up default value of 15% to the screen height  ==]\n!==[NOTE]==!\n[== Set "forceCustomHeight" to true if you really want to use values outside the range ==]');
        _heightToExpandTo = 15;
      } else {
        _heightToExpandTo = heightToExpandTo;
      }
    } else {
      _heightToExpandTo = heightToExpandTo;
    }
    if (_expandedWidget != null) {
      _expandedWidget = null;
      _expandedWidget = withChild;
    } else {
      _expandedWidget = withChild;
    }
  }
}

///Welcome
class AdvFab extends StatefulWidget {
  //choice of usage
  ///Is set to `false` by default, make sure that [useAsFloatingActionButton = false] and
  ///[useFloatingSpaceBar= false] if you want to use it
  ///
  ///[IMPORTANT:] Scaffold -> FLoatingActionButton -> AdvFab
  final bool useAsNavigationBar;

  ///Is set to `false` by default, make sure that [useAsFloatingActionButton = false] and
  ///[useNavigationBar = false] if you want to use it
  ///
  ///[IMPORTANT:] Scaffold -> FLoatingActionButton -> AdvFab
  final bool useAsFloatingSpaceBar;

  ///Is set to `true` by default, make sure that [useNavigationBar = false] and
  ///[useFloatingSpaceBar = false] if you want to use it
  final bool useAsFloatingActionButton;

  //for the Space Bar
  ///The widget to display inside the space bar
  final Widget? spaceBarWidget;

  ///The width the spacebar will occupy on the screen ( in percentage )
  final double floatingSpaceBarContainerWidth;

  //==for the floating action button==\\
  ///The width the floating Action Button  will occupy on the screen once expended
  ///to rectangular form ( in percentage )
  final double floatingActionButtonExpendedWidth;

  ///Defines the action to be performed once the floating Action Button is pressed
  final Function? onFloatingActionButtonTapped;

  ///The icon to display inside the floating action button
  final IconData floatingActionButtonIcon;

  ///The color of the icon displayed inside of the floating action button
  final Color floatingActionButtonIconColor;

  ///The color of the navigation bar icon when selected
  final Color navigationBarIconActiveColor;

  ///The color of the navigation bar icon when Unselected
  final Color navigationBarIconInactiveColor;

  ///Use this to set the icons of the navigation bar
  final List<AdvFabNavigationBarIcon>? navigationBarIcons;

  ///The duration of the expanding animation in milliseconds
  final Duration animationDuration;

  ///The duration of the color change animetion.
  ///
  ///[Note]: Will not support hot reloading
  final Duration tweenColorAnimationDuration;

  ///The color of the AdvFab before expanding
  final Color collapsedColor;

  ///The animation curve when expanding
  final Curve expandingAnimationCurve;

  ///The animation curve when collapsing
  final Curve collapsingAnimationCurve;

  /// The controller of the class
  final AdvFabController? controller;

  /// use elevation only for floating action button
  final bool useElevation;

  /// Set to false by default; use it for Debuging,
  /// warnings and errors will always be printed
  final bool showLogs;
  const AdvFab({
    Key? key,
    this.tweenColorAnimationDuration = const Duration(milliseconds: 250),
    this.collapsingAnimationCurve = Curves.fastLinearToSlowEaseIn,
    this.expandingAnimationCurve = Curves.fastLinearToSlowEaseIn,
    this.animationDuration = const Duration(milliseconds: 350),
    this.floatingActionButtonIconColor = Colors.black38,
    this.navigationBarIconInactiveColor = Colors.grey,
    this.navigationBarIconActiveColor = Colors.blue,
    this.floatingActionButtonIcon = Icons.warning,
    this.floatingActionButtonExpendedWidth = 50,
    this.floatingSpaceBarContainerWidth = 92,
    this.useAsFloatingActionButton = true,
    this.collapsedColor = Colors.black12,
    this.useAsFloatingSpaceBar = false,
    this.onFloatingActionButtonTapped,
    this.useAsNavigationBar = false,
    this.useElevation = false,
    this.navigationBarIcons,
    this.showLogs = false,
    this.spaceBarWidget,
    this.controller,
  }) : super(key: key);
  @override
  _AdvFabState createState() => _AdvFabState();
}

class _AdvFabState extends State<AdvFab> with SingleTickerProviderStateMixin {
  late AnimationController tweenAnimationConroller;
  int? selectedIconIndex;
  late Animation<Color?> animatedColor;
  ColorTween? colorTween;
  List<Widget> iconConstructor = [];
  Widget? expandedWidget;
  bool isExpanding = false, isExpanded = false;
  double expandedChildOpacityValue = 0, expandedIconOpacity = 1;
  @override
  void initState() {
    super.initState();
    selectedIconIndex = _sharedIndex;

    tweenAnimationConroller = AnimationController(
        vsync: this, duration: widget.tweenColorAnimationDuration);
    colorTween = ColorTween(
        begin: widget.collapsedColor,
        end: widget.controller!._expendedColor ?? widget.collapsedColor);
    animatedColor = colorTween!.animate(tweenAnimationConroller)
      ..addListener(() {
        setState(() {});
      });
    if (widget.useAsNavigationBar == true) {}
    if (widget.controller != null) {
      widget.controller!._expendedColor = widget.collapsedColor;
      widget.controller!.expandFAB = expandFAB;
      widget.controller!.collapseFAB = closeFAB;
    }
    verifyRequestedSetting();
  }

  @override
  void dispose() {
    tweenAnimationConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _SizeConfig.init(context);
    if (widget.controller != null &&
        widget.controller!._expandedWidget == null) {}
    return GestureDetector(
      onTap: () {
        if (widget.useAsFloatingActionButton == true) {
          if (widget.onFloatingActionButtonTapped == null) {
            print('\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "onFloatingActionButtonTapped" was not defined by you; please initialize it on the constructor' +
                '\n==[Indication]==\nWhen the parameter "useAsFloatingActionButton" is set to true, "onFloatingActionButtonTapped" must be defined and not be null');
          } else {
            if (widget.showLogs == true) {
              print('AdvFab: FloatingActionButton pressed');
              print(
                  'AdvFab: calling the method "onFloatingActionButtonTapped"');
            }
            if (widget.controller!.isCollapsed == true) {
              widget.onFloatingActionButtonTapped!();
            } else {
              if (widget.showLogs == true) {
                print(
                    'AdvFab: cannot perform tapped action\nReason: When the FAB is expanded no action gets performed until it gets collapsed');
              }
            }
          }
        }
      },
      child: SafeArea(
        child: Padding(
          padding: widget.useAsNavigationBar
              ? EdgeInsets.only(left: 9, right: 9)
              : EdgeInsets.all(0),
          child: AnimatedContainer(
            curve: widget.controller!.isCollapsed
                ? widget.expandingAnimationCurve
                : widget.collapsingAnimationCurve,
            duration: widget.animationDuration,
            width: // we check first if we have to use icons , if yes
                widget.useAsNavigationBar
                    ? (MediaQuery.of(context).size.width / 100) *
                        89 // we want the size of the Navigation Bar to be fixed
                    :
                    //if no , we check if we need to use circular shape , is yes we also check if we are expanding
                    widget.useAsFloatingActionButton
                        ? isExpanding
                            ? (MediaQuery.of(context).size.width / 100) *
                                widget.floatingActionButtonExpendedWidth
                            : (MediaQuery.of(context).size.width / 100) * 16.65
                        :
                        //if no, we check if the spacebar has to be used
                        widget.useAsFloatingSpaceBar
                            ? (MediaQuery.of(context).size.width / 100) *
                                widget.floatingSpaceBarContainerWidth
                            : (MediaQuery.of(context).size.width / 100) *
                                widget.floatingSpaceBarContainerWidth,
            height: isExpanding
                ? (MediaQuery.of(context).size.height / 100) *
                    widget.controller!._heightToExpandTo
                : (MediaQuery.of(context).size.height / 100) * 7.5,
            decoration: BoxDecoration(
                color: animatedColor.value,
                borderRadius: widget.useAsNavigationBar
                    ? BorderRadius.circular(40)
                    : isExpanding
                        ? BorderRadius.circular(40)
                        : BorderRadius.circular(60),
                boxShadow: widget.useElevation
                    ? [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 4.5,
                            spreadRadius: 1.4)
                      ]
                    : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: isExpanded
                    ? widget.controller!._expendedContainerMainAxisAlignment!
                    : MainAxisAlignment.center,
                crossAxisAlignment: isExpanded
                    ? widget.controller!._expendedContainerCrossAxisAlignment!
                    : CrossAxisAlignment.center,
                children: <Widget>[
                  // 1st the Icons :)
                  isExpanded
                      ? SizedBox()
                      : AnimatedOpacity(
                          opacity: expandedIconOpacity,
                          duration: widget.animationDuration,
                          child: widget.useAsNavigationBar
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                      for (var i = 0; i < 4; i++)
                                        new _AdvFabNavigationBarIconBuilder(
                                          isSelected: selectedIconIndex == i,
                                          icon: widget
                                              .navigationBarIcons![i].icon,
                                          title: widget
                                              .navigationBarIcons![i].title,
                                          selectedColor: widget
                                              .navigationBarIconActiveColor,
                                          unselectedColor: widget
                                              .navigationBarIconInactiveColor,
                                          onTap: () {
                                            widget.navigationBarIcons![i]
                                                .onTap();

                                            if (widget.showLogs == true) {
                                              print(
                                                  'AdvFab: The bottom bar button at index ' +
                                                      i.toString() +
                                                      ' tapped');
                                            }
                                            onNavigatorIconTapped(i);
                                            widget.controller!._switchTab();
                                          },
                                        )
                                    ])
                              : widget.useAsFloatingSpaceBar
                                  ? widget.spaceBarWidget
                                  : widget.useAsFloatingActionButton
                                      ? Center(
                                          child: Icon(
                                            widget.floatingActionButtonIcon,
                                            color: widget
                                                .floatingActionButtonIconColor,
                                            size: _SizeConfig
                                                    .safeBlockHorizontal *
                                                10,
                                          ),
                                        )
                                      : Center(
                                          child: Icon(
                                            Icons.warning,
                                            color: Colors.red,
                                          ),
                                        ),
                        ),

                  // now if expanded
                  isExpanded
                      ? AnimatedOpacity(
                          opacity: expandedChildOpacityValue,
                          duration: Duration(milliseconds: 230),
                          child: widget.controller!._expandedWidget,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void expandFAB() async {
    if (widget.showLogs == true) {
      print('AdvFab: Checking initial expanded widget configuration ');
    }
    if (widget.controller!._expendedContainerCrossAxisAlignment == null ||
        widget.controller!._expendedContainerMainAxisAlignment == null) {
      print('\n==[WRONG CONFIGURATION ERROR]==\n"setExpandedWidgetConfiguration" of "AdvFabController"has to be called at least once during the lifetime of your application' +
          '\n==[Indication]==\nCall AdvFabController.setExpandedWidgetConfiguration(<<configure widget here>>) to tell the AdvFab wich widget shall be displayed once it is expanded\n' +
          'Then call the method "expandFAB" again');

      return null;
    }
    if (widget.showLogs == true) {
      print('AdvFab: Trying to perfom expansion');
      print('AdvFab: Awaiting for a color change (if any)');
    }
    await changeTweenColor();
    if (widget.showLogs == true) {
      print('AdvFab: color change awaited successfully');
      print('AdvFab: performing expansion');
    }
    await startExpanding().then((value) {
      Future.delayed(widget.animationDuration, () {
        isExpanded = true;

        if (mounted) {
          setState(() {});
        }
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            expandedChildOpacityValue = 1;
          });
          widget.controller!.isCollapsed = false;
        });
        if (mounted) {
          setState(() {});
        }
      });
    });
    if (widget.showLogs == true) {
      print('AdvFab: widget expanded successfully');
    }
  }

  void closeFAB() async {
    if (widget.showLogs == true) {
      print('AdvFab: Trying to perfom collapse ');
      print('AdvFab: Awaiting for a color change (if any)');
      print('AdvFab: Collapsing');
    }
    await collapseFAB().then((value) {
      Future.delayed(widget.animationDuration, () {
        isExpanding = false;
        isExpanded = false;
        tweenAnimationConroller.reverse().then((value) {
          if (mounted) {
            setState(() {});
          }
          Future.delayed(Duration(milliseconds: 200), () {
            setState(() {
              expandedChildOpacityValue = 0;
              expandedIconOpacity = 1;
              widget.controller!.isCollapsed = true;
            });
          });
        });
      });
    });
    if (widget.showLogs == true) {
      print('AdvFab: Widget collapsed successfully');
    }
  }

  // to animate the color transition
  Future<ColorTween?> changeTweenColor() async {
    colorTween = ColorTween(
        begin: widget.collapsedColor,
        end: widget.controller!._expendedColor ?? widget.collapsedColor);
    animatedColor = colorTween!.animate(tweenAnimationConroller)
      ..addListener(() {
        setState(() {});
      });
    if (widget.showLogs == true) {
      print('AdvFab: background Color changed ');
    }
    return colorTween;
  }

  // this is to handle the animation collapse
  Future<bool> collapseFAB() async {
    if (widget.showLogs == true) {
      print(
          'AdvFab: Colors reversed (if no color was specified by you, then default value were applied)');
    }
    if (mounted) {
      setState(() {
        expandedChildOpacityValue = 0;
        // expandedIconOpacity = 1;
      });
    }
    //tweenAnimationConroller.reverse();
    return isExpanding;
  }

  //this is to handle the animation expansion
  Future<bool> startExpanding() async {
    isExpanding = true;
    expandedIconOpacity = 0;
    tweenAnimationConroller.forward();
    if (mounted) {
      setState(() {});
    }
    return isExpanding;
  }

  //this is to handle the navigation bar button
  int onNavigatorIconTapped(int index) {
    _sharedIndex = index;
    selectedIconIndex = _sharedIndex;

    if (mounted) setState(() {});
    return index;
  }

//Handle the verification of the right setting
  void verifyRequestedSetting() {
    if (widget.useAsFloatingActionButton == true &&
        widget.useAsFloatingSpaceBar == true &&
        widget.useAsNavigationBar == true) {
      print('\n==[WRONG CONFIGURATION ERROR]==\nThe parameters "useAsFloatingActionButton", "useFloatingSpaceBar" and "useNavigationbar" are all set to true ' +
          '\n==[Indication]==\nSet only one of these paramaters to true and the rest to false');
    }
    if (widget.useAsFloatingActionButton == false &&
        widget.useAsFloatingSpaceBar == false &&
        widget.useAsNavigationBar == false) {}

    if (widget.useAsFloatingActionButton == true) {
      if (widget.onFloatingActionButtonTapped == null) {
        // the floating action button is selected but this argument is not specified
        // do ou need
        print('\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "onFloatingActionButtonTapped" was not defined by you; please initialize it on the constructor' +
            '\n==[Indication]==\nWhen the parameter "useAsFloatingActionButton " is set to true, "onFloatingActionButtonTapped " must be defined and not be null');
      }
    }
    if (widget.useAsNavigationBar == true) {
      if (widget.navigationBarIcons == null) {
        // you are trying to use the navigator bar , but there is no navigation bar icons
        print('\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "navigationBarIcons" was not defined by you; please initialize it on the constructor' +
            '\n==[Indication]==\nWhen the parameter "useNavigationBar" is set to true, "navigationBarIcons" must be defined and not be null ');
      }
    }
    if (widget.useAsFloatingSpaceBar == true) {
      if (widget.spaceBarWidget == null) {
        // you did set a floating spacebar , without a widget inside of it
        print('\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "spacebarWidget" was not defined by you; please initialize it on the constructor' +
            '\n==[Indication]==\nWhen the parameter "useFloatingSpaceBar" is set to true, "spacebarWidget" must be defined and not be null ');
      }
    }
  }
}

///Use this only if you are planning to use AdvFab
///as a navigation bar
class AdvFabBottomBarBody extends StatefulWidget {
  ///Put the screens of the bottom navigation bar here
  final List<Widget> screens;

  ///The initial index of the bottom navigation item
  final int initialIndex;

  ///Use this controller to switch tabs
  final AdvFabController controller;

  const AdvFabBottomBarBody(
      {Key? key,
      required this.screens,
      this.initialIndex = 0,
      required this.controller})
      : super(key: key);

  @override
  _AdvFabBottomBarBodyState createState() => _AdvFabBottomBarBodyState();
}

class _AdvFabBottomBarBodyState extends State<AdvFabBottomBarBody> {
  @override
  void initState() {
    super.initState();
    _sharedIndex = widget.initialIndex;
    widget.controller._switchTab = rebuild;
  }

  void rebuild() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
        child: widget.screens[_sharedIndex!], bucket: PageStorageBucket());
  }
}

///This is the icon to be given to the AdvFabNavigationBarIcon
///the parameter [onTap] is optional
class AdvFabNavigationBarIcon extends StatefulWidget {
  final String title;
  final IconData icon;

  ///this is optional in case you want to perform some actions
  /// when the tab is switched
  /// example: you can play a song
  final Function onTap;
  const AdvFabNavigationBarIcon({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  @override
  _AdvFabNavigationBarIconState createState() =>
      _AdvFabNavigationBarIconState();
}

class _AdvFabNavigationBarIconState extends State<AdvFabNavigationBarIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

///This is private, it is the icon Builder
class _AdvFabNavigationBarIconBuilder extends StatefulWidget {
  final bool? isSelected;
  final int? index;
  final IconData? icon;
  final String? title;
  final Function? onTap;
  final Color? selectedColor;
  final Color? unselectedColor;

  const _AdvFabNavigationBarIconBuilder(
      {Key? key,
      this.isSelected,
      this.icon,
      this.title,
      this.onTap,
      this.selectedColor,
      this.unselectedColor,
      this.index})
      : super(key: key);
  @override
  __AdvFabNavigationBarIconBuilderState createState() =>
      __AdvFabNavigationBarIconBuilderState();
}

class __AdvFabNavigationBarIconBuilderState
    extends State<_AdvFabNavigationBarIconBuilder> {
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
        // if (widget.AdvFabController.selectedNavigationBarIndex == widget.index)
        // {
        //   print('We are progressing');
        // }
        setState(() {
          //if(widget.index == )
        });
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isSelected!
                  ? widget.selectedColor
                  : widget.unselectedColor,
            ),
            Text(
              widget.title!,
              style: TextStyle(
                color: widget.isSelected!
                    ? widget.selectedColor
                    : widget.unselectedColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

///======= [The size config of the code]
///Another work in progress
///Originally adapted from the DevCam developper
/// but i made some changes to make it feel my needs better
class _SizeConfig {
  static late MediaQueryData _mediaQueryData;

  ///this is the width of the screen
  static late double screenWidth;

  //for my internal use
  static late double _safeAreaHorizontal;

  /// This is 1% of the screen on the horizontal by considering the safe Area
  static late double safeBlockHorizontal;

  ///Use this Only once inside the build method, preferably on the 1st screen and never call it again during the life time of your app
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
  }
}

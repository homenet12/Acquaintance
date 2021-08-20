import 'package:acquaintance/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HelpPageState();
}

// ------------------ Custom config ------------------
class HelpPageState extends State<HelpPage> {
  final GlobalKey<IntroductionScreenState> _introKey =
      GlobalKey<IntroductionScreenState>();
  List<PageViewModel> pages = [];

  @override
  initState() {
    super.initState();
    pages.add(pageView("학습", "블록코딩을 이용하여 더욱 쉽고 재미있게 풀어보세요.",
        Image.asset("images/intro_screen1.PNG")));
    pages.add(pageView("대결", "다른 사용자와 대결하여 랭킹을 올려보세요.",
        Image.asset("images/intro_screen2.PNG")));
    pages.add(pageView("피드백", "전문적인 피드백으로 취약점을 확실히 잡아보세요.",
        Image.asset("images/intro_screen3.PNG")));
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MainPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 550]) {
    return Image.asset('images/$assetName', width: width);
  }

  pageView(String title, String body, Widget image) {
    return PageViewModel(
      title: title,
      image: image,
      body: body,
      reverse: true,
      decoration: PageDecoration(
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.topCenter,
        titleTextStyle: TextStyle(
          fontFamily: "Youth",
          fontSize: 25,
        ),
        bodyTextStyle: TextStyle(
          fontFamily: "Youth",
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: _introKey,
        globalBackgroundColor: Colors.white,
        pages: pages,
        globalFooter: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff519CFE), Color(0xff8DA1FE), Color(0xffC291FE)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.2, 0.5, 1.0],
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                print("시작하기");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "시작하기",
                  style: TextStyle(
                    fontFamily: "Youth",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,

        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(12.0, 12.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}

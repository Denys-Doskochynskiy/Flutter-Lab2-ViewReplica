import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
  runApp(MyApp());
  });
}

var marginDivider = 1;
double orientationWidth = 1;
double orientationHeight = 1;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Widget _imageContainerStart(BuildContext context, String link, String gameName,
    String gameShortDescription) {
  var phoneSize = MediaQuery.of(context).size;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    orientationWidth = 0.9;
    orientationHeight = 1.24;
    marginDivider = 2;
  }
  return Container(
      width: phoneSize.width * 0.83 * orientationWidth,
      height: phoneSize.height * 0.45 * orientationHeight,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.5)),
          image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
      child: Container(
        margin: EdgeInsets.only(
            left: 12.0, right: 17.0, top: 140.0 / marginDivider),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  gameName,
                  style:
                      const TextStyle(fontSize: 42, color: Color(0xFFf2f2f2)),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  gameShortDescription,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xFFf2f2f2)),
                )),
          ],
        ),
      ));
}

Widget _imageContainerSecond(BuildContext context, String link, String gameName,
    String gameShortDescription) {
  var phoneSize = MediaQuery.of(context).size;
  if (gameName.length > 9) {
    gameName = gameName.substring(0, 9) + "...";
  }
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    orientationWidth = 0.8;
  }
  return Container(
    margin:
        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
    child: Column(children: [
      Container(
        width: phoneSize.width * orientationWidth * 0.83 * 1.2 / 5,
        height: phoneSize.width * orientationWidth * 0.83 * 1.2 / 5,
        margin: const EdgeInsets.only(
            left: 28.0, right: 28.0, top: 2.0, bottom: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.indigo, //kHintColor, so this should be changed?
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
      ),
      Row(children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              gameName,
              style: const TextStyle(fontSize: 18, color: Color(0xFFf2f2f2)),
            )),
        const Icon(
          Icons.verified,
          size: 18,
          color: Color(0xFFf2f2f2),
        )
      ]),
    ]),
  );
}

Widget _imageContainerThird(BuildContext context, String link) {
  var phoneSize = MediaQuery.of(context).size;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    orientationWidth = 0.7;
    orientationHeight = 2.1;
    marginDivider = 2;
  }
  return Container(
    width: phoneSize.width * 0.42 * orientationWidth,
    height: phoneSize.height * 0.23 * orientationHeight,
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.5)),
        image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
  );
}

Widget _textContainer(
    BuildContext context, String mainText, String secondText) {
  return Container(
    margin: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        Text(
          mainText,
          style: const TextStyle(fontSize: 23, color: Color(0xFFf2f2f2)),
        ),
        Text(
          secondText,
          style: const TextStyle(fontSize: 12, color: Color(0xFFf2f2f2)),
        )
      ],
    ),
  );
}

Widget _iconBottom(BuildContext context, IconData icon, double height) {
  return Icon(
    icon,
    size: height * 0.055,
    color: Color(0xFFf2f2f2),
  );
}

Widget _iconAppBar(BuildContext context, String icon, double width) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    orientationWidth = 0.4;

  }
  return Container(
    margin: const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    height: width * 0.125*orientationWidth,
    width: width * 0.125*orientationWidth,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
  );
}

class _HomePageState extends State<HomePage> {
  Widget _horizontalListMain(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            _imageContainerStart(context, 'assets/img_1.png',
                "Need for Speed™ Payback", "Jump back in"),
            _imageContainerStart(context, 'assets/img.png', "Minecraft",
                "Explore the wonderful world of adventures"),
            _imageContainerStart(context, 'assets/img_5.png', "Fallout 76",
                "War... War never changes... "),
            _imageContainerStart(context, 'assets/img_6.png', "Мор",
                'Everyone says: "Impossible, impossible, impossible ..." What if it works out?'),
          ]),
        ),
      ),
    ]);
  }

  Widget _horizontalListCircule(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            _imageContainerSecond(context, 'assets/img_1.png',
                "Need for Speed™ Payback", "Jump back in"),
            _imageContainerSecond(context, 'assets/img.png', "Minecraft",
                "Explore the wonderful world of adventures"),
            _imageContainerSecond(context, 'assets/img_5.png', "Fallout76",
                "War... War never changes"),
            _imageContainerSecond(context, 'assets/img_6.png', "Мор",
                'Everyone says: "Impossible, impossible, impossible ..." What if it works out?'),
          ]),
        ),
      ),
    ]);
  }

  Widget _horizontalListSmallSquare(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            _imageContainerThird(context, 'assets/img_5.png'),
            _imageContainerThird(context, 'assets/img_1.png'),
            _imageContainerThird(context, 'assets/img.png'),
            _imageContainerThird(context, 'assets/img_6.png'),
          ]),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
            height: heightDevice.height * 0.075,
            width: heightDevice.width,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconAppBar(context, "assets/img_2.png", heightDevice.width),
                  Row(
                    children: [
                      _iconAppBar(
                          context, "assets/img_3.png", heightDevice.width),
                      _iconAppBar(
                          context, "assets/img_4.png", heightDevice.width)
                    ],
                  )
                ])),
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              _horizontalListMain(context),
              _textContainer(context, "Official posts from games", ""),
              _horizontalListCircule(context),
              _textContainer(context, "Jump back in", ""),
              _horizontalListSmallSquare(context),
              _textContainer(context, "Recommended from Game Pass", ""),
              _horizontalListSmallSquare(context),
              _textContainer(context, "Popular on Xbox", ""),
              _horizontalListSmallSquare(context),
            ],
          ),
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      bottomNavigationBar: BottomAppBar(
        color: CupertinoColors.darkBackgroundGray,
        child: Container(
            height: heightDevice.height * 0.075,
            width: heightDevice.width,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _iconBottom(context, Icons.home_filled, heightDevice.height),
                  _iconBottom(context, Icons.people_sharp, heightDevice.height),
                  _iconBottom(context, Icons.search_sharp, heightDevice.height),
                  _iconBottom(
                      context, Icons.storage_rounded, heightDevice.height),
                  _iconBottom(context, Icons.supervised_user_circle,
                      heightDevice.height),
                ])),
      ),
    );
  }
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/service_model.dart';
import 'package:shakti/repository/service_repository.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/service_item.dart';
import 'package:shakti/ui/widgets/slider_indicator.dart';
import 'package:shakti/ui/widgets/video_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shakti/ui/widgets/widgets.dart';
import 'package:translator/translator.dart';
import '../../route/route.dart' as route;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  Future<void> translate(String string) async {
    final translator = GoogleTranslator();

    await translator.translate(string, to: 'hi').then((value) => setState(() {
          pageTitle = value.text;
        }));
  }

  @override
  void initState() {
    translate(pageTitle);
    super.initState();
  }

  String pageTitle = "Shakti Ward 141";
  int _current = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pageTitle,
                          style: AppStyle.pageTitleStyle,
                        ),
                        const Text(
                          "How can we help you?",
                          style: AppStyle.captionStyle,
                        ),
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Icon(
                    Icons.logout,
                    color: MyColor.primary,
                    size: 32,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imageSliders,
            ),
            Center(
              child: DotsIndicator(
                mainAxisAlignment: MainAxisAlignment.center,
                dotsCount: imageSliders.length,
                position: _current.toDouble(),
                decorator: const DotsDecorator(
                    color: Colors.black87, // Inactive color
                    activeColor: MyColor.primary,
                    spacing: EdgeInsets.all(2.0)),
              ),
            ),
            const Text(
              "Choose a service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
                future: ServiceRepository.getServices(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ServiceItem(
                              serviceModel: snapshot.data[index],
                              onItemClick: (value) {
                                switch (value) {
                                  case "1":
                                    {
                                      // request document
                                      Navigator.pushNamed(
                                          context, route.requestDocument,
                                          arguments: "");
                                    }
                                    break;
                                  case "2":
                                    Navigator.pushNamed(
                                        context, route.governmentSchemeDetail,
                                        arguments: "");
                                    break;
                                  case "3":
                                    Navigator.pushNamed(
                                        context, route.requestService,
                                        arguments: "Cleanliness");
                                    break;
                                  case "4":
                                    Navigator.pushNamed(
                                        context, route.requestService,
                                        arguments: "Street Light");
                                    break;
                                  case "5":
                                    Navigator.pushNamed(
                                        context, route.requestService,
                                        arguments: "Road Repairing");
                                    break;
                                  case "6":
                                    Navigator.pushNamed(
                                        context, route.requestTuition,
                                        arguments: "");
                                    break;
                                  case "7":
                                    Navigator.pushNamed(
                                        context, route.governmentSchemeDetail,
                                        arguments: "");
                                    break;
                                  case "8":
                                  case "9":
                                  case "10":
                                  case "11":
                                  case "12":
                                  case "13":
                                  case "14":
                                    Navigator.pushNamed(
                                        context, route.requestScheme,
                                        arguments: "");
                                    break;
                                  default:
                                    {
                                      Navigator.pushNamed(
                                          context, route.requestService,
                                          arguments: "");
                                    }
                                }
                              },
                            );
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

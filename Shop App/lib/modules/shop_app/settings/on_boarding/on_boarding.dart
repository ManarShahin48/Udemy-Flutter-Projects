import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/shop_app/settings/login/login_screen.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //const OnBoarding({Key? key}) : super(key: key);
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/male.png',
        title: 'On Boarding 1 Title',
        body: 'On Boarding 1 Body'),
    BoardingModel(
        image: 'assets/images/male.png',
        title: 'On Boarding 2 Title',
        body: 'On Boarding 2 Body'),
    BoardingModel(
        image: 'assets/images/male.png',
        title: 'On Boarding 3 Title',
        body: 'On Boarding 3 Body'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  navigateAndReplacement(context, ShopLoginScreen());
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(),
                ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5.0,
                        expansionFactor: 4,
                        activeDotColor: defaultColor),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        navigateAndReplacement(context, ShopLoginScreen());
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}

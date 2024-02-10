import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const_mobile.dart';
import '../constants/const.dart';

class ExpertiseScreenMobile extends StatelessWidget {
  const ExpertiseScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Material(
      color: kBlackColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width * horizontalMainPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: height * 0.07,
          ),
          Text("Our expertise", style: kSubHeadingTextStyleMobile),
          SizedBox(
            height: height * 0.06,
          ),
          const Text(
              "Simplify and Streamline Your Business with Our Cost-Effective Android and iOS Apps, Web Development, and Graphic Design.",
              style: kParagraphTextStyle),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Web Development",
                  image: "assets/images/web_dev.png",
                  function: () {},
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Mobile Development",
                  image: "assets/images/mobile_dev.png",
                  function: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "UI/UX Design",
                  image: "assets/images/ui_ux.png",
                  function: () {},
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Graphic Design",
                  image: "assets/images/graphic.png",
                  function: () {},
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ExpertiseTile extends StatelessWidget {
  ExpertiseTile(
      {super.key,
      required this.height,
      required this.width,
      required this.name,
      required this.image,
      required this.function});
  double height;
  double width;
  String name;
  String image;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Text(name, style: kSubHeadingTextStyle.copyWith(fontSize: 18)),
        SizedBox(
          height: height * 0.015,
        ),
        // Row(
        //   children: [
        //     Text("LEARN MORE",
        //         style: kNavbarItemTextStyle.copyWith(
        //             color: kDarkBluecolor, fontSize: 12)),
        //     SizedBox(
        //       width: width * 0.01,
        //     ),
        //     Icon(
        //       Icons.arrow_forward,
        //       color: kDarkBluecolor,
        //       size: 12,
        //     )
        //   ],
        // ),
      ],
    );
  }
}

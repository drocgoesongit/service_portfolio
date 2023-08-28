// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const_mobile.dart';

import '../constants/const.dart';

class AboutUsScreenMobile extends StatelessWidget {
  const AboutUsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: kBlackColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "The last digital agency you'll ever need",
                textAlign: TextAlign.center,
                style: kSubHeadingTextStyleMobile,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: const Text(
                  "We are a team of passionate designers and developers who thrive to well design, interactive websites and apps. ",
                  style: kParagraphTextStyle,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Column(
              children: [
                AboutUsTile(
                    description:
                        "Worked with 10+ clients with 100% satisfaction rate.",
                    height: height,
                    width: width,
                    name: "10+",
                    image: "assets/images/Vector.png"),
                SizedBox(
                  height: height * 0.04,
                ),
                AboutUsTile(
                    description: "Clients spread across 3 countries.",
                    height: height,
                    width: width,
                    name: "3+",
                    image: "assets/images/globe.png"),
                SizedBox(
                  height: height * 0.04,
                ),
                AboutUsTile(
                    description: "More than 20 projects completed successfully",
                    height: height,
                    width: width,
                    name: "20+",
                    image: "assets/images/code 1.png"),
                // SizedBox(
                //   width: width * 0.04,
                // ),
                // Expanded(
                //     child: AboutUsTile(
                //         description: "",
                //         height: height,
                //         width: width,
                //         name: "",
                //         image: "assets/images/code 1.png")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsTile extends StatelessWidget {
  AboutUsTile({
    super.key,
    required this.height,
    required this.width,
    required this.name,
    required this.image,
    required this.description,
  });
  double height;
  double width;
  String name;
  String image;
  String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: height * 0.04,
                width: height * 0.04,
                child: Image.asset(image)),
            SizedBox(
              width: width * 0.05,
            ),
            Text(name,
                style: kSubHeadingTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
        SizedBox(
          height: height * 0.015,
        ),
        Text(description,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: kSubHeadingTextStyle.copyWith(
                fontSize: 18, color: kSubtleWhiteColor)),
      ],
    );
  }
}

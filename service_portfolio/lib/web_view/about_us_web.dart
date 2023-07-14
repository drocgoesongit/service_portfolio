import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';

class AboutUsScreenWeb extends StatelessWidget {
  const AboutUsScreenWeb({super.key});

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
            const Text(
              "The last digital agency you'll ever need",
              style: kSubHeadingTextStyle,
            ),
            SizedBox(
              height: height * verticalTitleContentSeparation,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: const Text(
                  "We are a team of passionate designers and developers who thrive to well design, interactive websites and apps. We work with startups and small businesses to bring their ideas to life.",
                  style: kParagraphTextStyle,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: AboutUsTile(
                        description:
                            "Worked with 10+ clients with 100% satisfaction rate.",
                        height: height,
                        width: width,
                        name: "10+",
                        image: "assets/images/Vector.png")),
                SizedBox(
                  width: width * 0.04,
                ),
                Expanded(
                    child: AboutUsTile(
                        description: "Clients spread across 3 countries.",
                        height: height,
                        width: width,
                        name: "3+",
                        image: "assets/images/globe.png")),
                SizedBox(
                  width: width * 0.04,
                ),
                Expanded(
                    child: AboutUsTile(
                        description:
                            "More than 20 projects completed successfully",
                        height: height,
                        width: width,
                        name: "20+",
                        image: "assets/images/code 1.png")),
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
            SizedBox(
              height: height * 0.1,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
                height: height * 0.04,
                width: height * 0.04,
                child: Image.asset(image)),
            SizedBox(
              width: width * 0.01,
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
            overflow: TextOverflow.ellipsis,
            style: kSubHeadingTextStyle.copyWith(
                fontSize: 18, color: kSubtleWhiteColor)),
      ],
    );
  }
}

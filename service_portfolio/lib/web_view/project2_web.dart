import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/constants/images_links.dart';

class Project2 extends StatelessWidget {
  Project2({super.key});
  final List<String> platforms = ["web", "ui/ux"];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      color: kBlackColor,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              Container(
                width: width * 0.7,
                height: height,
                child: Container(
                    color: kBlackColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: width * 0.32,
                                height: height * 0.42,
                                child: Image.network(
                                  kosmicks1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: width * 0.32,
                                height: height * 0.42,
                                child: Image.network(
                                  kosmicks2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: width * 0.32,
                                height: height * 0.42,
                                child: Image.network(
                                  kosmicks3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: width * 0.32,
                                height: height * 0.42,
                                child: Image.network(
                                  kosmicks4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Container(
                width: width * 0.3,
                height: height,
                color: kBlackColor,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.02, right: width * 0.05),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2.", style: kMainTitleTextStyle),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Kosmicks",
                          style: kSubHeadingTextStyle.copyWith(fontSize: 36),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        SizedBox(
                            height: height * 0.05,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: platforms.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ChipIcon(
                                  height: height,
                                  width: width,
                                  platform: platforms[index],
                                );
                              },
                            )),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Experience a world of trendy footwear with Kosmicks, the ultimate local shoe emporium. This UI/UX project revolves around an enticing e-commerce store specializing in branded shoes from the likes of Nike, Adidas, and more. \n\nOur design focuses on delivering a seamless, purpose-driven platform that entices customers to effortlessly explore and make their purchases. Step into style with Kosmicks.",
                          style: kParagraphTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: height * 0.1,
                                height: height * 0.1,
                                child: Image.asset("assets/images/website.png"),
                              ),
                            ),
                            // SizedBox(
                            //   width: width * 0.03,
                            // ),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(12),
                            //   child: SizedBox(
                            //     width: height * 0.1,
                            //     height: height * 0.1,
                            //     child: Image.asset("assets/images/globe.png"),
                            //   ),
                            // )
                          ],
                        )
                      ]),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ChipIcon extends StatelessWidget {
  const ChipIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.platform});
  final double height;
  final double width;
  final String platform;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.025),
            border: Border.all(color: kSubtleWhiteColor),
          ),
          child: Center(
            child: Text(
              platform,
              style: kParagraphTextStyle,
            ),
          ),
        ),
        SizedBox(
          width: height * 0.01,
        ),
      ],
    );
  }
}

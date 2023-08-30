import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/constants/images_links.dart';

class Project4 extends StatelessWidget {
  Project4({super.key});
  final List<String> platforms = ["web", "android", "ios"];

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
                                  auctify1,
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
                                  auctify2,
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
                                  auctify3,
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
                                  auctify4,
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
                        Text("1.", style: kMainTitleTextStyle),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Auctify",
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
                          "Unleash the thrill of online auctions with Auctify. Our e-auction platform replicates the excitement of real-time bidding in the virtual world. Experience the rush as products go up for bidding at scheduled times. \n\nWith each bid, the stakes rise, and users must outbid their competitors. From start to finish, Auctify brings the exhilaration of live auctions to your fingertips.",
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
                                child: Image.asset("assets/images/android.png"),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: height * 0.1,
                                height: height * 0.1,
                                child: Image.asset("assets/images/flutter.png"),
                              ),
                            )
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

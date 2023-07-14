import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';

class FooterScreenWeb extends StatelessWidget {
  const FooterScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
        color: kBlackColor,
        child: Column(
          children: [
            const Divider(
              color: kSubtleWhiteColor,
              thickness: 0.3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Question? Contact us",
                              style: kBasicHeadingTextStyle),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            shape: const StadiumBorder(),
                            color: kTealColor,
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.02,
                                horizontal: width * 0.02),
                            child: Text(
                              "Get a quote",
                              style: kSubHeadingTextStyle.copyWith(
                                  color: kBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: width * 0.05,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("SERVICES", style: kFooterTitleTextStyle),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            "Web Development",
                            style: kFooterTextStyle,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            "Mobile Development",
                            style: kFooterTextStyle,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            "UI/UX Design",
                            style: kFooterTextStyle,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            "Branding",
                            style: kFooterTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("CONNECT", style: kFooterTitleTextStyle),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: kSubtleWhiteColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt_rounded),
                                color: kSubtleWhiteColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chat_bubble),
                                color: kSubtleWhiteColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.play_arrow_rounded),
                                color: kSubtleWhiteColor,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "© 2021 Service Portfolio. All rights reserved.",
                    style: kFooterTextStyle.copyWith(
                        fontSize: 12, color: kSubtleWhiteColor),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

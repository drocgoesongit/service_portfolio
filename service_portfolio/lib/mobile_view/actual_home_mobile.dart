import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/constants/const_mobile.dart';

class ActualHomeScreenMobile extends StatelessWidget {
  const ActualHomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        width: width,
        height: height * 0.9,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/service_background.png"),
                fit: BoxFit.fitHeight)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // padding

              // logo
              RichText(
                text: TextSpan(
                    text: "ABC ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter"),
                    children: [
                      TextSpan(
                          text: "ART",
                          style: TextStyle(
                              color: kTealColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter"))
                    ]),
              ),

              SizedBox(
                height: height * 0.05,
              ),
              // tagline
              RichText(
                  text: TextSpan(
                      text: "WE\nBUILD\n",
                      style: kMainTitleTextStyleMobile,
                      children: [
                    TextSpan(
                        text: "MOBILE/\nWEBSITE\n",
                        style: kMainTitleTextStyleMobile.copyWith(
                            color: kTealColor)),
                    TextSpan(
                        text: "DIGITAL\nEXPERIENCES",
                        style: kMainTitleTextStyleMobile)
                  ])),
              // Text(
              //   "WE\nBUILD\nMOBILE/\nWEBSITE\nDIGITAL\nEXPERIENCES",
              //   style: kMainTitleTextStyleMobile,
              // ),
              SizedBox(
                height: height * 0.06,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEBSITE", style: kSubtitleTextStyleMobile),
                  Container(
                    width: 30,
                    height: 16,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: kTealColor,
                        radius: 3,
                      ),
                    ),
                  ),
                  Text("BRANDING", style: kSubtitleTextStyleMobile),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("MOBILE APPS", style: kSubtitleTextStyleMobile),
              ),
              SizedBox(
                height: height * 0.02,
              )
              //services
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:service_portfolio/extensions/alert_dialog_glassmorphic.dart';
import 'package:service_portfolio/extensions/hover_extension.dart';

import '../constants/const.dart';

class HomeScreenMainWeb extends StatefulWidget {
  HomeScreenMainWeb(
      {required this.toAbout,
      required this.toService,
      required this.toProject,
      required this.toHome,
      required this.toBlogs,
      required this.toTestimonial,
      required this.toContact});

  final Function toAbout;
  final Function toService;
  final Function toProject;
  final Function toHome;
  final Function toBlogs;
  final Function toTestimonial;
  final Function toContact;

  @override
  State<HomeScreenMainWeb> createState() => _HomeScreenMainWebState();
}

class _HomeScreenMainWebState extends State<HomeScreenMainWeb> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      height: height * 0.8,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/service_background.png"),
              fit: BoxFit.fill)),
      child: Column(children: [
        // navbar
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            const Text("ABC ARTS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Open Sans")),
            Expanded(child: Container()),
            InkWell(
                focusColor: Colors.lightBlue,
                onTap: () {
                  widget.toHome();
                },
                mouseCursor: SystemMouseCursors.click,
                child: const Text("Home", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            InkWell(
                onTap: () {
                  widget.toAbout();
                },
                mouseCursor: SystemMouseCursors.click,
                child: const Text("About", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            GestureDetector(
                onTap: () {
                  widget.toService();
                },
                child: const Text("Services", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            GestureDetector(
                onTap: () => widget.toContact(),
                child: const Text("Contact", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            GestureDetector(
                onTap: () => widget.toBlogs(),
                child: const Text("Blogs", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            GestureDetector(
                onTap: () => widget.toProject(),
                child: const Text("projects", style: kNavbarItemTextStyle)),
            SizedBox(width: width * 0.02),
            MaterialButton(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.02),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return GlassmorphicAlertDialog();
                      });
                },
                color: kTealColor,
                shape: const StadiumBorder(),
                child: Text("Contact us",
                    style: kNavbarItemTextStyle.copyWith(
                        color: kBlackColor, fontWeight: FontWeight.w700))),
          ],
        ),

        // padding
        SizedBox(
          height: height * 0.08,
        ),

        // logo
        RichText(
          text: const TextSpan(
              text: "ABC ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Open Sans"),
              children: [
                TextSpan(
                    text: "ART",
                    style: TextStyle(
                        color: kTealColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Open Sans"))
              ]),
        ),

        SizedBox(
          height: height * 0.08,
        ),
        // tagline
        Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Image.asset('assets/images/main_title_text.png'))),
        SizedBox(
          height: height * 0.06,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("WEBSITE", style: kSubtitleTextStyle),
            Container(
              width: 30,
              height: 16,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: kTealColor,
                  radius: 3,
                ),
              ),
            ),
            const Text("UI/UX", style: kSubtitleTextStyle),
            Container(
              width: 30,
              height: 16,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: kTealColor,
                  radius: 3,
                ),
              ),
            ),
            const Text("MOBILE APPS", style: kSubtitleTextStyle),
          ],
        ),
        SizedBox(
          height: height * 0.08,
        )
        //services
      ]),
    );
  }
}

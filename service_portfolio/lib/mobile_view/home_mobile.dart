import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/mobile_view/about_us_mobile.dart';
import 'package:service_portfolio/mobile_view/actual_home_mobile.dart';
import 'package:service_portfolio/mobile_view/blog_mobile.dart';
import 'package:service_portfolio/mobile_view/contact_us_mobile.dart';
import 'package:service_portfolio/mobile_view/expertise_mobile.dart';
import 'package:service_portfolio/mobile_view/footer_mobile.dart';
import 'package:service_portfolio/mobile_view/projects_mobile.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HOmeMobile called");
  }

  final ItemScrollController _scrollController = ItemScrollController();
  final scrollController = ScrollController();

  void toHome() {
    setState(() {
      _scrollController.scrollTo(
          index: 0, duration: const Duration(milliseconds: 500));
    });
  }

  void toAbout() {
    setState(() {
      _scrollController.scrollTo(
          index: 2, duration: const Duration(milliseconds: 500));
    });
  }

  void toTestimonial() {
    setState(() {
      _scrollController.scrollTo(
          index: 2, duration: const Duration(milliseconds: 500));
    });
  }

  void toContact() {
    setState(() {
      _scrollController.scrollTo(
          index: 3, duration: const Duration(milliseconds: 500));
    });
  }

  void toService() {
    setState(() {
      _scrollController.scrollTo(
          index: 1, duration: const Duration(milliseconds: 500));
    });
  }

  void toProject() {
    setState(() {
      _scrollController.scrollTo(
          index: 4, duration: const Duration(milliseconds: 500));
    });
  }

  void toBlogs() {
    setState(() {
      _scrollController.scrollTo(
          index: 5, duration: const Duration(milliseconds: 500));
    });
  }

  final _myList = [
    ExpertiseScreenMobile(),
    ExpertiseScreenMobile(),
    AboutUsScreenMobile(),
    ContactUsMobileScreen(),
    ProjectsScreenMobile(),
    BlogScreenMobile(),
    FooterScreenMobile(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: kBlackColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: height * 0.2),
          MouseRegion(
            cursor: SystemMouseCursors.contextMenu,
            child: InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  toHome();
                  Navigator.pop(context);
                },
                onHover: (value) => print(value),
                child: const Text("Home", style: kNavbarItemTextStyle)),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () {
                toAbout();
                Navigator.pop(context);
              },
              child: const Text("About", style: kNavbarItemTextStyle)),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () {
                toService();
                Navigator.pop(context);
              },
              child: const Text("Services", style: kNavbarItemTextStyle)),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () {
                toContact();
                Navigator.pop(context);
              },
              child: const Text("Contact", style: kNavbarItemTextStyle)),
          SizedBox(height: height * 0.02),
          MaterialButton(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.02),
              onPressed: () {},
              color: kTealColor,
              shape: const StadiumBorder(),
              child: Text("Contact us",
                  style: kNavbarItemTextStyle.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w700))),
        ]),
      ),
      backgroundColor: kBlackColor,
      appBar: AppBar(backgroundColor: kBlackColor, actions: [
        Center(
          child: const Text("ABC ARTS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Open Sans")),
        ),
        SizedBox(width: width * 0.04),
      ]),
      body: ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        itemCount: _myList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ActualHomeScreenMobile();
          } else {
            return _myList[index];
          }
        },
      ),
    );
  }
}

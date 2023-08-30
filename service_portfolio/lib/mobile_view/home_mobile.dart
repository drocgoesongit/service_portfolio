import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/constants/images_links.dart';
import 'package:service_portfolio/extensions/alert_dialog_glassmorphic.dart';
import 'package:service_portfolio/mobile_view/about_us_mobile.dart';
import 'package:service_portfolio/mobile_view/actual_home_mobile.dart';
import 'package:service_portfolio/mobile_view/blog_mobile.dart';
import 'package:service_portfolio/mobile_view/contact_us_mobile.dart';
import 'package:service_portfolio/mobile_view/expertise_mobile.dart';
import 'package:service_portfolio/mobile_view/footer_mobile.dart';
import 'package:service_portfolio/mobile_view/project1_mobile.dart';
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
    Project1Mobile(
      name: "Builder's Log",
      description:
          "Builders Log redefines fitness tracking for bodybuilders. This Android application isn't just a workout companion; it's your dedicated progress partner. Seamlessly log every exercise, set, and rep, and witness your fitness journey unfold. With Builders Log, each day's workout becomes a building block toward your fitness goals. \n\nBut that's not all, our app goes beyond the gym floor. Generate insightful reports spanning weeks or months, giving you an in-depth perspective on your progress and helping you make informed decisions about your workout routine.",
      iconsList: ["assets/images/flutter.png", "assets/images/android.png"],
      platforms: ["IOS", "android"],
      number: "1.",
      imageList: [bl1, bl2, bl3, bl4],
    ),
    Project1Mobile(
        name: "Kosmicks",
        platforms: ["Web", "UI/UX"],
        number: "2.",
        description:
            "Experience a world of trendy footwear with Kosmicks, the ultimate local shoe emporium. This UI/UX project revolves around an enticing e-commerce store specializing in branded shoes from the likes of Nike, Adidas, and more. \n\nOur design focuses on delivering a seamless, purpose-driven platform that entices customers to effortlessly explore and make their purchases. Step into style with Kosmicks.",
        iconsList: ["assets/images/flutter.png", "assets/images/website.png"],
        imageList: [kosmicks1, kosmicks2, kosmicks3, kosmicks4]),
    Project1Mobile(
        name: "Billable",
        platforms: ["IOS", "Android"],
        number: "3.",
        description:
            "Simplify your business operations with Billable, the comprehensive billing application designed for point-of-sale environments. With built-in product dashboards, billing monitoring, and seamless communication features, Billable streamlines the transaction process. \n\nThe QR code functionality allows for efficient barcode scanning, while integrated payment gateways enhance the shopping experience. Elevate your business with Billable's smart solutions.",
        iconsList: ["assets/images/flutter.png", "assets/images/android.png"],
        imageList: [
          billable1,
          billable2,
          billable3,
        ]),
    Project1Mobile(
        name: "Auctify",
        platforms: ["IOS", "Android"],
        number: "4.",
        description:
            "Unleash the thrill of online auctions with Auctify. Our e-auction platform replicates the excitement of real-time bidding in the virtual world. Experience the rush as products go up for bidding at scheduled times. \n\nWith each bid, the stakes rise, and users must outbid their competitors. From start to finish, Auctify brings the exhilaration of live auctions to your fingertips.",
        iconsList: ["assets/images/flutter.png", "assets/images/android.png"],
        imageList: [auctify1, auctify2, auctify3, auctify4]),
    ContactUsMobileScreen(),
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => GlassmorphicAlertDialog());
              },
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

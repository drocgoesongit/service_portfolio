import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/web_view/about_us_web.dart';
import 'package:service_portfolio/web_view/blogs_web.dart';
import 'package:service_portfolio/web_view/contact_us_web.dart';
import 'package:service_portfolio/web_view/expertise_web.dart';
import 'package:service_portfolio/web_view/footer_web.dart';
import 'package:service_portfolio/web_view/home_screen_actual_web.dart';
import 'package:service_portfolio/web_view/project1_view.dart';
import 'package:service_portfolio/web_view/project2_web.dart';
import 'package:service_portfolio/web_view/project3_web.dart';
import 'package:service_portfolio/web_view/project4_web.dart';
import 'package:service_portfolio/web_view/projects_web.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
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
          index: 1, duration: const Duration(milliseconds: 500));
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
          index: 2, duration: const Duration(milliseconds: 500));
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

  final List<Widget> _myList = [
    Project1(),
    Project1(),
    Project2(),
    Project3(),
    Project4(),
    const ExpertiseScreenWeb(),
    const AboutUsScreenWeb(),
    const ContactUsWebScreen(),
    const ProjectScreenWeb(),
    const BlogsAndArticlesScreenWeb(),
    const FooterScreenWeb(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: _myList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Builder(
            builder: (context) => HomeScreenMainWeb(
              toHome: toHome,
              toAbout: toAbout,
              toProject: toProject,
              toService: toService,
              toTestimonial: toTestimonial,
              toBlogs: toBlogs,
              toContact: toContact,
            ),
          );
        } else {
          return _myList[index];
        }
      },
    );
  }
}

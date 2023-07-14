import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';

class ProjectScreenWeb extends StatelessWidget {
  const ProjectScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
        color: kBlackColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Text("Our projects", style: kSubHeadingTextStyle),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/show_bl_2.png",
                    name: "Builders' Log - Android App",
                    description:
                        "Builders' log is an android application to log daily workouts sets and reps for better understanding of the progress and to keep track of the progress.",
                  )),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/showcase_kosmicks1.png",
                    name: "Kosmicks Website - Ecommerce project",
                    description:
                        "Kosmicks is an ecommerce website for selling the products related to all fancy shoes. It is a full fledged ecommerce website with all the features of the ecommerce website.",
                  )),
                  // SizedBox(
                  //   width: width * 0.05,
                  // ),
                  // Expanded(child: ProjectTile()),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                children: [
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/showcase_auctify2.png",
                    name: "Auctify - UI/UX Design",
                    description:
                        "Auctify is a UI/UX design for the auction website. It is a complete auctioning platform with bidding and auctioning features.",
                  )),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/showcase_abc_3.png",
                    name: "ABC ART - Website",
                    description:
                        "ABC ART is a website for the art gallery AI. It is a complete website with all the features of the art gallery website.",
                  )),
                  // SizedBox(
                  //   width: width * 0.05,
                  // ),
                  // Expanded(child: ProjectTile()),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                children: [
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/showcase_auctify2.png",
                    name: "Auctify - UI/UX Design",
                    description:
                        "Auctify is a UI/UX design for the auction website. It is a complete auctioning platform with bidding and auctioning features.",
                  )),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                      child: ProjectTile(
                    onTap: () {},
                    imagePath: "assets/images/showcase_abc_3.png",
                    name: "ABC ART - Website",
                    description:
                        "ABC ART is a website for the art gallery AI. It is a complete website with all the features of the art gallery website.",
                  )),
                  // SizedBox(
                  //   width: width * 0.05,
                  // ),
                  // Expanded(child: ProjectTile()),
                ],
              ),
              SizedBox(height: height * 0.1),
            ],
          ),
        ));
  }
}

class ProjectTile extends StatelessWidget {
  const ProjectTile(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.name,
      required this.description});
  final VoidCallback onTap;
  final String imagePath;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            child: AspectRatio(
              aspectRatio: 18 / 11,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: kSubtitleTextStyle.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(description,
            style: kSubtitleTextStyle.copyWith(
                fontSize: 16, color: kSubtleWhiteColor)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/web_view/services_detail.dart';

import '../models/project_model.dart';
import '../models/service_characteristic_model.dart';
import '../models/service_information_model.dart';

class ExpertiseScreenWeb extends StatelessWidget {
  const ExpertiseScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Material(
      color: kBlackColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width * horizontalMainPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: height * 0.1,
          ),
          Text("Our expertise", style: kSubHeadingTextStyle),
          SizedBox(
            height: height * 0.05,
          ),
          const Text(
              "Simplify and Streamline Your Business with Our Cost-Effective Android and iOS Apps, Web Development, and Graphic Design.",
              style: kParagraphTextStyle),
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            children: [
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Web Development",
                  image: "assets/images/web_dev.png",
                  function: () {
                    openWebDevelopment(context);
                  },
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Mobile Development",
                  image: "assets/images/mobile_dev.png",
                  function: () {
                    openMobileDevelopment(context);
                  },
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "UI/UX Design",
                  image: "assets/images/ui_ux.png",
                  function: () {
                    openUIUXDevelopment(context);
                  },
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Expanded(
                child: ExpertiseTile(
                  height: height,
                  width: width,
                  name: "Graphic Design",
                  image: "assets/images/graphic.png",
                  function: () {
                    openGraphicDesigning(context);
                  },
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ExpertiseTile extends StatelessWidget {
  ExpertiseTile(
      {super.key,
      required this.height,
      required this.width,
      required this.name,
      required this.image,
      required this.function});
  double height;
  double width;
  String name;
  String image;
  Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(name, style: kSubHeadingTextStyle.copyWith(fontSize: 18)),
          // SizedBox(
          //   height: height * 0.015,
          // ),
          // Row(
          //   children: [
          //     Text("LEARN MORE",
          //         style: kNavbarItemTextStyle.copyWith(
          //             color: kDarkBluecolor, fontSize: 12)),
          //     SizedBox(
          //       width: width * 0.01,
          //     ),
          //     Icon(
          //       Icons.arrow_forward,
          //       color: kDarkBluecolor,
          //       size: 12,
          //     )
          //   ],
          // ),
          SizedBox(height: height * 0.1)
        ],
      ),
    );
  }
}

void openWebDevelopment(BuildContext context) {
  print("Web Development Clicked");
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServicesDetailWeb(
          informations: ServiceInformationModel(
              name: "Web Development",
              description:
                  "Expert Web Development Solutions for Poweful Online Presence",
              imagePath: "assets/images/web_development_image.png",
              characteristics: [
                ServiceCharacteristicModel(
                    title: "Responsive",
                    description:
                        "Responsive website made adapted for all kinds of screens",
                    imagePath: "assets/images/graph.png"),
                ServiceCharacteristicModel(
                    title: "SEO",
                    description:
                        "SEO friendly website to rank higher in search engines",
                    imagePath: "assets/images/globe.png"),
              ],
              projects: [
                ProjectModel(
                    name: "Project 1",
                    description: "Project 1 description",
                    imagePath: "assets/images/web_development_image.png",
                    images: [
                      "assets/images/web_development_image.png"
                    ],
                    technologiesImagesList: [
                      "assets/images/web_development_image.png"
                    ]),
              ]),
        ),
      ));
}

void openMobileDevelopment(BuildContext context) {
  print("Mobile Development Clicked");
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServicesDetailWeb(
                informations: ServiceInformationModel(
                    name: "Mobile Development",
                    description:
                        "Expert Mobile Development Solutions for Poweful Online Presence",
                    imagePath: "assets/images/mobile.png",
                    characteristics: [
                      ServiceCharacteristicModel(
                          title: "Responsive",
                          description:
                              "Responsive website made adapted for all kinds of screens",
                          imagePath: "assets/images/graph.png"),
                      ServiceCharacteristicModel(
                          title: "SEO",
                          description:
                              "SEO friendly website to rank higher in search engines",
                          imagePath: "assets/images/globe.png"),
                    ],
                    projects: [
                      ProjectModel(
                          name: "Project 1",
                          description: "Project 1 description",
                          imagePath: "assets/images/web_development_image.png",
                          images: ["assets/images/mobile.png"],
                          technologiesImagesList: ["assets/images/mobile.png"]),
                      ProjectModel(
                          name: "Project 2",
                          description: "description",
                          imagePath: "assets/images/mobile.png",
                          images: ["assets/images/web_development_image.png"],
                          technologiesImagesList: ["assets/images/mobile.png"]),
                    ]),
              )));
}

void openUIUXDevelopment(BuildContext context) {
  print("UI/UX Development Clicked");
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServicesDetailWeb(
                informations: ServiceInformationModel(
                    name: "UI/UX Development",
                    description:
                        "Expert UI/UX Development Solutions for Poweful Online Presence",
                    imagePath: "assets/images/ui_ux.png",
                    characteristics: [
                      ServiceCharacteristicModel(
                          title: "Responsive",
                          description:
                              "Responsive website made adapted for all kinds of screens",
                          imagePath: "assets/images/graph.png"),
                      ServiceCharacteristicModel(
                          title: "SEO",
                          description:
                              "SEO friendly website to rank higher in search engines",
                          imagePath: "assets/images/globe.png"),
                    ],
                    projects: [
                      ProjectModel(
                          name: "Project 1",
                          description: "Project 1 description",
                          imagePath: "assets/images/web_development_image.png",
                          images: ["assets/images/ui_ux.png"],
                          technologiesImagesList: ["assets/images/ui_ux.png"]),
                      ProjectModel(
                          name: "Project 2",
                          description: "description",
                          imagePath: "assets/images/ui_ux.png",
                          images: ["assets/images/ui_ux.png"],
                          technologiesImagesList: ["assets/images/ui_ux.png"]),
                    ]),
              )));
}

void openGraphicDesigning(BuildContext context) {
  print("Graphic Designing Clicked");
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServicesDetailWeb(
                informations: ServiceInformationModel(
                    name: "Graphic Designing",
                    description:
                        "Expert Graphic Designing Solutions for Poweful Online Presence",
                    imagePath: "assets/images/graphic.png",
                    characteristics: [
                      ServiceCharacteristicModel(
                          title: "Responsive",
                          description:
                              "Responsive website made adapted for all kinds of screens",
                          imagePath: "assets/images/graph.png"),
                      ServiceCharacteristicModel(
                          title: "SEO",
                          description:
                              "SEO friendly website to rank higher in search engines",
                          imagePath: "assets/images/globe.png"),
                    ],
                    projects: [
                      ProjectModel(
                          name: "Project 1",
                          description: "Project 1 description",
                          imagePath: "assets/images/web_development_image.png",
                          images: [
                            "assets/images/graphic.png"
                          ],
                          technologiesImagesList: [
                            "assets/images/graphic.png"
                          ]),
                      ProjectModel(
                          name: "Project 2",
                          description: "description",
                          imagePath: "assets/images/graphic.png",
                          images: [
                            "assets/images/graphic.png"
                          ],
                          technologiesImagesList: [
                            "assets/images/graphic.png"
                          ]),
                    ]),
              )));
}

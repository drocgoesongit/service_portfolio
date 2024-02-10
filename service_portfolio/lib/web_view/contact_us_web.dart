import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';
import 'package:service_portfolio/extensions/alert_dialog_glassmorphic.dart';

class ContactUsWebScreen extends StatelessWidget {
  const ContactUsWebScreen({super.key});

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
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                    height: height * 0.2,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    color: kDarkBluecolor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "We are looking forward to start a new project",
                              style: kSubHeadingTextStyle.copyWith(
                                  fontSize: 24, color: kTealColor),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text("Let's take your business to the next level!",
                                style: kSubHeadingTextStyle.copyWith(
                                    fontSize: 34)),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return GlassmorphicAlertDialog();
                                  }));
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.03),
                            shape: const StadiumBorder(),
                            color: kTealColor,
                            child: Row(
                              children: [
                                Text("Request a call-back",
                                    style: kParagraphTextStyle.copyWith(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Icon(
                                  Icons.arrow_outward_rounded,
                                  color: kBlackColor,
                                )
                              ],
                            ))
                      ],
                    )),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              Text("WHAT CLIENTS SAY ABOUT OUR WORK",
                  style: kSubHeadingTextStyle.copyWith(
                      fontSize: 18, color: kTealColor)),
              SizedBox(
                height: height * verticalTitleContentSeparation,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClientTestimonialTile(
                        height: height,
                        width: width,
                        image: "assets/images/kia.png",
                        name: "Kia",
                        position: "CEO, FIREFLY, LOS ANGELES",
                        testimonial:
                            "Fantastic work from Nabeel! His work is amazing and understood exactly what I was trying to accomplish from the start. If you have any AI image needs, Droceth is your guy! Hire him ASAP, you won't be disappointed!"),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: ClientTestimonialTile(
                        height: height,
                        width: width,
                        image: "assets/images/person_2.png",
                        name: "Carlos Rivera",
                        position: "FOUNDER, ENTREPRENEUR",
                        testimonial: "Great work with AI"),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              )
            ],
          ),
        ));
  }
}

class ClientTestimonialTile extends StatelessWidget {
  ClientTestimonialTile(
      {super.key,
      required this.height,
      required this.width,
      required this.image,
      required this.name,
      required this.position,
      required this.testimonial});

  double height;
  double width;
  String image;
  String name;
  String position;
  String testimonial;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: kSubtitleTextStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(position, style: kParagraphTextStyle)
                ]),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Container(
          child: Text(testimonial, style: kParagraphTextStyle),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        // Row(
        //   children: [
        //     Text(
        //       "VIEW CASE",
        //       style: kParagraphTextStyle.copyWith(color: kDarkBluecolor),
        //     ),
        //     SizedBox(
        //       width: width * 0.001,
        //     ),
        //     const Icon(
        //       Icons.arrow_forward_rounded,
        //       color: kDarkBluecolor,
        //     )
        //   ],
        // )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/const.dart';

class BlogScreenMobile extends StatelessWidget {
  const BlogScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Material(
        color: kBlackColor,
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * horizontalMainPadding),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                const Text(
                  "Blogs and Articles",
                  style: kSubHeadingTextStyle,
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Blogtile(
                    image: "assets/images/blog_one.png",
                    width: width,
                    height: height,
                    name: "The Power of Prioritization",
                    description:
                        "Limiting the number of choices we have, often allows us to arrive at a decision faster and with greater conviction than when faced with a greater variety of options."),
                SizedBox(
                  height: height * 0.05,
                ),
                Blogtile(
                    image: "assets/images/blog_two.png",
                    width: width,
                    height: height,
                    name:
                        "Maximize Your Productivity with the Power of the 2-Minute Rule",
                    description:
                        "Every day, we face countless choices that can either move us closer to or further from our goals. These choices, no matter how small, can have a significant impact on our lives and habits. The 2-minute rule suggests that if we can start a task or activity, even if it’s just for a few minutes, we are more likely to see it through to completion."),
                SizedBox(
                  height: height * 0.05,
                ),
                Blogtile(
                    image: "assets/images/blog_three.png",
                    width: width,
                    height: height,
                    name:
                        "Recipe for a successful year — Make 2023 your way 🎯",
                    description:
                        "Successful year is a term that can be subjective and means different things to different people. Ultimately, a successful year is one in which an individual feels they have accomplished what they set out to do and are satisfied with their progress and achievements."),
                SizedBox(
                  height: height * 0.05,
                ),
                Blogtile(
                    image: "assets/images/blog_four.png",
                    width: width,
                    height: height,
                    name: "The Art of Choosing Your Battles Wisely",
                    description:
                        "In this post, we will be exploring the key themes and ideas presented in the book . I will be highlighting some of the most impactful quotes from each chapter and discussing their significance in greater detail. This will allow us to get a better understanding of the book as a whole, without getting bogged down in the details."),
              ],
            )));
  }
}

class Blogtile extends StatelessWidget {
  const Blogtile(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      required this.name,
      required this.description});

  final double width;
  final double height;
  final String image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            width: width * 0.3,
            height: width * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: SizedBox(
                child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kSubHeadingTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kSubHeadingTextStyle.copyWith(
                    fontSize: 12, color: kSubtleWhiteColor),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: width * 0.4,
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kTealColor),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.015, vertical: height * 0.015),
                      shape: const StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text("Read more",
                              style: kParagraphTextStyle.copyWith(
                                  color: kTealColor,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          width: width * 0.005,
                        ),
                        const Icon(
                          Icons.arrow_outward_rounded,
                          color: kTealColor,
                          size: 16,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

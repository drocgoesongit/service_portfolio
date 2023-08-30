import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';

class Project1Mobile extends StatelessWidget {
  const Project1Mobile(
      {super.key,
      required this.name,
      required this.platforms,
      required this.number,
      required this.description,
      required this.iconsList,
      required this.imageList});

  final String name;
  final List<String> platforms;
  final String number;
  final String description;
  final List<String> iconsList;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      color: kBlackColor,
      child: Container(
        width: width,
        color: Colors.white,
        child: Column(children: [
          Column(
            children: [
              Container(
                color: kBlackColor,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(number, style: kMainTitleTextStyle),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          name,
                          style: kSubHeadingTextStyle.copyWith(fontSize: 36),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        SizedBox(
                            height: height * 0.05,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: platforms.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ChipIcon(
                                  height: height,
                                  width: width,
                                  platform: platforms[index],
                                );
                              },
                            )),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          description,
                          style: kParagraphTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        SizedBox(
                            height: height * 0.07,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: iconsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        width: height * 0.05,
                                        height: height * 0.05,
                                        child: Image.asset(iconsList[index]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                  ]);
                                }))),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        ListView.builder(
                          itemCount: imageList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: width * 0.9,
                                    height: width * 0.5,
                                    child: Image.network(
                                      imageList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                      ]),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class ChipIcon extends StatelessWidget {
  const ChipIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.platform});
  final double height;
  final double width;
  final String platform;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.025),
            border: Border.all(color: kSubtleWhiteColor),
          ),
          child: Center(
            child: Text(
              platform,
              style: kParagraphTextStyle,
            ),
          ),
        ),
        SizedBox(
          width: height * 0.01,
        ),
      ],
    );
  }
}

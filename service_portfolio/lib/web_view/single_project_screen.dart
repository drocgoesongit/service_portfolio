import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../models/project_screen_model.dart';
import '../models/service_characteristic_model.dart';

class SingleProjectScreen extends StatelessWidget {
  const SingleProjectScreen({super.key, required this.informations});
  final ProjectScreenModel informations;

  @override
  Widget build(BuildContext context) {
    final List<ServiceCharacteristicModel> characteristicList =
        informations.characteristics;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      color: kBlackColor,
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            // top row containing type info with image and then expanded and then
            // contact us button
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.2,
                  child: Image.asset(
                    informations.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  width: width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        informations.title,
                        style: kBasicHeadingTextStyle.copyWith(fontSize: 30),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        informations.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kParagraphTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: kTealColor,
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                      horizontal: height * 0.05, vertical: height * 0.03),
                  child: Row(
                    children: [
                      Text(
                        "Contact Us",
                        style: kButtonTextStyle,
                      ),
                      SizedBox(
                        width: height * 0.02,
                      ),
                      const Icon(
                        Icons.arrow_outward_rounded,
                        color: kBlackColor,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),

            // and then list of characteristics of this service
            SizedBox(
              height: height * 0.07,
            ),
            SizedBox(
              height: height * 0.27,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: informations.characteristics.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                      child: Container(
                        margin: EdgeInsets.only(right: height * 0.03),
                        padding: EdgeInsets.all(height * 0.03),
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: kBlackColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: kTealColor, width: 0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                  characteristicList[index].imagePath),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Text(
                              characteristicList[index].title,
                              style: kBasicHeadingTextStyle,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              characteristicList[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kParagraphTextStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            // and then list of projects done in this service and other images grid list.
            Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Projects Gallery",
                  style: kSubHeadingTextStyle.copyWith(fontSize: 24),
                )),

            SizedBox(
              height: height * 0.03,
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: informations.projectImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: height * 0.05,
                mainAxisSpacing: height * 0.03,
              ),
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kBlackColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  informations.projectImages[index],
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

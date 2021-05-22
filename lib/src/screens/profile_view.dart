import 'package:flutter/material.dart';
import 'package:masters_india_test/src/models/gst_profile.dart';
import 'package:masters_india_test/src/utils/constants.dart';
import 'package:masters_india_test/src/utils/size_config.dart';

class GstProfileView extends StatelessWidget {
  final GstProfile gst_profile;

  GstProfileView({this.gst_profile});
  var size = SizeConfig();

  @override
  Widget build(BuildContext context) {
    size.init(context);
    print(SizeConfig.screenWidth - 30);
    return Scaffold(
      body: Column(
        children: [
          //for banner
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${gst_profile.name}'s GST Profile ",
                        style: kPrimaryTextStyle,
                      )
                    ],
                  ),
                  Text(
                    'GSTIN of the Tax Payer',
                    style: TextStyle(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(gst_profile.gstin, style: kPrimaryTextStyle),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Master India Private Limited",
                      style: kPrimaryTextStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: kMainColor, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              gst_profile.status,
                              style: TextStyle(color: kMainColor),
                            ),
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  )
                ],
              ),
            ),
          ),
          // for middle information display
          Flexible(
            flex: 6,
            child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // address of the user
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.room,
                                  color: kMainColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Principal place of Business",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                gst_profile.address,
                                style: kSubTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(Icons.account_balance, color: kMainColor),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Principal place of Business",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Floor",
                                style: kSubTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // taxplayer typr

                    Container(
                      width: SizeConfig.screenWidth - 30,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCard(
                              title: "State Juridiction",
                              subtitle: "Ward 74",
                            ),
                            CustomCard(
                              title: "Center Juridiction",
                              subtitle: "Ranger 74",
                            ),
                            CustomCard(
                              title: "TaxPayer Type",
                              subtitle: gst_profile.taxpayerType,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //bussiness type
                    Container(
                      width: double.infinity,
                      child: CustomCard(
                        title: "Constitution of Business",
                        subtitle: gst_profile.businessType,
                      ),
                    ),
                    // dates to display
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Date of Registration",
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  gst_profile.dataRagistration,
                                  style: kSubTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Date of Cancelation ",
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " - ",
                                  style: kSubTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          // for button
          Container(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 2),
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Get Return Filling Sttus"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({
    this.subtitle,
    this.title,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kTitleTextStyle, overflow: TextOverflow.fade),
            SizedBox(
              height: 10,
            ),
            Text(subtitle, style: kSubTextStyle, overflow: TextOverflow.fade),
          ],
        ),
      ),
    );
  }
}

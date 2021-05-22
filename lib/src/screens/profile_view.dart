import 'package:flutter/material.dart';
import 'package:masters_india_test/src/models/gst_profile.dart';
import 'package:masters_india_test/src/utils/constants.dart';

class GstProfileView extends StatelessWidget {
  final GstProfile gst_profile;

  GstProfileView({this.gst_profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
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
                    height: 20,
                  ),
                  Text("Master India Private Limited",
                      style: kPrimaryTextStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: kMainColor, shape: BoxShape.circle),
                        ),
                        Text(
                          gst_profile.status,
                          style: TextStyle(color: kMainColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Row(
                      children: [
                        CustomCard(
                          title: "State Juridiction",
                          subtitle: " Ward 74",
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
                    Container(
                      width: double.infinity,
                      child: CustomCard(
                        title: "Constitution of Business",
                        subtitle: gst_profile.businessType,
                      ),
                    ),
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
            Text(
              title,
              style: kTitleTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: kSubTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

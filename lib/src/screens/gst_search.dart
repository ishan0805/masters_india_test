import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../constants.dart';

class GstSearch extends StatefulWidget {
  GstSearch({Key key}) : super(key: key);

  @override
  _GstSearchState createState() => _GstSearchState();
}

class _GstSearchState extends State<GstSearch> {
  int gstNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Select the type for',
                    style: kSecondaryTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('GST Number Search Tool', style: kPrimaryTextStyle),
                  SizedBox(
                    height: 20,
                  ),
                  FlutterToggleTab(
                    isScroll: false,
                    marginSelected: EdgeInsets.all(2),
                    selectedBackgroundColors: [Colors.white],
                    unSelectedBackgroundColors: [Color(0xFF26884a)],
                    borderRadius: 25,
                    initialIndex: gstNumber,
                    selectedTextStyle: TextStyle(
                        color: kMainColor, fontWeight: FontWeight.w600),
                    unSelectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    labels: ["Search Gst Number", "GST Return Status"],
                    selectedLabelIndex: (index) {
                      setState(() {
                        gstNumber = index;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: gstNumber == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter GST Number",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Ex: 07AACCW10C1ZP",
                              fillColor: Color(0xFFf2f2f2),
                              filled: true,
                              border: InputBorder.none,
                              //helperText: "Ex: 07AACCW10C1ZP",
                              //labelText: "Enter GST Number",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Flexible(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text("Search"),
                              onPressed: () {
                                // Api call
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ),
          )
        ],
      ),
    );
  }
}

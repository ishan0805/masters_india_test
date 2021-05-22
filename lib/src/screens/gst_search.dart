import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:masters_india_test/src/resources/gst/gst_repository.dart';
import 'package:masters_india_test/src/screens/profile_view.dart';

import '../utils/constants.dart';

class GstSearch extends StatefulWidget {
  GstSearch({Key key}) : super(key: key);

  @override
  _GstSearchState createState() => _GstSearchState();
}

class _GstSearchState extends State<GstSearch> {
  int gstNumber = 0;
  final _formKey = GlobalKey<FormState>();
  var gstRepository = GstRepository();
  String gstin;
  List<String> labels = ["Search Gst Number", "GST Return Status"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    isScroll: true,
                    marginSelected: EdgeInsets.all(3),
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
                    labels: labels,
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
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Ex: 07AACCW10C1ZP",
                                fillColor: Color(0xFFf2f2f2),
                                filled: true,
                                border: InputBorder.none,
                                //helperText: "Ex: 07AACCW10C1ZP",
                                //labelText: "Enter GST Number",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter a valid GSTIN";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                gstin = value;
                              },
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
                              onPressed: () async {
                                if (_formKey.currentState.validate() == true) {
                                  _formKey.currentState.save();
                                  bool ok = true;
                                  var profile = await gstRepository
                                      .getGstProfile(gstin)
                                      .catchError((onError) {
                                    _formKey.currentState.reset();
                                    _formKey.currentState.validate();
                                    ok = false;
                                  });

                                  if (ok) {
                                    profile.gstin = gstin;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GstProfileView(
                                            gst_profile: profile,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                } else {
                                  print("isha");
                                }

                                FocusScope.of(context).unfocus();
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

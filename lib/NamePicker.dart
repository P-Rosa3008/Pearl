import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/ExercisesScreen.dart';
import 'package:yoga/size_config.dart';

class NamePicker extends StatefulWidget {
  NamePicker({Key key}) : super(key: key);

  @override
  _NamePickerState createState() => _NamePickerState();
}

class _NamePickerState extends State<NamePicker> {
  String usernameVal = '';
  bool nameIsSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const Text(
              'Please enter first your name!',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: Container(
                width: getProportionateScreenWidth(300),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your name here!',
                  ),
                  onChanged: (val) {
                    usernameVal = val;
                    nameIsSet = true;
                    setState(() {});
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(
                    0.2,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue[300].withOpacity(
                        0.3,
                      ),
                      offset: Offset(
                        0.0,
                        15.0,
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: TextButton(
                  child: Text(
                    'Continue!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue[900],
                    ),
                  ),
                  onPressed: nameIsSet
                      ? () {
                          saveUserName() async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            setState(
                              () {
                                prefs.setString(
                                  'username',
                                  usernameVal,
                                );
                              },
                            );
                          }
                          saveUserName();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExercisesScreen(),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'settings.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      home: ProfilePage(),
    );
  }
}
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder:(BuildContext context)=> SettingsPage()));
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 5, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10)),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/IDPicDany2.jpeg"),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                buildTexField("Full Name", "John ADAM", false),
                buildTexField("Email", "johnadam@gmail.com", false),
                buildTexField("Password", "**********", true),
                buildTexField("Phone", "+012 3456 7890", false),
                buildTexField("Location", "10, Rue Capois, Port-au-Prince, Haiti", false),
                SizedBox(
                  height:30 ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: (){},
                    child: Text("CANCEL",
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.2,
                        color: Colors.black )),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("SAVE",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 2.2,
                        color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget buildTexField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword: false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton (
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
        ): null,
        contentPadding: EdgeInsets.only(bottom: 2),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ),
    ));
  }
}

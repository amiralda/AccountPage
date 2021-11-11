import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final double coverHeight = 280;
  final double profileHeight =  144;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Edit Profile",
        //     style: TextStyle(
        //         color: Colors.red,
        //         fontSize: 18,
        //         fontWeight: FontWeight.w500),
        //   ),
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //   elevation: 1,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.red,
        //     ),
        //     onPressed: () {},
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         Icons.settings,
        //         color: Colors.red,
        //       ),
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder:(BuildContext context)=> SettingsPage()));
        //       },
        //     ),
        //   ],
        // ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            buildTop(),
            buildContent(),
          ],
        ),

    );
  }

 Widget buildCoverImage() => Container (
       color: Colors.grey,
       child: Image(
         image: AssetImage("assets/image/coverimage5.jpg"),
         width: double.infinity,
         height: coverHeight,
         fit: BoxFit.cover,
       ),
     );

 Widget buildProfileImage() =>
     CircleAvatar(
       radius: profileHeight / 2,
       backgroundColor: Colors.grey.shade800,
       backgroundImage: AssetImage("assets/image/IDPicDany2.jpeg"),
     );

 Widget buildTop() {
   final bottom = profileHeight / 2;
   final top = coverHeight - profileHeight / 2;
   return Stack(
     alignment: Alignment.center,
     clipBehavior: Clip.none,
     children: [
       Container(
         margin: EdgeInsets.only(bottom: bottom),
         child: buildCoverImage(),
       ),

       Positioned(
         top: top,
         child: buildProfileImage(),
       )
     ],
   );
 }

 Widget buildContent() => Column(
   children: [
     const SizedBox(height: 8),
     Text(
       'Dany AUGUSTIN',
       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
     ),
     const SizedBox(height: 8),
     Text(
       'Top Donnor',
       style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
     ),
     const SizedBox(height: 16),
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         buildSocialIcon(FontAwesomeIcons.phone),
         const SizedBox(width: 12),
         buildSocialIcon(FontAwesomeIcons.sms),
         const SizedBox(width: 12),
         buildSocialIcon(FontAwesomeIcons.whatsapp),
         const SizedBox(width: 12),
         buildSocialIcon(FontAwesomeIcons.telegram),
         const SizedBox(width: 12),
       ],
     ),
     const SizedBox(height: 16),
     Divider(),
     const SizedBox(height: 16),
     NumbersWidget(),
     const SizedBox(height: 16),
     Divider(),
     const SizedBox(height: 16),

   ],
 );

 Widget buildSocialIcon(IconData icon) => CircleAvatar(
radius: 25,
   child: Material(
     shape: CircleBorder(),
     clipBehavior: Clip.hardEdge,
     color: Colors.transparent,
     child: InkWell(
       onTap: () {},
       child: Center(child: Icon(icon, size: 32)),
     ),
   ),

 );

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
        )
    );
  }

}

class NumbersWidget  extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Row (
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(text: 'Vie Sauvée', value: 20),
      buildDivider(),
      buildButton(text: 'Requettes', value: 90),
      buildDivider(),
      buildButton(text: 'Money Donation', value: 3200),
    ],
  );

 Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
 );

 Widget buildButton({
   required String text,
   required int value
 }) =>
     MaterialButton(
       padding: EdgeInsets.symmetric(vertical: 4),
       onPressed: (){},
       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget> [
           Text(
             '$value',
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
           ),
           SizedBox(height: 2),
           Text(
             text,
             style: TextStyle(fontSize: 16),
           ),
         ],
       ),
     );


}


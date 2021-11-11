import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
 _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left:16, top: 20, right: 16),
        child: ListView(
          children: [

            SizedBox(height: 15,),
            Row(
              children: [
                Icon(Icons.person,
                  color: Colors.red,
                ),
                SizedBox(width: 8,),
                Text(
                  "Account",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change Password"),
            buildAccountOptionRow(context, "Content settings"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(height: 25,),
            Row(
              children: [
                Icon(Icons.volume_up_outlined,
                  color: Colors.red,
                ),
                SizedBox(width: 8,),
                Text(
                  "Notifications",
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 30,
            ),
            Center (
            child: OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),

              onPressed: () {},
              child: Text("SIGN OUT", style: TextStyle(
                fontSize: 15, letterSpacing: 2.2, color: Colors.black
              ),),
            ),
            ),
          ],
        ),
      ),
    );
  }
  Row buildNotificationOptionRow(String title, bool isActive){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style:TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600])
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: isActive, onChanged: (bool val){},)
        )

      ],
    );
  }

 GestureDetector buildAccountOptionRow (BuildContext context, String title){
   return GestureDetector(
     onTap: (){
       showDialog(
           context: context,
           builder: (BuildContext context){
             return AlertDialog(
               title: Text(title),
               content: Column(
                 mainAxisSize:MainAxisSize.min ,
                 children: [
                   Text("Option 1"),
                   Text("Option 2"),
                   Text("Option 3"),
                   Text("Option 4"),
                 ],),
               actions: [
                 TextButton(
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                     child: Text("Close")),
               ],
             );
           });
     },
     child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 8.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(
             title,
             style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.w500,
               color: Colors.grey[600],
             ),
           ),
           Icon(Icons.arrow_forward_ios,
             color: Colors.grey,
           ),
         ],
       ),
     ),

   );
 }
}
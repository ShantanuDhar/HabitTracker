import 'package:flutter/material.dart';
import 'package:habit_tracker/Helper/helper_function.dart';
import 'package:habit_tracker/resources/auth_methods';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}



 

class _ProfilePageState extends State<ProfilePage> {
  AuthMethods auth=AuthMethods();
    String username='';
   void initState() {
    super.initState();
    _loadUserName();
  }
   Future<void> _loadUserName() async {
     await HelperFunction.getUserNameSF().then((value) {
      setState(() {
         username = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
        children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.purpleAccent,
            backgroundImage: NetworkImage(
                'https://cdn2.iconfinder.com/data/icons/avatars-60/5985/12-Delivery_Man-512.png'),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child:  Center(
                child: Text(
              "Hey $username!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Center(
              child: Text(
            "What a wonderful day!!",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Account Info"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("My Subscription Info"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("All of my habits"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About This App"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          Center(
            child: TextButton(
              onPressed: (() {
                  Navigator.of(context).pop();
                auth.signout();
               
              }),
              child: Text(
                "Log Out",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
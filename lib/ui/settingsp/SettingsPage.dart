import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: _goBackButton(context),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 166, 207, 240)),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 166, 207, 240),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Account",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
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
              buildAccountOptionRow(context, "Edit Your Contact"),
              buildAccountOptionRow(context, "Language"),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(Icons.volume_up_outlined,
                      color: Color.fromARGB(255, 166, 207, 240)),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Notifications",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildNotificationsOptionRow("New For You", true),
              buildNotificationsOptionRow("Account Activte ", false),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }

  Widget _goBackButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
        onPressed: () {
          Navigator.of(context).pop(true);
        });
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("data"), Text("data"), Text("data")],
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("close"))
                  ],
                );
              });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue[300],
              )
            ],
          ),
        ));
  }

  Row buildNotificationsOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400]),
        ),
        Switch(
          value: isActive,
          onChanged: (bool val) {},
          activeColor: Colors.blue[400],
        )
      ],
    );
  }
}

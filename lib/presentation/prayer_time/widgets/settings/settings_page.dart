import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Location'),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}

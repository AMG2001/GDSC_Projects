import 'package:flutter/material.dart';

void main() {
  runApp(TodoDemo());
}

class TodoDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> user_data = [];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> form_key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (form_key.currentState!.validate()) {
            setState(() {
              /**
               * adding in list .
               */
              user_data.add(
                Column(
                  children: [
                    Text(
                        "${firstNameController.text} - ${lastNameController.text}"),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              );
              print(user_data);

              firstNameController.text = "";
              lastNameController.text = "";
            });
          } else {
            print('Not validated');
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Demo Todo"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Form(
            key: form_key,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Don't leave this field empty";
                    } else if (value!.length < 8) {
                      return 'must be 8 or higher';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'First name'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Don't leave this field empty";
                    } else if (value!.length < 8) {
                      return 'must be 8 or higher';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Last name'),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Column(
                    children: user_data,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

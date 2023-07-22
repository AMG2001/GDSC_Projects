import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool hidePassword = true;
  String full_name = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("First Name : "),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: first_name_controller,
                  ),
                  width: MediaQuery.sizeOf(context).width * .6,
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Password : "),
                SizedBox(
                  height: 24,
                ),
                Container(
                  // visibility - visibility_off
                  child: TextField(
                    controller: password_controller,
                    cursorColor: Colors.red,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          // visibilty if(condition)
                          icon: hidePassword == true
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        hintText: 'enter your password here',
                        labelText: "password",
                        border: OutlineInputBorder()),
                    enabled: true,
                  ),
                  width: MediaQuery.sizeOf(context).width * .6,
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  if (first_name_controller.text.length < 8) {
                    print('Not valid');
                  } else {
                    print(first_name_controller.text);
                  }
                },
                child: Text("Print")),
            SizedBox(
              height: 24,
            ),
            Text(full_name)
          ],
        ),
      ),
    );
  }
}

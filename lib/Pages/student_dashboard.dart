import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/bottom_navigation.dart';
import 'package:kids/app/Routes/app.route.dart';
import 'package:provider/provider.dart';

import '../app/Provider/auth.provider.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Dashboard'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (() {
                  auth.logout();
                  Navigator.pushReplacementNamed(
                      context, RoutePaths.welcomeScreen);
                }),
                icon: const Icon(Icons.logout))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ayush Pandit',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '#1827hehe',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ayushpanditmoto@gmail.com',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.verified,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text("Class 10",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 30,
                  ),
                  shape: ShapeBorder.lerp(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      1),
                  title: const Text('Admit Card'),
                  onTap: () {},
                  subtitle: const Text('View your admit card'),
                  tileColor: const Color.fromARGB(255, 76, 76, 76),
                ),
                //result card
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 30,
                  ),
                  shape: ShapeBorder.lerp(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      1),
                  title: const Text('Result'),
                  onTap: () {},
                  subtitle: const Text('View your result'),
                  tileColor: const Color.fromARGB(255, 76, 76, 76),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNav(
          index: 0,
        ));
  }
}

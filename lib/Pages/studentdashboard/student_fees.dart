import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/bottom_navigation.dart';

class StudentFees extends StatefulWidget {
  const StudentFees({super.key});

  @override
  State<StudentFees> createState() => _StudentFeesState();
}

class _StudentFeesState extends State<StudentFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Fees'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (() {}), icon: const Icon(Icons.logout))
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('Fees Due'),
              Text('Rs. 5000'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.verified_outlined,
                color: Color.fromARGB(255, 70, 0, 191)),
            title: Text('April 2023'),
            subtitle: Text('Fees Paid'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            tileColor: Color.fromARGB(255, 58, 58, 58),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.verified_outlined,
                color: Color.fromARGB(255, 70, 0, 191)),
            title: Text('March 2023'),
            subtitle: Text('Fees Paid'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            tileColor: Color.fromARGB(255, 58, 58, 58),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.verified_outlined,
                color: Color.fromARGB(255, 70, 0, 191)),
            title: Text('February 2023'),
            subtitle: Text('Fees Paid'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            tileColor: Color.fromARGB(255, 58, 58, 58),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.verified_outlined,
                color: Color.fromARGB(255, 70, 0, 191)),
            title: Text('January 2023'),
            subtitle: Text('Fees Paid'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            tileColor: Color.fromARGB(255, 58, 58, 58),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(
        index: 2,
      ),
    );
  }
}

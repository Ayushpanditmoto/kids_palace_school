import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/bottom_navigation.dart';

class StudentNotice extends StatefulWidget {
  const StudentNotice({super.key});

  @override
  State<StudentNotice> createState() => _StudentNoticeState();
}

class _StudentNoticeState extends State<StudentNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Notice'),
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
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text('26th Jan 2023'),
          subtitle: Text('Happy Republic Day'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          tileColor: Color.fromARGB(255, 58, 58, 58),
        ),
      ),
      bottomNavigationBar: const BottomNav(
        index: 1,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../app/Routes/app.route.dart';

class BottomNav extends StatefulWidget {
  final int index;
  const BottomNav({super.key, this.index = 0});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home,
                color: widget.index == 0 ? Colors.blue : Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.studentDashboard);
            },
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.notifications,
                color: widget.index == 1 ? Colors.blue : Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.studentNotice);
            },
          ),
          label: 'Notice',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.monetization_on,
                color: widget.index == 2 ? Colors.blue : Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.studentFees);
            },
          ),
          label: 'Fees',
        ),
      ],
    );
  }
}

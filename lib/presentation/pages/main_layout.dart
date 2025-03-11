import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Test Flutter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Header',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Go to Home'),
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              title: const Text('Go to My Page'),
              onTap: () {
                Navigator.pop(context);
                context.go('/my-page');
              },
            ),
          ],
        ),
      ),
      body: child, // 현재 선택된 페이지가 여기에 들어감
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sneakertutorial/components/bottom_nav_bar.dart';
import 'package:sneakertutorial/pages/cart_page.dart';
import 'package:sneakertutorial/pages/intro_page.dart';
import 'package:sneakertutorial/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text('Sneaker Tutorial'),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          )),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset('lib/images/logo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800]),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: IntroPage(),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: HomePage(),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      // ignore: prefer_const_constructors
                      leading: Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Releases',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // ADD WHEN HAVE CONTENT TO FILL
                // const Padding(
                //   padding: EdgeInsets.only(left: 25.0),
                //   child: ListTile(
                //     // ignore: prefer_const_constructors
                //     leading: Icon(
                //       Icons.newspaper,
                //       color: Colors.white,
                //     ),
                //     title: Text(
                //       'Blog',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 25.0),
                //   child: ListTile(
                //     // ignore: prefer_const_constructors
                //     leading: Icon(
                //       Icons.info,
                //       color: Colors.white,
                //     ),
                //     title: Text(
                //       'About',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                // ignore: prefer_const_constructors
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      // Add the selected page as the body of the Scaffold.
      body: _pages[_selectedIndex],
    );
  }
}

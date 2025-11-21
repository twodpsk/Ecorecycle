import 'package:flutter/material.dart';
import '../widgets/sprout_section.dart';
import '../widgets/tip_menu.dart';
import '../widgets/eco_space.dart';
import '../widgets/cert_section.dart';
import '../widgets/quiz_section.dart';
import '../shop/shop_screen.dart'; // 같은 home 폴더 안

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer 메뉴
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                '메뉴',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('내 프로필'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('포인트'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('고객센터'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('상점'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('EcoRecycle'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SproutSection(),
              SizedBox(height: 2),
              TipMenu(),
              SizedBox(height: 2),
              EcoSpaceSection(),
              SizedBox(height: 1),
              CertSection(),
              SizedBox(height: 4),
              QuizSection(),
            ],
          ),
        ),
      ),
      // 하단바
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: Colors.green,
                onPressed: () {},
                iconSize: 22,
              ),
              // 중앙 카메라 버튼을 BottomAppBar 안으로
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(12),
                ),
                child: const Icon(Icons.camera_alt, size: 22, color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.grey,
                onPressed: () {},
                iconSize: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TipMenu extends StatelessWidget {
  const TipMenu({super.key});

  void _showTipPopup(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("$title 분리배출 팁"),
          content: Text("$title 는 이렇게 분리배출 하면 좋아요!\n(여기에 나중에 실제 팁 넣으면 됨)"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("닫기"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4), // 좌우 위아래 여백
        children: [
          tipCard(context, "플라스틱", Icons.recycling),
          tipCard(context, "종이류", Icons.menu_book),
          tipCard(context, "유리병", Icons.local_drink),
          tipCard(context, "캔류", Icons.coffee),
          tipCard(context, "비닐", Icons.wrap_text),
        ],
      ),
    );
  }

  Widget tipCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () => _showTipPopup(context, title),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.grey.shade300,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.green),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

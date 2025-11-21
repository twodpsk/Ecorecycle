import 'package:flutter/material.dart';
import '../shop/shop_screen.dart'; // ShopScreen import

class SproutSection extends StatelessWidget {
  const SproutSection({super.key});

  void _openStore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShopScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "환영합니다, 예나님 🌱",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "오늘도 지구를 위한 작은 실천을 함께해요!",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // 새싹 + 포인트 + 상점 아이콘
          Stack(
            children: [
              // 새싹 영역
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/sprout.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 오른쪽 상단 포인트 + 상점버튼
              Positioned(
                right: 15,
                top: 12,
                child: Row(
                  children: [
                    const Text(
                      "현재 포인트: 120P",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),

                    GestureDetector(
                      onTap: () => _openStore(context), // ShopScreen으로 이동
                      child: const Icon(
                        Icons.store_mall_directory,
                        color: Colors.green,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

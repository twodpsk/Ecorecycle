import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 전역 포인트 변수
int points = 120; // 초기 포인트 설정

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoRecycle',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈 화면'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 현재 포인트 표시
            Text(
              '현재 포인트: $points',
              style: const TextStyle(
                fontSize: 12, // 글씨 작게
                color: Colors.grey, // 회색
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // ShopScreen으로 이동
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopScreen()),
                );
                // 돌아오면 화면 갱신
                setState(() {});
              },
              child: const Text('상점으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String topImage = 'assets/sprout.png';

  final List<bool> sprayPurchased = [false, false, false];

  // 0 = 구매 전, 1 = 착용 중 → 구매 버튼, 2 = 구매 완료
  final List<int> dressState = [0, 0, 0, 0];

  final List<Map<String, dynamic>> sprays = [
    {'image': 'assets/spray1.png', 'price': '100P', 'growth': '8%'},
    {'image': 'assets/spray2.png', 'price': '200P', 'growth': '10%'},
    {'image': 'assets/spray3.png', 'price': '300P', 'growth': '12%'},
  ];

  final List<Map<String, dynamic>> dresses = [
    {'image': 'assets/dress1.png', 'price': '300P', 'name': '스트로베리 드레스업'},
    {'image': 'assets/dress2.png', 'price': '300P', 'name': '허니벌 드레스업'},
    {'image': 'assets/dress3.png', 'price': '400P', 'name': '외계뿅뿅 드레스업'},
    {'image': 'assets/dress4.png', 'price': '150P', 'name': '퐁실니트 드레스업'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Shop'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 상단 이미지 + 포인트
          Container(
            width: double.infinity,
            height: 160,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              children: [
                // 되돌리기 아이콘
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.restore, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        topImage = 'assets/sprout.png';
                        for (int i = 0; i < dressState.length; i++) {
                          if (dressState[i] == 1) dressState[i] = 0;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      topImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '현재 포인트',
                        style: TextStyle(
                          fontSize: 10, // 작게
                          color: Colors.grey, // 회색
                        ),
                      ),
                      Text(
                        '$points P',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 분무기 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '분무기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: sprays.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final spray = sprays[index];
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                spray['image'],
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                spray['price'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '성장량 ${spray['growth']}',
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black54),
                              ),
                              const SizedBox(height: 6),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: sprayPurchased[index]
                                      ? Colors.grey
                                      : Colors.green,
                                  minimumSize: const Size(80, 28),
                                ),
                                onPressed: sprayPurchased[index]
                                    ? null
                                    : () {
                                  setState(() {
                                    sprayPurchased[index] = true;
                                    points -= int.parse(
                                        spray['price'].replaceAll('P', ''));
                                  });
                                },
                                child: Text(
                                  sprayPurchased[index]
                                      ? '구매 완료'
                                      : '구매하기',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 드레스 영역
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '드레스업',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: dresses.length,
                      itemBuilder: (context, index) {
                        final dress = dresses[index];

                        String btnText;
                        Color btnColor;

                        if (dressState[index] == 0) {
                          btnText = '착용하기';
                          btnColor = Colors.green;
                        } else if (dressState[index] == 1) {
                          btnText = '구매하기';
                          btnColor = Colors.orange;
                        } else {
                          btnText = '구매 완료';
                          btnColor = Colors.grey;
                        }

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    dress['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dress['price'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        dress['name'],
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: StatefulBuilder(
                                          builder: (context, setBtnState) {
                                            bool isHover = false;
                                            return MouseRegion(
                                              onEnter: (_) => setBtnState(() => isHover = true),
                                              onExit: (_) => setBtnState(() => isHover = false),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: isHover
                                                      ? btnColor.withOpacity(0.8)
                                                      : btnColor,
                                                  minimumSize: const Size(80, 28),
                                                ),
                                                onPressed: dressState[index] == 2
                                                    ? null
                                                    : () {
                                                  setState(() {
                                                    // 다른 착용 중인 드레스 초기화
                                                    for (int i = 0; i < dressState.length; i++) {
                                                      if (i != index && dressState[i] == 1) {
                                                        dressState[i] = 0;
                                                      }
                                                    }
                                                    if (dressState[index] == 0) {
                                                      dressState[index] = 1;
                                                      topImage = dress['image'];
                                                    } else if (dressState[index] == 1) {
                                                      dressState[index] = 2;
                                                      points -= int.parse(
                                                          dress['price'].replaceAll('P', ''));
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  btnText,
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

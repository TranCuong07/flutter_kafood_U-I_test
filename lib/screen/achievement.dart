import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPage();
}

class _AchievementPage extends State<AchievementPage> {
  final List<String> itemsTab = [
    "Tất cả",
    "Học phí",
    "Nghỉ học",
    "Tiêm ngừa",
  ];

  final List<IconData> iconsTab = [
    Icons.home,
    Icons.money,
    Icons.search,
    Icons.vaccines,
  ];
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text('Tính BMI cho bé',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(child: Column (children: [
        _buildTabBar(),
        const SizedBox(height: 10),
        const ChildCard(),
      ],),),
    );
  }



  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemsTab.length,
          itemBuilder: (context, index) {
            return _buildTabItem(index);
          },
        ),
      ),
    );
  }
    Widget _buildTabItem(int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              current = index;
            });
            pageController.animateToPage(
              current,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(5),
            width: 100,
            height: 55,
            decoration: BoxDecoration(
              color: current == index ? Colors.white70 : Colors.white54,
              borderRadius: current == index
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(5),
              border: current == index
                  ? Border.all(color: Colors.blue, width: 2.5)
                  : null,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconsTab[index],
                    size: current == index ? 21 : 18,
                    color: current == index ? Colors.black : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    itemsTab[index],
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w500,
                      color: current == index ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
}
class ChildCard extends StatelessWidget {
  const ChildCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/child.png'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bé: Tô Gia Hưng', style: TextStyle(fontSize: 16)),
              Text('Tuổi: 4', style: TextStyle(color: Colors.grey)),
              Text('Lớp: Lá 1', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
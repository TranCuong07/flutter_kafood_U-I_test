import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screen/allergy.dart';
import 'package:myapp/screen/bmi.dart';
import 'package:myapp/screen/menu.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> catNames = [
    "Đăng ký môn năng khiếu",
    'Sổ theo dõi sức khỏe',
    'Sổ bé ngoan',
    'Đánh giá giáo viên',
    'Kho ảnh hoạt động',
    'Năng lượng dinh dưỡng',
    'Thực phẩm dị ứng',
    'Lịch sử tiêm ngừa'
  ];

  final List<Color> catColors = [
    const Color(0xFFFFE082),
    const Color(0xFF81D4FA),
    const Color(0xFFA5D6A7),
    const Color(0xFFFFAB91),
    const Color(0xFFFFF59D),
    const Color(0xFFCE93D8),
    const Color(0xFFB3E5FC),
    const Color(0xFFF48FB1),
  ];

  final List<IconData> catIcons = [
    Icons.sports_soccer,
    Icons.health_and_safety,
    Icons.star,
    Icons.school,
    Icons.photo_album,
    Icons.local_dining,
    Icons.no_food,
    Icons.vaccines,
  ];

  final List<String> catMenuNames = [
    'Báo cắt suất/Nghỉ học',
    'Thanh toán học phí',
    'Thời khóa biểu',
    'Thực đơn'
  ];

  final List<Color> catMenuColors = [
    const Color(0xFFFFE082),
    const Color(0xFF81D4FA),
    const Color(0xFFA5D6A7),
    const Color(0xFFFFAB91),
  ];

  final List<IconData> catMenuIcons = [
    Icons.edit_note,
    Icons.payment,
    Icons.calendar_today,
    Icons.restaurant_menu,
  ];

  final List<String> imgList = [
    'Flutter',
    'React Native',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(),
          _buildCategoryMenu(context),
          _buildCategoryGrid(),
          const SizedBox(height: 10),
          _boardNews(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      decoration: const BoxDecoration(color: Colors.blue),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.dashboard, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildCategoryMenu(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/school.png',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        switch (index) {
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Menu()),
                            );
                          break;
                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Chức năng này chưa được hỗ trợ!')),
                            );
                      }
                      },
                      child: Column(
                        children: [
                          Icon(catMenuIcons[index], color: Colors.blue, size: 30),
                          const SizedBox(height: 2),
                          Text(
                            catMenuNames[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GridView.builder(
          itemCount: catNames.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  switch (index) {
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BMIPage()),
                      );
                    case 6:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllergyPage()),
                      );
                      break;
                    default:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Chức năng này chưa được hỗ trợ!')),
                      );
                  }
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: catColors[index],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(catIcons[index],
                            color: Colors.white, size: 25),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      catNames[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  Widget _boardNews() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thông báo',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              const Text(
                'Xem tất cả',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            itemCount: imgList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff5f3ff),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/${imgList[index]}.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Thông báo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

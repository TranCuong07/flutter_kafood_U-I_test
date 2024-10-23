import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<Map<String, String>> items = [
    {
      'title': 'Thanh toán học phí tháng 04',
      'amount': '1.200.000 đ',
      'date': '08/09 - 26/02/2024',
      'status': 'thành công',
    },
    {
      'title': 'Nghỉ học - Nhà có việc',
      'amount': '',
      'date': '25/02/2024',
      'status': '',
    },
    {
      'title': 'Tiêm ngừa vắc xin cuối mùa',
      'amount': '345.000 đ',
      'date': '26/02 - 28/02/2024',
      'status': 'thành công',
    },
    {
      'title': 'Nghỉ học - Nhà có việc',
      'amount': '',
      'date': '03/03/2024',
      'status': '',
    },
  ];

  final List<Color> transactionColors = [
    const Color(0xFFFFE082),
    const Color(0xFF81D4FA),
    const Color(0xFFA5D6A7),
    const Color(0xFFFFAB91),
  ];

  final List<IconData> transactionIcons = [
    Icons.payment,
    Icons.event_note,
    Icons.school,
    Icons.event_note,
  ];

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
      body: Column(
        children: [
          _buildSearchHeader(),
          _buildTabBar(),
          _buildHistoryTitle(),
          _buildHistoryList(),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tìm kiếm',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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

  Widget _buildHistoryTitle() {
    return Text(
      'Lịch sử giao dịch',
      style: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildHistoryList() {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildCard(index);
        },
      ),
    );
  }

  Widget _buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIcon(index),
              const SizedBox(width: 10),
              _buildDetails(index),
              _buildStatus(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        transactionIcons[index],
        size: 40,
        color: transactionColors[index],
      ),
    );
  }

  Widget _buildDetails(int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            items[index]['title']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            items[index]['date']!,
            style: const TextStyle(color: Colors.grey),
          ),
          if (items[index]['amount']!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                items[index]['amount']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatus(int index) {
    if (items[index]['status']!.isNotEmpty) {
      return Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              items[index]['status']!,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

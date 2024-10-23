import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tuition extends StatefulWidget {
  const Tuition({super.key});

  @override
  _TuitionState createState() => _TuitionState();
}

class _TuitionState extends State<Tuition> {
  final List<Map<String, String>> items = [
  {
    'title': 'Thanh toán học phí tháng 04',
    'amount': '1.200.000 đ',
    'date': '08/09 - 26/02/2024',
    'status': 'thành công',
  },
  {
    'title': 'Thanh toán học phí tháng 05',
    'amount': '1.300.000 đ',
    'date': '08/09 - 26/03/2024',
    'status': 'chưa thanh toán',
  },
];

final Map<String, Color> statusColors = {
  'thành công': const Color(0xFFA5D6A7),  
  'chưa thanh toán': const Color(0xFFFFAB91),  
};

final Map<String, IconData> statusIcons = {
  'thành công': Icons.check_circle,  
  'chưa thanh toán': Icons.error,    
};



  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: BackButton(
    color: Colors.white),
        title:  Text('Học phí' ,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          _buildHistoryTitle(),
          _buildHistoryList(),
        ],
      ),
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
    final status = items[index]['status']!;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        statusIcons[status],
        size: 40,
        color: statusColors[status],
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
    final status = items[index]['status']!;
    if (status.isNotEmpty) {
      return Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
             Icon(
              statusIcons[status],
              color: statusColors[status],
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              status,
              style:  TextStyle(
                color: statusColors[status],
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

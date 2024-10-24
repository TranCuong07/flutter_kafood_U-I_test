import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/injection.dart';

class Vaccination extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Mũi 1: Vacxin Viêm gan B',
      'date': '12/05/2023',
      'location': 'Trung tâm Y tế Cần Thơ',
    },
    {
      'title': 'Mũi 2: Vacxin Sởi',
      'date': '10/08/2023',
      'location': 'Trung tâm Y tế Quận Ninh Kiều',
    },
  ];
    final Map<String, IconData> statusIcons = {
    'thành công': Icons.check_circle,
    'chưa thanh toán': Icons.error,
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text('Thông tin tiêm ngừa', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          _buildTitle(),
          _buildList(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Injection()),
          );
        },
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.add_box_rounded, color: Colors.white),
        label: const Text('Thêm khai báo tiêm chủng', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Lịch sử tiêm ngừa',
      style: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildList() {
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
                Icon(
                  Icons.local_hospital,
                  size: 40,
                  color: Colors.blue,
                ),
              const SizedBox(width: 10),
               _buildCardDetails(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDetails(int index) {
    return Expanded(
      child: Column(children: [
        Text(
          items[index]['title']!,
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text('Ngày: ${items[index]['date']!}'),
        const SizedBox(height: 5),
        Text('Địa điểm: ${items[index]['location']}')
      ],),

    );
  }




}

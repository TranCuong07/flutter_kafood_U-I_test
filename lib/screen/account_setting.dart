import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoxLCJpZF9zY2hvb2wiOjEsImlhdCI6MTcyOTc2MzI1NywiZXhwIjoxNzMwMzY4MDU3fQ.-8OafXuEjs7hfcnWHps4tb6otFVqJdPscrK-kcgFMf8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text('Tài khoản', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: AccountBody(),
    );
  }
}

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileSection(),
          SettingsSection(),
          LogoutButton(),
        ],
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  Future<List<dynamic>> fetchChildren(String token) async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoxLCJpZF9zY2hvb2wiOjEsImlhdCI6MTcyOTc2MzI1NywiZXhwIjoxNzMwMzY4MDU3fQ.-8OafXuEjs7hfcnWHps4tb6otFVqJdPscrK-kcgFMf8';
    final dio = Dio();
    final String baseUrl =
        'https://d7e0-2402-800-63a5-b94c-acf7-f916-8d57-eb2c.ngrok-free.app';
    final String url = '$baseUrl/get-students-by-parent';

    try {
      final response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return responseData;
      } else {
        throw Exception('Lỗi khi lấy danh sách con');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  List<dynamic> children = [];
  bool isLoading = true;

  _ProfileSectionState({required this.token});
  @override
  void initState() {
    super.initState();
    fetchChildren(token).then((data) {
      setState(() {
        children = data;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/mother.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nguyễn Trà My',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phụ huynh học sinh',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Hiển thị danh sách con hoặc trạng thái đang tải
          isLoading
              ? const CircularProgressIndicator()
              : children.isEmpty
                  ? const Text('Không có dữ liệu học sinh')
                  : Column(
                      children: children.map((child) {
                        return ChildCard(
                          name: child['name'],
                          age: child['age'],
                          className: child['class'],
                        );
                      }).toList(),
                    ),
        ],
      ),
    );
  }
}

class ChildCard extends StatelessWidget {
  final String name;
  final int age;
  final String className;

  const ChildCard({
    super.key,
    required this.name,
    required this.age,
    required this.className,
  });

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
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/child.png'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bé: $name', style: const TextStyle(fontSize: 16)),
              Text('Tuổi: $age', style: const TextStyle(color: Colors.grey)),
              Text('Lớp: $className',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingItem(
          icon: Icons.person,
          title: 'Quản lý tài khoản',
        ),
        SettingItem(
          icon: Icons.contact_mail,
          title: 'Thông tin liên lạc',
        ),
        SettingItem(
          icon: Icons.payment,
          title: 'Cài đặt thanh toán',
        ),
        SettingItem(
          icon: Icons.help,
          title: 'Trung tâm hỗ trợ',
        ),
        SettingItem(
          icon: Icons.shield,
          title: 'Trung tâm bảo mật',
        ),
        SettingItem(
          icon: Icons.settings,
          title: 'Cài đặt ứng dụng',
        ),
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        // chức năng khi nhấn
      },
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        onPressed: () {
          // thoát
        },
        icon: const Icon(Icons.logout, color: Colors.red),
        label: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          minimumSize: const Size(double.infinity, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

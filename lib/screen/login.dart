import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/navbar.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> login(String username, String password) async {
    final dio = Dio();
    final String baseUrl = 'https://d7e0-2402-800-63a5-b94c-acf7-f916-8d57-eb2c.ngrok-free.app';
    final String loginUrl = '$baseUrl/login';

    try {
      final response = await dio.post(
        loginUrl,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thất bại.')),
      );
      }
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thất bại.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //logo
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 30),

                    TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Số điện thoại hoặc Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Password input
                    TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Mật khẩu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //login button
                    ElevatedButton(
                      onPressed: () {
                        final username = _username.text;
                        final password = _password.text;
                        login(username, password);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),

                    //register text
                    Center(
                        child: GestureDetector(
                      onTap: () {
                        // Xử lý khi nhấn nút Đăng ký
                      },
                      child: const Text(
                        'Chưa có tài khoản? Đăng ký',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ))
                  ],
                ))));
  }
}

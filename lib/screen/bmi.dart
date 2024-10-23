import 'package:flutter/material.dart';

class BMIPage extends StatelessWidget {
  const BMIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính BMI cho bé'),
        backgroundColor: Colors.blue,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChildCard(),
          ChartImage(),
          BMICalculatorBody(),
        ],
      ),
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

class ChartImage extends StatelessWidget {
  const ChartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/images/chart.png"
      ),
    );
  }
}

class BMICalculatorBody extends StatefulWidget {
  const BMICalculatorBody({super.key});

  @override
  _BMICalculatorBodyState createState() => _BMICalculatorBodyState();
}

class _BMICalculatorBodyState extends State<BMICalculatorBody> {
  double height = 120;
  double weight = 30;
  int age = 10;
  String bmiResult = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSliderCard('Chiều cao', height, 80, 160, (value) {
              setState(() {
                height = value;
              });
            }),
            _buildSliderCard('Cân nặng', weight, 10, 70, (value) {
              setState(() {
                weight = value;
              });
            }),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    double heightInMeters = height / 100;
                    double bmi = weight / (heightInMeters * heightInMeters);
                    bmiResult = bmi.toStringAsFixed(2);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Tính BMI',
                  style: TextStyle(fontSize: 18, fontFamily: 'ComicSans'),
                )),
            const SizedBox(height: 20),
            if (bmiResult.isNotEmpty) _buildBMIResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderCard(String label, double value, double minValue,
      double maxValue, ValueChanged<double> onChanged) {
    return Card(
      color: Colors.lightGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              '$label: ${value.toInt()} ${label == 'Chiều cao' ? 'Cm' : label == 'Cân nặng' ? 'Kg' : 'Tuổi'}',
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'ComicSans'),
            ),
            Slider(
              value: value,
              min: minValue,
              max: maxValue,
              divisions: (maxValue - minValue).toInt(),
              onChanged: onChanged,
              activeColor: Colors.yellow,
              inactiveColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  String _getBMICategory(double bmi) {
    if (bmi < 14) {
      return 'Bé thiếu cân';
    } else if (bmi < 18) {
      return 'Bé bình thường';
    } else if (bmi < 22) {
      return 'Bé thừa cân';
    } else {
      return 'Bé béo phì';
    }
  }

  Widget _buildBMIResult() {
    return Column(
      children: [
        Text(
          'BMI của bé: $bmiResult',
          style: const TextStyle(
              color: Colors.purple,
              fontSize: 24,
              fontFamily: 'ComicSans',
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Text(
          _getBMICategory(double.parse(bmiResult)),
          style: const TextStyle(
              color: Color.fromARGB(255, 13, 136, 236),
              fontSize: 18,
              fontFamily: 'ComicSans',
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

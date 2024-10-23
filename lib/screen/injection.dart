import 'package:flutter/material.dart';

class Injection extends StatelessWidget {
  final TextEditingController allergyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const DiseaseSection(),
            _buildDiseaseInput(),
            const SizedBox(height: 20),
            _buildVaccineInput(),
            const SizedBox(height: 20),
            _buildLocationInput(),
            const SizedBox(height: 20),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
    leading: BackButton(
    color: Colors.white), 
      title: const Text('Khai báo tiêm chủng',style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildLocationInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nơi tiêm:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: allergyController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Nhập nơi tiêm',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildDiseaseInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Khác:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: allergyController,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
    Widget _buildVaccineInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vaccine/Số lô:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: allergyController,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: const Size(double.infinity, 20),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
        },
        child: const Text('Gửi', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class DiseaseSection extends StatelessWidget {
  const DiseaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> diseaseOptions = ['Loại bệnh 1', 'Loại bệnh 2', 'Loại bệnh 3'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Loại bệnh',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildDropdown(diseaseOptions, 'Từ bộ y tế'),
      ],
    );
  }

  Widget _buildDropdown(List<String> options, String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: options.map((String disease) {
        return DropdownMenuItem<String>(
          value: disease,
          child: Text(disease),
        );
      }).toList(),
      onChanged: (String? newValue) {
      },
    );
  }
}

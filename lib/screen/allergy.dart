import 'package:flutter/material.dart';

class AllergyPage extends StatelessWidget {
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
            const CenterImage(),
            const SizedBox(height: 20),
            const AllergyDropdownSection(),
            const SizedBox(height: 20),
            _buildOtherAllergyInput(),
            const SizedBox(height: 20),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Chọn Thực Phẩm Dị Ứng'),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildOtherAllergyInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nhập thực phẩm bé dị ứng khác:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: allergyController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Nhập các thực phẩm khác...',
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

class CenterImage extends StatelessWidget {
  const CenterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/food.png',
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
      ),
    );
  }
}

class AllergyDropdownSection extends StatelessWidget {
  const AllergyDropdownSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> foodOptions = ['Thực phẩm 1', 'Thực phẩm 2', 'Thực phẩm 3'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chọn thực phẩm bé dị ứng',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildDropdown(foodOptions, 'Thực phẩm 1'),
        const SizedBox(height: 10),
        _buildDropdown(foodOptions, 'Thực phẩm 2'),
      ],
    );
  }

  // Dropdown
  Widget _buildDropdown(List<String> options, String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: options.map((String food) {
        return DropdownMenuItem<String>(
          value: food,
          child: Text(food),
        );
      }).toList(),
      onChanged: (String? newValue) {
      },
    );
  }
}

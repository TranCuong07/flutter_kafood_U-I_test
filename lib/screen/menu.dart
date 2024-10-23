import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text('Thực đơn', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: const MenuBody(),
    );
  }
}

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 230,
            child: const Calendar(),
          ),
          Meal(),
        ],
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WeeklyCalendar(
            calendarStyle: CalendarStyle(
              locale: "vi",
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              headerDateTextAlign: Alignment.centerLeft,
              headerDateTextColor: Colors.blue,
              footerDateTextColor: Colors.grey,
              isShowFooterDateText: true,
            ),
            onChangedSelectedDate: (DateTime selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
              });
            },
          ),
          if (_selectedDate != null)
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Ngày: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: TextStyle(fontSize: 18),
                ))
        ],
      ),
    );
  }
}

class Meal extends StatelessWidget {
  const Meal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          MealCard(
            mealTime: 'Sáng',
            mealName: 'Cháo thị bò',
            color: Colors.pink,
            ingredients: 'Tôm, thịt, rau củ, gạo',
          ),
          MealCard(
            mealTime: 'Trưa',
            mealName: 'Bánh mì',
            color: Colors.orange,
            ingredients: 'Tôm, thịt, rau củ, gạo',
          ),
          MealCard(
            mealTime: 'Chiêu',
            mealName: 'Bánh cốm',
            color: Colors.teal,
            ingredients: 'Tôm, thịt, rau củ, gạo',
          )
        ],
      ),
    );
  }
}

class MealCard extends StatefulWidget {
  final String mealTime;
  final String mealName;
  final String ingredients;
  final Color color;

  const MealCard({
    required this.mealTime,
    required this.mealName,
    required this.color,
    required this.ingredients,
    super.key,
  });

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mealTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.mealName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.ingredients,
              style: const TextStyle(fontSize: 16),
            ),
          )
      ],
    );
  }
}

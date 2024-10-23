import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title:
            const Text('Thời khóa biểu', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: const ScheduleBody(),
    );
  }
}

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
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
          ),
        ],
      ),
    );
  }
}

class Meal extends StatelessWidget {
  const Meal({super.key});
  final List<Map<String, String>> activities = const [
    {'time': '07:00 - 08:00', 'activity': 'Đón trẻ', 'color': '0xFFFFB6C1'},
    {'time': '08:00 - 09:00', 'activity': 'Ăn sáng', 'color': '0xFFFFE4B5'},
    {'time': '09:00 - 11:00', 'activity': 'Chơi tự do', 'color': '0xFFAFEEEE'},
    {'time': '11:00 - 12:00', 'activity': 'Ăn trưa', 'color': '0xFFADD8E6'},
    {'time': '12:00 - 14:00', 'activity': 'Ngủ trưa', 'color': '0xFF90EE90'},
    {
      'time': '14:00 - 16:00',
      'activity': 'Chơi và học tập',
      'color': '0xFFDDA0DD'
    },
    {'time': '16:00 - 17:00', 'activity': 'Trả trẻ', 'color': '0xFFFFA07A'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: activities.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ActivityCard(
          time: activities[index]['time']!,
          activity: activities[index]['activity']!,
          color: Color(int.parse(activities[index]['color']!)),
        );
      },
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String time;
  final String activity;
  final Color color;

  const ActivityCard({
    required this.time,
    required this.activity,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  activity,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hotel_app/data/model/hotel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key, required this.hotel});
  final Hotel hotel;
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? _selectedDate;
  bool _isButtonVisible = false;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDate = day;
      _isButtonVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Spacer(),
          Container(
            width: 400,
            height: 40,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Iconsax.arrow_left_2),
                ),
                Spacer(),
                Text(
                  "Calendar",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.setting),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Choose your date",
              style: TextStyle(fontSize: 30),
            ),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: _onDaySelected,
            ),
            if (_isButtonVisible)
              ElevatedButton(
                onPressed: _onSetButtonPressed,
                child: Text("Booking the hotel"),
              ),
            Text("Your hotel"),
            Container(
              width: 327,
              height: 99,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.network(
                      widget.hotel.imageUrls,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.hotel.name),
                      Text(widget.hotel.Price),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Iconsax.arrow_right_3))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSetButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          child: Center(
            child: Text(
              "Your hotel is booked",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
    setState(() {
      _isButtonVisible = false;
    });
  }
}

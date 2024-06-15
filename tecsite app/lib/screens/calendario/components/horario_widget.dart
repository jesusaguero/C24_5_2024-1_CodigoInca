import 'package:flutter/material.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedDayIndex = DateTime.now().weekday - 1; // Convert Sunday=0 to Monday=0
  int startIndex = 0; // Index to control the starting day column

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDayIndex = DateTime.now().weekday - 1;
                      startIndex = 0; // Reset the start index to the current day
                    });
                  },
                  child: Text('Hoy'),
                ),
                Text(
                  'Mayo 21 – 27, 2024',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView(
                children: [
                  Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(color: Colors.grey[200]!, width: 4.0),
                    ),
                    columnWidths: {
                      0: FixedColumnWidth(130),
                      for (int i = 1; i <= 3; i++) i: FixedColumnWidth(130), // Only show 3 columns at a time
                    },
                    children: [
                      _buildTableHeader(),
                      ..._buildTableRows(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Add 20 margin at the bottom
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    List<String> days = ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'];
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Container(
              height: 43,
              child: Center(
                child: Text(
                  'Horas/Días',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        for (int i = 0; i < 3; i++) // Only show 3 columns at a time
          GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = (startIndex + i) % 7; // Update the selected day index
                startIndex = (startIndex + i) % 7; // Update the start index to show selected day as the first day
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Container(
                  height: 43,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (selectedDayIndex == (startIndex + i) % 7)
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              days[(startIndex + i) % 7],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          Text(
                            days[(startIndex + i) % 7],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<TableRow> _buildTableRows() {
    List<String> hours = [
      '08:00 - 08:50 am',
      '08:50 - 09:40 am',
      '09:40 - 10:30 am',
      '10:30 - 11:20 am',
      '11:20 - 12:10 pm',
      '12:10 - 01:00 pm',
      '01:00 - 01:50 pm',
      '01:50 - 02:40 pm',
      '02:40 - 03:30 pm',
      '03:30 - 04:20 pm',
      '04:20 - 05:10 pm',
      '05:10 - 06:00 pm',
      '06:00 - 06:50 pm',
      '06:50 - 07:40 pm',
      '07:40 - 08:30 pm',
      '08:30 - 09:20 pm',
      '09:20 - 10:10 pm',
      '10:10 - 11:00 pm',
    ];

    List<List<String?>> classes = [
      ['1', null, null, null, null, null, null, '1', '1', '1', '1', '1'],
      ['Se vienen cositas', '1', null, null, null, null, null],
      [null, null, '1', null, null, null, null],
      [null, null, null, '1', null, null, null],
      [null, null, null, null, '1', null, 'Asi soy yo ps'],
      [null, null, null, null, null, '1', null],
      ['Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507', null, null, null, null, null, '1'],
    ];

    return List.generate(hours.length, (hourIndex) {
      return TableRow(
        children: [
          Container(
            width: 130,
            height: 150,
            padding: const EdgeInsets.all(2.0),
            child: Center(child: Text(hours[hourIndex])),
          ),
          for (int i = 0; i < 3; i++) // Only show 3 columns at a time
            Container(
              width: 130,
              height: 150,
              padding: EdgeInsets.all(2),
              color: Colors.white,
              child: _getClassForDayAndHour((startIndex + i) % 7, hourIndex, classes),
            ),
        ],
      );
    });
  }

  Widget _getClassForDayAndHour(int dayIndex, int hourIndex, List<List<String?>> classes) {
    if (dayIndex >= 0 && dayIndex < classes.length && hourIndex >= 0 && hourIndex < classes[dayIndex].length) {
      String? className = classes[dayIndex][hourIndex];
      if (className != null) {
        return Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                className,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      } else {
        return Container(
          width: 130,
          height: 150,
          child: Center(
            child: Text(''),
          ),
        );
      }
    } else {
      return Container(
        width: 130,
        height: 150,
        child: Center(
          child: Text(''),
        ),
      );
    }
  }
}

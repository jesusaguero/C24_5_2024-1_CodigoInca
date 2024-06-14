import 'package:flutter/material.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedDayIndex = DateTime.now().weekday - 1; // Convert Sunday=0 to Monday=0

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(130), // Adjusted width for the hours column
                  for (int i = 1; i <= 7; i++) i: FlexColumnWidth(),
                },
                children: [
                  _buildTableHeader(),
                  ..._buildTableRows(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0), // Adjusted padding
          child: Center(
            child: Container(
              height: 43, // Set a fixed height to ensure vertical alignment
              child: Center(
                child: Text(
                  'Horas/Días',
                  textAlign: TextAlign.center, // Center text horizontally
                ),
              ),
            ),
          ),
        ),
        for (int i = 0; i < 7; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = i;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5), // Adjusted padding
              child: Center(
                child: Container(
                  height: 43, // Set a fixed height to ensure vertical alignment
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (selectedDayIndex == i)
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'][i],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13, // Smaller font size
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center, // Center text horizontally
                            ),
                          )
                        else
                          Text(
                            ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'][i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Smaller font size
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center, // Center text horizontally
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
      ['Desarrollo de Soluciones en la Nube', null, null, null, null, null, null, 'Desarrollo de Soluciones en la Nube', 'Desarrollo de Soluciones en la Nube', 'Desarrollo de Soluciones en la Nube', 'Desarrollo de Soluciones en la Nube', 'Desarrollo de Soluciones en la Nube'],
      ['Se vienen cositas', 'Desarrollo de Soluciones en la Nube', null, null, null, null, null],
      [null, null, 'Desarrollo de Soluciones en la Nube', null, null, null, null],
      [null, null, null, 'Desarrollo de Soluciones en la Nube', null, null, null],
      [null, null, null, null, 'Desarrollo de Soluciones en la Nube', null, 'Asi soy yo ps'],
      [null, null, null, null, null, 'Desarrollo de Soluciones en la Nube', null],
      ['Awawero ya tu sabes todo mi kong', null, null, null, null, null, 'Desarrollo de Soluciones en la Nube'],
    ];

    return List.generate(hours.length, (hourIndex) {
      return TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0), // Reduced padding
            child: Center(child: Text(hours[hourIndex])),
          ),
          for (int i = 0; i < 7; i++)
            Container(
              padding: EdgeInsets.all(2), // Reduced padding
              color: Colors.white, // No change color of the cell
              child: _getClassForDayAndHour(i, hourIndex, classes),
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
          decoration: BoxDecoration(
            color: Colors.white, // Keep the cell background white
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(className),
            ),
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }
}

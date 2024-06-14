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
                  0: FixedColumnWidth(100),
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
          padding: const EdgeInsets.all(8.0),
          child: Text('Horas/Días'),
        ),
        for (int i = 0; i < 7; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = i;
              });
            },
            child: Container(
              color: selectedDayIndex == i ? Colors.blueAccent : Colors.white,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'][i],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedDayIndex == i ? Colors.white : Colors.black,
                    ),
                  ),
                  if (selectedDayIndex == i) CircleAvatar(radius: 4, backgroundColor: Colors.white),
                ],
              ),
            ),
          ),
      ],
    );
  }


  List<TableRow> _buildTableRows() {
    List<String> days = ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'];
    List<String> hours = [
      '8:00 - 8:50 am',
      '8:50 - 9:40 am',
      '9:40 - 10:30 am',
      '10:30 - 11:20 am',
      '11:20 - 12:10 pm',
      '12:10 - 1:00 pm',
      '1:00 - 1:50 pm',
      '1:50 - 2:40 pm',
      '2:40 - 3:30 pm',
      '3:30 - 4:20 pm',
      '4:20 - 5:10 pm',
      '5:10 - 6:00 pm',
      '6:00 - 6:50 pm',
      '6:50 - 7:40 pm',
      '7:40 - 8:30 pm',
      '8:30 - 9:20 pm',
      '9:20 - 10:10 pm',
      '10:10 - 11:00 pm',
    ];

    List<List<String?>> classes = [
      // Horarios para cada día de la semana
      ['Desarrollo de Soluciones en la Nube', null, null, null, null, null, null, 'Desarrollo de Soluciones en la Nube','Desarrollo de Soluciones en la Nube','Desarrollo de Soluciones en la Nube','Desarrollo de Soluciones en la Nube','Desarrollo de Soluciones en la Nube'  ],
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
            padding: const EdgeInsets.all(8.0),
            child: Text(hours[hourIndex]),
          ),
          for (int i = 0; i < 7; i++)
            Container(
              padding: EdgeInsets.all(8),
              color: i == selectedDayIndex ? Colors.blueAccent.withOpacity(0.2) : Colors.white,
              child: _getClassForDayAndHour(i, hourIndex, classes),
            ),
        ],
      );
    });
  }

  Widget _getClassForDayAndHour(int dayIndex, int hourIndex, List<List<String?>> classes) {
    // Verifica si dayIndex y hourIndex están dentro del rango correcto antes de usarlos para acceder a la lista
    if (dayIndex >= 0 && dayIndex < classes.length && hourIndex >= 0 && hourIndex < classes[dayIndex].length) {
      String? className = classes[dayIndex][hourIndex];
      if (className != null) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(child: Text(className)),
        );
      } else {
        return SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }

}

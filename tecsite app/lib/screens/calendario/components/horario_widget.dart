import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './../curso.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedDayIndex = DateTime.now().weekday - 1; 
  int startIndex = DateTime.now().weekday - 1; 

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es', null); 
  }

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
                      selectedDate = DateTime.now();
                      selectedDayIndex = DateTime.now().weekday - 1;
                      startIndex = DateTime.now().weekday - 1; 
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, 
                    foregroundColor: Color(0xFF004C83), 
                    side: BorderSide(color: Colors.grey[300]!), 
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Hoy'),
                ),
                Text(
                  _getFormattedWeekRange(selectedDate),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF004C83)),
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
                      for (int i = 1; i <= 3; i++) i: FixedColumnWidth(130), 
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
          SizedBox(height: 20),
        ],
      ),
    );
  }

  String _getFormattedWeekRange(DateTime date) {
    final DateTime firstDayOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final DateTime lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));
    final DateFormat formatter = DateFormat('MMMM d', 'es'); 

    String firstDayFormatted = toBeginningOfSentenceCase(formatter.format(firstDayOfWeek))!;
    String lastDayFormatted = DateFormat('d', 'es').format(lastDayOfWeek);
    String year = date.year.toString();

    return '$firstDayFormatted – $lastDayFormatted, $year';
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
                child: Icon(
                  Icons.access_time,
                  size: 30,
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
        ),
        for (int i = 0; i < 3; i++) 
          GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = (startIndex + i) % 7; 
                startIndex = (startIndex + i) % 7; 
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
                            backgroundColor: Color(0xFF004C83),
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
                              color: Color(0xFF004C83),
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

    List<List<Curso?>> classes = [
      [
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507', Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null, null, null, null, null, null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
      ],
      [
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null, null, null, null, null
      ],
      [
        null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        Curso('1',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null, null, null, null
      ],
      [
        null, null, null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null, null, null
      ],
      [
        null, null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39))
      ],
      [
        null, null, null, null, null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null
      ],
      [
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39)),
        null, null, null, null, null,
        Curso('Desarrollo de Aplicaciones Web Avanzado y soluciones en la nube. Aula: 1507',Color.fromARGB(255, 236, 246, 237), Color(0xFF29CC39))
      ],
    ];

    return List.generate(hours.length, (hourIndex) {
      return TableRow(
        children: [
          Container(
            width: 130,
            height: 150,
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                hours[hourIndex],
                style: TextStyle(
                  color: Color(0xFF004C83),
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
          ),
          for (int i = 0; i < 3; i++) 
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

  Widget _getClassForDayAndHour(int dayIndex, int hourIndex, List<List<Curso?>> classes) {
    if (dayIndex >= 0 && dayIndex < classes.length && hourIndex >= 0 && hourIndex < classes[dayIndex].length) {
      Curso? curso = classes[dayIndex][hourIndex];
      if (curso != null) {
        return Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: curso.fondo,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: curso.borde, width: 3), 
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                curso.nombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF004C83), 
                  fontWeight: FontWeight.bold, 
                ),
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

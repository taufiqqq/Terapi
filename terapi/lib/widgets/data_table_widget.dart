import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      // ignore: deprecated_member_use
      dataRowHeight: 50,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'State',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Therapist',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Num Client',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Perlis')),
            DataCell(Text('1')),
            DataCell(Text('386')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Perak')),
            DataCell(Text('8')),
            DataCell(Text('5287')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Pulau Pinang')),
            DataCell(Text('3')),
            DataCell(Text('1821')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Kedah')),
            DataCell(Text('5')),
            DataCell(Text('2395')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Selangor')),
            DataCell(Text('18')),
            DataCell(Text('4610')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Kuala Lumpur')),
            DataCell(Text('11')),
            DataCell(Text('3079')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Putrajaya')),
            DataCell(Text('1')),
            DataCell(Text('212')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Negeri Sembilan')),
            DataCell(Text('3')),
            DataCell(Text('1484')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Melaka')),
            DataCell(Text('1')),
            DataCell(Text('276')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Johor')),
            DataCell(Text('10')),
            DataCell(Text('7795')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Pahang')),
            DataCell(Text('4')),
            DataCell(Text('1066')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Kelantan')),
            DataCell(Text('4')),
            DataCell(Text('2433')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Terengganu')),
            DataCell(Text('3')),
            DataCell(Text('605')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarawak')),
            DataCell(Text('8')),
            DataCell(Text('1466')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sabah')),
            DataCell(Text('9')),
            DataCell(Text('2279')),
          ],
        ),
      ],
    );
  }
}

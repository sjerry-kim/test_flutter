import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '/domain/employee.dart';
import 'package:flutter/material.dart';

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    _employees = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<int>(columnName: 'age', value: e.age),
    ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(cell.value.toString(), style: TextStyle(fontSize: 14)),
        );
      }).toList(),
    );
  }
}

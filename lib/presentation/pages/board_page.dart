import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '/domain/employee.dart';
import '/data/employee_data_source.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key, required this.title});
  final String title; // 위젯의 속성

  @override
  _BoardPageState createState() => _BoardPageState();  // 여기서 State 객체를 반환
}

class _BoardPageState extends State<BoardPage> {
  late EmployeeDataSource _employeeDataSource;
  final List<Employee> _employees = [
    Employee('홍길동', 25),
    Employee('김철수', 30),
    Employee('이영희', 28),
    Employee('박민수', 22),
  ];

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource(_employees); // 데이터 소스 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,  // 왼쪽 정렬
          child: Text(widget.title),
        ),
      ),
      body: Center(  // 표를 화면 중앙에 정렬
        child: Padding(
          padding: EdgeInsets.all(8),  // 전체 여백 추가
          child: Column(
            mainAxisSize: MainAxisSize.min, // 자식 위젯이 크기에 맞게 정렬
            children: [
              Expanded( // 가용 공간을 모두 차지하도록
                child: SfDataGrid(
                  source: _employeeDataSource, // 데이터 소스를 지정
                  columns: [ // 테이블 열 정의
                    GridColumn(
                      columnName: 'name', // 첫 번째 열: 이름
                      label: _buildHeaderCell('이름'), // 열 제목
                    ),
                    GridColumn(
                      columnName: 'age', // 두 번째 열: 나이
                      label: _buildHeaderCell('나이'), // 열 제목
                    ),
                  ],
                  gridLinesVisibility: GridLinesVisibility.both, // 그리드 선 표시
                  headerGridLinesVisibility: GridLinesVisibility.both, // 헤더 그리드 선 표시
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }





  Widget _buildHeaderCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),  // 내부 여백 설정
      alignment: Alignment.center,
      color: Colors.blue[100],
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

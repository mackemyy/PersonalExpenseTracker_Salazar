import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String weekdayLabel;
  final double expenditure;
  final double expenditurePerc;

  const BarChart(this.weekdayLabel, this.expenditure, this.expenditurePerc);

  @override
  Widget build(BuildContext context) {
    print('build() BarChart');
    return LayoutBuilder(
      builder: (context, constraint) {
      return  Column(
      children: <Widget>[
        Container(
          height: constraint.maxHeight * 0.15,
          child: FittedBox(
            child: Text('₱' + expenditure.toStringAsFixed(0)),
          ),
        ),
        SizedBox(
          height: constraint.maxHeight * 0.05,
        ),
        Container(
          height: constraint.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: expenditurePerc,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: constraint.maxHeight * 0.05,
        ),
        Container(
          height: constraint.maxHeight * 0.15,
          child: FittedBox(
            child: Text(weekdayLabel))),
      ],
    );
    },);

  }
}

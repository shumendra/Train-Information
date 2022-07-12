// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:androgames_assignment/model/train_info_model.dart';
import 'package:androgames_assignment/services/train_info_services.dart';
import 'package:flutter/material.dart';

class TrainInfo extends StatefulWidget {
  final String trainNumber;
  const TrainInfo({Key? key, required this.trainNumber}) : super(key: key);

  @override
  State<TrainInfo> createState() => _TrainInfoState();
}

class _TrainInfoState extends State<TrainInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Androgames'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              TrainInfoServices().getTrainInfo(trainNumber: widget.trainNumber),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              TrainInfoModel trainInfo = snapshot.data as TrainInfoModel;
              Data? trainData = trainInfo.data;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Information for Train Number: ${widget.trainNumber}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Classes available",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  DataTable(
                      columns: [
                        DataColumn(label: Text('No.')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Code')),
                      ],
                      rows: List.generate(
                          trainData!.trainClass!.length,
                          (index) => DataRow(cells: [
                                DataCell(Text((index + 1).toString())),
                                DataCell(Text(trainData.trainClass![index].name
                                    .toString())),
                                DataCell(Text(trainData.trainClass![index].value
                                    .toString())),
                              ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      thickness: 8,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Quota Types",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  DataTable(
                      columns: [
                        DataColumn(
                          label: Text('No.'),
                        ),
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Code'),
                        ),
                      ],
                      rows: List.generate(
                          trainData.quota!.length,
                          (index) => DataRow(cells: [
                                DataCell(Text((index + 1).toString())),
                                DataCell(Text(
                                    trainData.quota![index].name.toString())),
                                DataCell(Text(
                                    trainData.quota![index].value.toString()))
                              ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      thickness: 8,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Train Route ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('No.')),
                        DataColumn(label: Text('Day')),
                        DataColumn(label: Text('Source Dist')),
                        DataColumn(label: Text('Station Name')),
                        DataColumn(label: Text('Station Code')),
                        DataColumn(label: Text('State Name')),
                        DataColumn(label: Text('State Code')),
                        DataColumn(label: Text('Stop')),
                        DataColumn(label: Text('Source')),
                        DataColumn(label: Text('Platform')),
                      ],
                      rows: List.generate(
                          trainData.route!.length,
                          (index) => DataRow(cells: [
                                DataCell(Text((index + 1).toString())),
                                DataCell(Text(
                                    trainData.route![index].day.toString())),
                                DataCell(Text(trainData
                                        .route![index].distanceFromSource
                                        .toString() +
                                    ' km')),
                                DataCell(Text(trainData
                                    .route![index].stationName
                                    .toString())),
                                DataCell(Text(trainData
                                    .route![index].stationCode
                                    .toString())),
                                DataCell(Text(trainData.route![index].stateName
                                    .toString())),
                                DataCell(Text(trainData.route![index].stateCode
                                    .toString())),
                                DataCell(Text(
                                    trainData.route![index].stop.toString())),
                                DataCell(Text(trainData.route![index].trainSrc
                                    .toString())),
                                DataCell(Text(trainData
                                    .route![index].platformNumber
                                    .toString())),
                              ])),
                    ),
                  )
                ],
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Incorrect Input. Try Again!'),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

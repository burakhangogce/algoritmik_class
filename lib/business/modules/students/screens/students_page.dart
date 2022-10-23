import 'package:algoritmik_class/business/models/classes/classes_output_model.dart';
import 'package:algoritmik_class/business/modules/students/controller/student_controller.dart';
import 'package:algoritmik_class/constants/app_color.dart';
import 'package:algoritmik_class/constants/app_theme.dart';
import 'package:algoritmik_class/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../models/students/students_output_model.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<StudentsOutputModel> dataStudents = [];
    List<ClassesOutputModel> dataClasses = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Öğrencilerim",
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: DuoToneFontAwesomeIcon(
                iconSource: IconFont.plus,
                firstColor: primaryTextColor,
                iconSize: 24,
                secondColor: primaryTextColor,
                iconSecondSource: SecondIconFont.plus),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(children: [
        Consumer<StudentsController>(
            builder: (BuildContext context, controller, Widget? child) {
          return Column(
            children: [
              FutureBuilder<dynamic>(
                  future: controller.contGetClasses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      dataClasses = snapshot.data!;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: pageHeight * 0.1,
                        width: pageWidht * 0.9,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: fistBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: background2Color),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSelectedIndex(-1);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: controller.selectedId == -1
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: const Center(
                                  child: Text(
                                    "All",
                                    style: AppTheme.notoSansMed14PrimaryText,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: dataClasses.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.setSelectedIndex(
                                            dataClasses[index].classId);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(4),
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: controller.selectedId ==
                                                  dataClasses[index].classId
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            dataClasses[index].className,
                                            style: AppTheme
                                                .notoSansMed14PrimaryText,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  }),
              FutureBuilder<dynamic>(
                  future: controller.selectedId == -1
                      ? controller.contGetStudents()
                      : controller.contGetStudentsClass(controller.selectedId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      dataStudents = snapshot.data!;
                      return SizedBox(
                        height: pageHeight * 0.7,
                        child: ListView.builder(
                            itemCount: dataStudents.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/studentdetails',
                                    arguments: dataStudents[index],
                                  );
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: secondIconColor,
                                    child: Text(
                                      'BG',
                                      style: AppTheme.notoSansSB16PrimaryText,
                                    ),
                                  ),
                                  title: Text(dataStudents[index].studentName),
                                  trailing: const Icon(Icons.more_vert),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  }),
            ],
          );
        }),
      ]),
    );
  }
}

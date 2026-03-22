import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../ui/widgets/cfop_arrow_element.dart';

class PLLCaseIcon extends StatelessWidget {
  final List<String> caseConfiguration;
  final List<List> arrows;

  const PLLCaseIcon({
    required this.caseConfiguration,
    required this.arrows,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const int lineThickness = 2;

    // draw side pieces in their colors:
    List<Color> sideColors = [];
    for (String color in caseConfiguration) {
      switch (color) {
        case ("g"):
          sideColors.add(Colors.green);
        case ("r"):
          sideColors.add(Colors.red);
        case ("b"):
          sideColors.add(Colors.blue);
        case ("o"):
          sideColors.add(Colors.orange);
        default:
          sideColors.add(const Color.fromRGBO(100, 100, 100, 1));
      }
    }

    // configure arrows:
    String? targetId1;
    String? targetId2;
    String? targetId3;
    String? targetId4;
    String? targetId5;
    String? targetId6;
    String? targetId7;
    String? targetId8;
    String? targetId9;

    bool isDoubleSided1 = false;
    bool isDoubleSided2 = false;
    bool isDoubleSided3 = false;
    bool isDoubleSided4 = false;
    bool isDoubleSided5 = false;
    bool isDoubleSided6 = false;
    bool isDoubleSided7 = false;
    bool isDoubleSided8 = false;
    bool isDoubleSided9 = false;

    // draw arrows:
    // to configure arrow style go to "cfop_arrow_element.dart"

    for (var arrow in arrows) {
      switch (arrow[0]) {
        case (1):
          targetId1 = arrow[1].toString();
          isDoubleSided1 = arrow[2];
        case (2):
          targetId2 = arrow[1].toString();
          isDoubleSided2 = arrow[2];
        case (3):
          targetId3 = arrow[1].toString();
          isDoubleSided3 = arrow[2];
        case (4):
          targetId4 = arrow[1].toString();
          isDoubleSided4 = arrow[2];
        case (5):
          targetId5 = arrow[1].toString();
          isDoubleSided5 = arrow[2];
        case (6):
          targetId6 = arrow[1].toString();
          isDoubleSided6 = arrow[2];
        case (7):
          targetId7 = arrow[1].toString();
          isDoubleSided7 = arrow[2];
        case (8):
          targetId8 = arrow[1].toString();
          isDoubleSided8 = arrow[2];
        case (9):
          targetId9 = arrow[1].toString();
          isDoubleSided9 = arrow[2];
      }
    }

    // Grid information:
    // thickness center piece: 9
    // thickness cornder piece: 3
    // total thickness: 33 + 6 * LINE_THICKNESS

    return ArrowContainer(
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Expanded(
                flex: lineThickness,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      flex: 27 + 4 * lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[0])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[1])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[2])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: lineThickness,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[11])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "1",
                      targetId: targetId1,
                      doubleSided: isDoubleSided1,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "2",
                      targetId: targetId2,
                      doubleSided: isDoubleSided2,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "3",
                      targetId: targetId3,
                      doubleSided: isDoubleSided3,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[3])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: lineThickness,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[10])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "4",
                      targetId: targetId4,
                      doubleSided: isDoubleSided4,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "5",
                      targetId: targetId5,
                      doubleSided: isDoubleSided5,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "6",
                      targetId: targetId6,
                      doubleSided: isDoubleSided6,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[4])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: lineThickness,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[9])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "7",
                      targetId: targetId7,
                      doubleSided: isDoubleSided7,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "8",
                      targetId: targetId8,
                      doubleSided: isDoubleSided8,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    CFOPArrowElement(
                      id: "9",
                      targetId: targetId9,
                      doubleSided: isDoubleSided9,
                      child: Expanded(
                        flex: 9,
                        child: Container(color: Colors.yellow),
                      ),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 3, child: Container(color: sideColors[5])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: lineThickness,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[8])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[7])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(flex: 9, child: Container(color: sideColors[6])),
                    Expanded(
                      flex: lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: lineThickness,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      flex: 27 + 4 * lineThickness,
                      child: Container(color: Colors.black),
                    ),
                    Expanded(
                      flex: 3 + lineThickness,
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

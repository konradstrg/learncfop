import 'package:flutter/material.dart';

class OLLCaseIcon extends StatelessWidget {
  final List<int> caseConfiguration;
  const OLLCaseIcon({required this.caseConfiguration, super.key});

  @override
  Widget build(BuildContext context) {
    const int lineThickness = 2;

    // generate grey/yellow color list:
    List<Color> colors = List.generate(
      22,
      (_) => const Color.fromRGBO(100, 100, 100, 1),
    );
    for (int index in caseConfiguration) {
      colors[index] = Colors.yellow;
    }

    // Grid information:
    // thickness center piece: 9
    // thickness cornder piece: 3
    // total thickness: 33 + 6 * LINE_THICKNESS

    return SizedBox(
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
                  Expanded(flex: 9, child: Container(color: colors[1])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[2])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[3])),
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
                  Expanded(flex: 3, child: Container(color: colors[4])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[5])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[6])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[7])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 3, child: Container(color: colors[8])),
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
                  Expanded(flex: 3, child: Container(color: colors[9])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[10])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[11])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[12])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 3, child: Container(color: colors[13])),
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
                  Expanded(flex: 3, child: Container(color: colors[14])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[15])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[16])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[17])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 3, child: Container(color: colors[18])),
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
                  Expanded(flex: 9, child: Container(color: colors[19])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[20])),
                  Expanded(
                    flex: lineThickness,
                    child: Container(color: Colors.black),
                  ),
                  Expanded(flex: 9, child: Container(color: colors[21])),
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
    );
  }
}

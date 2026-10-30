import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable({required this.character, super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.points > 0
                      ? Colors.yellow
                      : Colors.grey,
                ),
                SizedBox(width: 20),
                const StyledText('Stat points available: '),
                const Expanded(child: SizedBox(width: 0)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStat(stat['title']!);
                          });
                        },
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.arrow_upward),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.decreaseStat(stat['title']!);
                          });
                        },
                        icon: Icon(Icons.arrow_downward),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

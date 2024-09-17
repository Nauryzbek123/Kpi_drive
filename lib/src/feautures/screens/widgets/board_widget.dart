import 'package:flutter/material.dart';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/bloc/board_bloc.dart';

import '../home/logic/model/indicatorModel.dart';

class MultiBoardListExample extends StatefulWidget {
  final List<IndicatorModel> indicatorData;
  const MultiBoardListExample({Key? key, required this.indicatorData})
      : super(key: key);

  @override
  State<MultiBoardListExample> createState() => _MultiBoardListExampleState();
}

class _MultiBoardListExampleState extends State<MultiBoardListExample> {
  late AppFlowyBoardScrollController boardController;

  late final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
      print("${groupId}, ${fromIndex}, ${toIndex}");
      final correctIndex = fromIndex + 1;
      final indicator = widget.indicatorData.firstWhere(
        (indicator) => indicator.data.rows
            .any((row) => row.parentId.toString() == groupId),
      );
      print("object ${indicator}");
      final row = indicator.data.rows.firstWhere(
        (row) => row.order == correctIndex,
      );
      final indicator_to_mo_id = row.indicatorToMoId;
      print('indicator_tomo ${indicator_to_mo_id}');
      context.read<BoardBloc>().add(PostIndicatorData(
          indicatorToMoId: indicator_to_mo_id.toString(),
          fieldName: 'order',
          fieldValue: toIndex.toString()));
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  @override
  void initState() {
    super.initState();
    boardController = AppFlowyBoardScrollController();

    final Map<int, AppFlowyGroupData> groups = {};

    for (var indicator in widget.indicatorData) {
      indicator.data.rows.sort((a, b) => a.order.compareTo(b.order));
      for (var row in indicator.data.rows) {
        final parentId = row.parentId;
        if (!groups.containsKey(parentId)) {
          groups[parentId] = AppFlowyGroupData(
            id: parentId.toString(),
            name: 'Group $parentId',
            items: [],
          );
        }

        final groupData = groups[parentId]!;
        final groupItems = List<AppFlowyGroupItem>.from(groupData.items);
        groupItems.add(TextItem(
          row.name,
        ));

        groups[parentId] = AppFlowyGroupData(
          id: parentId.toString(),
          name: groupData.id,
          items: groupItems,
        );
      }
    }

    groups.forEach((parentId, groupData) {
      controller.addGroup(groupData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: HexColor.fromHex('#F7F8FC'),
      stretchGroupHeight: false,
    );
     return AppFlowyBoard(
            controller: controller,
            cardBuilder: (context, group, groupItem) {
              return AppFlowyGroupCard(
                key: ValueKey(groupItem.id),
                child: _buildCard(groupItem),
              );
            },
            boardScrollController: boardController,
            footerBuilder: (context, columnData) {
              return AppFlowyGroupFooter(
                icon: const Icon(Icons.add, size: 20),
                title: const Text('New'),
                height: 50,
                margin: config.groupBodyPadding,
                onAddButtonClick: () {
                  boardController.scrollToBottom(columnData.id);
                },
              );
            },
            headerBuilder: (context, columnData) {
              return AppFlowyGroupHeader(
                icon: const Icon(Icons.lightbulb_circle),
                title: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: TextEditingController()
                      ..text = columnData.headerData.groupName,
                    onSubmitted: (val) {
                      controller
                          .getGroupController(columnData.headerData.groupId)!
                          .updateGroupName(val);
                    },
                  ),
                ),
                addIcon: const Icon(Icons.add, size: 20),
                moreIcon: const Icon(Icons.more_horiz, size: 20),
                height: 50,
                margin: config.groupBodyPadding,
              );
            },
            groupConstraints: const BoxConstraints.tightFor(width: 400),
            config: config,
          );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItem) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(item.s),
        ),
      );
    }

    throw UnimplementedError();
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

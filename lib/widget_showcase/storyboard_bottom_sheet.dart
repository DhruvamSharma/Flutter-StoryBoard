import 'package:flutter/material.dart';
import 'package:storyboard/utils/colors.dart';
import 'package:storyboard/utils/list_item_widget.dart';
import 'package:storyboard/widget_showcase/bottom_sheet_bloc.dart';

class StoryBoardBottomSheet extends StatefulWidget {
  final List<Widget> listOfWidgetInCurrentLibrary;
  final List<String> listOfNamesOfWidgetInCurrentLibrary;

  StoryBoardBottomSheet({
    this.listOfWidgetInCurrentLibrary,
    this.listOfNamesOfWidgetInCurrentLibrary,
  });

  @override
  _StoryBoardBottomSheetState createState() => _StoryBoardBottomSheetState();
}

class _StoryBoardBottomSheetState extends State<StoryBoardBottomSheet> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: primaryColor,
      onClosing: () {},
      enableDrag: true,
      elevation: 8,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Widget States',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      trailing: IconButton(
                          icon: Icon(isExpanded
                              ? Icons.arrow_downward
                              : Icons.arrow_upward),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          }),
                    ),
                  ),
                  AnimatedContainer(
                    padding: EdgeInsets.only(bottom: 0),
                    duration: Duration(milliseconds: 50),
                    height: isExpanded
                        ? (30.0 *
                                widget.listOfNamesOfWidgetInCurrentLibrary
                                    .length) +
                            40
                        : 0,
                    constraints: BoxConstraints(
                      maxHeight: 400,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...widget.listOfNamesOfWidgetInCurrentLibrary.map((it) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                bloc.updateIndex(widget
                                    .listOfNamesOfWidgetInCurrentLibrary
                                    .indexOf(it));
                              },
                              child: ListItemWidget(it),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

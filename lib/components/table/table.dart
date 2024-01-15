import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tembo_core/extensions/source.dart';

import 'models.dart';

class TemboTable extends StatefulWidget {
  final List<TemboTableColumn> columns;
  final List<TemboTableRow> rows;
  final double rowHeight, titleRowTableRowsSpace, spaceBtnRows, titleRowHeight;
  final Color titleRowBackgroundColor;
  final List<Widget>? actions;
  final bool hasDivider, hasTitleColumn;

  final Decoration? titleRowDecoration;

  final bool Function(double availableWidth)? convertToScrollableModeWhen;

  /// full table width
  final double? width;

  const TemboTable({
    required this.columns,
    required this.rows,
    this.rowHeight = 50,
    this.titleRowHeight = 50,
    this.width,
    this.actions,
    this.hasDivider = true,
    this.hasTitleColumn = true,
    this.spaceBtnRows = 0,
    this.titleRowTableRowsSpace = 0,
    this.titleRowBackgroundColor = const Color(0xffF9FAFB),
    this.convertToScrollableModeWhen,
    this.titleRowDecoration,
    super.key,
  });

  double get tableWidth => width ?? 800;

  @override
  State<TemboTable> createState() => _TemboTableState();
}

class _TemboTableState extends State<TemboTable> {
  late final LinkedScrollControllerGroup _controllers;

  final tableRowsController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double _maxWidth = 0;

  double get getTableWidth =>
      _maxWidth >= widget.tableWidth ? _maxWidth : widget.tableWidth;

  double getColumnWidth(int columnIndex) {
    final column = widget.columns[columnIndex];
    return column.fixedWidth?.toDouble() ??
        getTableWidth / widget.columns.length;
  }

  double getMobileColumnWidth(int columnIndex) {
    final column = widget.columns[columnIndex];
    return column.fixedWidth?.toDouble() ??
        getTableWidth / widget.columns.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constr) {
          _maxWidth = constr.maxWidth;

          final convertToScrollable =
              (widget.convertToScrollableModeWhen != null &&
                      widget.convertToScrollableModeWhen!(_maxWidth) == true) ||
                  _maxWidth < widget.tableWidth;

          if (convertToScrollable) {
            return Column(
              children: [
                if (widget.hasTitleColumn) buildMobileTableColumns(),
                if (widget.hasTitleColumn)
                  SizedBox(height: widget.titleRowTableRowsSpace),
                Expanded(
                  child: SizedBox(
                    width: getTableWidth,
                    child: ListView.separated(
                      itemCount: widget.rows.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => widget.hasDivider
                          ? Container(
                              height: 1,
                              width: double.maxFinite,
                              color: const Color(0xffE4E7EC),
                            )
                          : SizedBox(height: widget.spaceBtnRows),
                      itemBuilder: (_, index) {
                        return buildMobileTableRow(widget.rows[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              if (widget.hasTitleColumn) buildColumns(),
              if (widget.hasTitleColumn)
                SizedBox(height: widget.titleRowTableRowsSpace),
              Expanded(
                child: SizedBox(
                  width: getTableWidth,
                  child: ListView.separated(
                    itemCount: widget.rows.length,
                    separatorBuilder: (context, index) => widget.hasDivider
                        ? Container(
                            height: 1,
                            width: double.maxFinite,
                            color: const Color(0xffE4E7EC),
                          )
                        : SizedBox(height: widget.spaceBtnRows),
                    itemBuilder: (_, index) {
                      return buildRow(widget.rows[index]);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildColumns() {
    return DefaultTextStyle(
      style: context.textTheme.bodyMedium!
          .copyWith(color: const Color(0xff1C1C1E)),
      child: LayoutBuilder(
        builder: (context, constr) {
          _maxWidth = constr.maxWidth;

          return Container(
              height: widget.titleRowHeight,
              width: getTableWidth,
              decoration: widget.titleRowDecoration ??
                  BoxDecoration(
                    color: widget.titleRowBackgroundColor,
                    border: const Border(
                      bottom: BorderSide(color: Color(0xffE4E7EC)),
                    ),
                  ),
              child: Row(
                children: List.generate(
                  widget.columns.length,
                  (index) => index == widget.columns.length - 1 &&
                          widget.actions != null
                      ? Container(
                          width: getColumnWidth(index),
                          margin: widget.columns[index].margin,
                          child: Row(
                            children: [
                              widget.columns[index].label,
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: widget.actions!,
                              ))
                            ],
                          ),
                        )
                      : Container(
                          alignment: widget.columns[index].alignment,
                          width: getColumnWidth(index),
                          margin: widget.columns[index].margin,
                          child: widget.columns[index].label,
                        ),
                ),
              ));
        },
      ),
    );
  }

  Widget buildRow(TemboTableRow row) {
    Color? color;

    return DefaultTextStyle(
      style: context.textTheme.bodyMedium.withFW300,
      child: StatefulBuilder(builder: (context, setState) {
        return LayoutBuilder(
          builder: (context, constr) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                color = Colors.grey.shade50;
                setState(() {});
              },
              onExit: (event) {
                color = null;
                setState(() {});
              },
              child: GestureDetector(
                onTap: () {
                  if (row.onTap != null) row.onTap!();
                },
                child: Container(
                  height: widget.rowHeight,
                  decoration: getRowDecoration(row.decoration, row.index)
                      .copyWith(color: color ?? Colors.transparent),
                  child: Row(
                      children: List.generate(
                          row.cells.length,
                          (index) => Padding(
                                padding: widget.columns[index].margin ??
                                    EdgeInsets.zero,
                                child: SizedBox(
                                  width: getColumnWidth(index) -
                                      // to allow for space taken the borders, it is actually
                                      // affecting only the first and last cells in a row
                                      (row.decoration.isBordered
                                          ? (row.decoration
                                                  as BorderedRowDecoration)
                                              .borderWidth
                                          : 0),
                                  child: Align(
                                      alignment: row.cells[index].alignment,
                                      child: row.cells[index].child),
                                ),
                              ))),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget buildMobileTableColumns() {
    Widget buildColumn(int index) {
      final width = getMobileColumnWidth(index);
      return Container(
        alignment: widget.columns[index].alignment,
        width: width.toDouble(),
        margin: widget.columns[index].margin,
        child: widget.columns[index].label,
      );
    }

    return DefaultTextStyle(
      style: context.textTheme.bodyMedium!
          .copyWith(color: const Color(0xff1C1C1E)),
      child: Container(
        height: widget.titleRowHeight,
        decoration: widget.titleRowDecoration ??
            BoxDecoration(
              color: widget.titleRowBackgroundColor,
              border: const Border(
                bottom: BorderSide(color: Color(0xffE4E7EC)),
              ),
            ),
        child: ListView(
          key: UniqueKey(),
          controller: _controllers.addAndGet(),
          scrollDirection: Axis.horizontal,
          children: List.generate(
            widget.columns.length,
            (index) {
              final width = getMobileColumnWidth(index);
              return index == widget.columns.length - 1 &&
                      widget.actions != null
                  ? Padding(
                      padding: widget.columns[index].margin ?? EdgeInsets.zero,
                      child: SizedBox(
                        width: width,
                        child: Row(
                          children: [
                            widget.columns[index].label,
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: widget.actions!,
                            ))
                          ],
                        ),
                      ),
                    )
                  : buildColumn(index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildMobileTableRow(TemboTableRow row) {
    Color? color;
    return DefaultTextStyle(
      style: context.textTheme.bodyMedium.withFW300,
      child: StatefulBuilder(
        builder: (context, setState) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) => setState(() => color = Colors.grey.shade50),
            onExit: (event) => setState(() => color = null),
            child: GestureDetector(
              onTap: () {
                if (row.onTap != null) row.onTap!();
              },
              child: Container(
                height: widget.rowHeight,
                decoration: getRowDecoration(row.decoration, row.index)
                    .copyWith(color: color),
                child: ListView(
                  key: UniqueKey(),
                  controller: _controllers.addAndGet(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    row.cells.length,
                    (index) {
                      final width = getMobileColumnWidth(index);

                      return Padding(
                        padding:
                            widget.columns[index].margin ?? EdgeInsets.zero,
                        child: SizedBox(
                          width: width,
                          child: Align(
                              alignment: row.cells[index].alignment,
                              child: row.cells[index].child),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration getRowDecoration(RowDecoration decoration, int rowIndex) {
    return BoxDecoration(
      color: decoration.isZebraColored
          ? (decoration as ZebraColoredRowDecoration).condition(rowIndex) == 1
              ? decoration.color1
              : decoration.color2
          : Colors.white,
      borderRadius: decoration.isBordered
          ? BorderRadius.circular(
              (decoration as BorderedRowDecoration).borderRadius)
          : null,
      border: decoration.isBordered
          ? Border.all(
              color: (decoration as BorderedRowDecoration).borderColor,
              width: (decoration).borderWidth,
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/source.dart';

import 'models.dart';

class TemboFlexibleTable extends StatefulWidget {
  final List<TemboTableColumn> columns;
  final List<TemboTableRow> rows;
  final double rowHeight, titleRowTableRowsSpace, spaceBtnRows, titleRowHeight;
  final Color titleRowBackgroundColor;
  final List<Widget>? actions;
  final bool hasDivider, hasTitleColumn;

  final Decoration? titleRowDecoration;

  /// full table width
  final double? width;

  const TemboFlexibleTable({
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
    this.titleRowDecoration,
    super.key,
  });

  double get tableWidth => width ?? 800;

  @override
  State<TemboFlexibleTable> createState() => _TemboTableState();
}

class _TemboTableState extends State<TemboFlexibleTable> {
  double getColumnWidth(int columnIndex) {
    final column = widget.columns[columnIndex];
    return column.fixedWidth?.toDouble() ??
        widget.tableWidth / widget.columns.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constr) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.hasTitleColumn) buildColumns(),
              if (widget.hasTitleColumn)
                SizedBox(height: widget.titleRowTableRowsSpace),
              SizedBox(
                width: widget.width ?? 800,
                child: ListView.separated(
                  itemCount: widget.rows.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
      child: Container(
        width: widget.tableWidth,
        height: widget.titleRowHeight,
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
            (index) =>
                index == widget.columns.length - 1 && widget.actions != null
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
        ),
      ),
    );
  }

  Widget buildRow(TemboTableRow row) {
    return DefaultTextStyle(
      style: context.textTheme.bodyMedium.withFW300,
      child: LayoutBuilder(
        builder: (context, constr) {
          return GestureDetector(
            onTap: () {
              if (row.onTap != null) row.onTap!();
            },
            child: Container(
              height: widget.rowHeight,
              decoration: getRowDecoration(row.decoration, row.index).copyWith(),
              child: Row(
                children: List.generate(
                  row.cells.length,
                  (index) => Padding(
                    padding: widget.columns[index].margin ?? EdgeInsets.zero,
                    child: SizedBox(
                      width: getColumnWidth(index) -
                          // to allow for space taken the borders, it is actually
                          // affecting only the first and last cells in a row
                          (row.decoration.isBordered
                              ? (row.decoration as BorderedRowDecoration)
                                  .borderWidth
                              : 0),
                      child: Align(
                        alignment: row.cells[index].alignment,
                        child: row.cells[index].child,
                      ),
                    ),
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

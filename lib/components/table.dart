import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import "../source.dart";

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

  List<num> get mobileFlexes =>
      widget.columns.map((e) => e.widthFlex * .85).toList();

  double get totalFlexes =>
      widget.columns.fold(0, (prev, current) => prev + current.widthFlex);

  num get totalFixedWidth =>
      widget.columns.fold<num>(0, (prev, e) => e.totalFixedWidth + prev);

  double getColumnWidth(int columnIndex) {
    final column = widget.columns[columnIndex];
    if (column.hasFixedWidth) return column.fixedWidth!.toDouble();

    final tableWidth =
        _maxWidth >= widget.tableWidth ? _maxWidth : widget.tableWidth;
    final width =
        column.widthFlex / totalFlexes * (tableWidth - totalFixedWidth);
    return width;
  }

  double getMobileColumnWidth(int columnIndex) {
    final column = widget.columns[columnIndex];
    if (column.hasFixedWidth) return column.fixedWidth!.toDouble();
    final width =
        mobileFlexes[columnIndex] / totalFlexes * (800 - totalFixedWidth);
    return width;
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

class TemboTableColumn {
  final Widget label;
  final num widthFlex;
  final num? fixedWidth;
  final Alignment alignment;
  final EdgeInsets? margin;

  bool get hasFixedWidth => fixedWidth != null;

  double get totalFixedWidth {
    final width = fixedWidth?.toDouble() ?? 0.0;
    if (margin != null) {
      return width + margin!.left + margin!.right;
    }
    return width;
  }

  const TemboTableColumn({
    required this.label,
    this.widthFlex = 0,
    this.fixedWidth,
    this.margin,
    this.alignment = Alignment.centerLeft,
  });
}

class TemboTableRow {
  final int index;
  final List<TemboTableRowCell> cells;
  final RowDecoration decoration;
  final VoidCallback? onTap;

  const TemboTableRow({
    required this.index,
    required this.cells,
    this.decoration = const RowDecoration(),
    this.onTap,
  });
}

class TemboTableRowCell {
  final Widget child;
  final Alignment alignment;

  const TemboTableRowCell({
    required this.child,
    this.alignment = Alignment.centerLeft,
  });
}

enum RowDecorationType { bordered, zebraColored, none }

class RowDecoration {
  final RowDecorationType type;

  const RowDecoration({this.type = RowDecorationType.none});

  bool get isBordered => type == RowDecorationType.bordered;

  bool get isZebraColored => type == RowDecorationType.zebraColored;
}

class BorderedRowDecoration extends RowDecoration {
  final Color borderColor;
  final double borderWidth, borderRadius;

  const BorderedRowDecoration({
    this.borderWidth = 1.0,
    this.borderRadius = 5,
    this.borderColor = TemboColors.border,
  }) : super(type: RowDecorationType.bordered);
}

class ZebraColoredRowDecoration extends RowDecoration {
  final Color color1, color2;

  /// condition to decide which color to paint given the row index.
  /// return 1 for [color1] or 2 for [color2].
  /// if the function returns some other number, function will use [color2] by
  /// default.
  final int Function(int rowIndex) condition;

  const ZebraColoredRowDecoration({
    required this.color1,
    required this.color2,
    required this.condition,
  }) : super(type: RowDecorationType.zebraColored);
}

import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../properties/properties.dart';
import '../../utils/utils.dart';

enum EasyMonthSwitcherStyle {
  defaultStyle,
  custom,
}

/// A widget that displays a button for switching to the previous or next month.
class EasyMonthSwitcher extends StatefulWidget {
  const EasyMonthSwitcher(
      {super.key,
      required this.locale,
      required this.value,
      this.onMonthChange,
      this.style,
      this.swticherStyle = EasyMonthSwitcherStyle.defaultStyle,
      this.headerProps});

  /// A `String` that represents the locale code to use for formatting the month name in the switcher.
  final String locale;

  /// The currently selected month.
  final EasyMonth? value;
  final EasyMonthSwitcherStyle swticherStyle;

  /// A callback function that is called when the selected month changes.
  final OnMonthChangeCallBack? onMonthChange;

  /// The text style applied to the month string.
  final TextStyle? style;
  final EasyHeaderProps? headerProps;

  @override
  State<EasyMonthSwitcher> createState() => _EasyMonthSwitcherState();
}

class _EasyMonthSwitcherState extends State<EasyMonthSwitcher> {
  List<EasyMonth> _yearMonths = [];
  int _currentMonth = 0;
  int _currentYear = 0;
  @override
  void initState() {
    super.initState();
    _yearMonths = EasyDateUtils.getYearMonths(DateTime.now(), widget.locale);
    _currentMonth = widget.value != null ? ((widget.value!.vale - 1)) : 0;
    _currentYear = DateTime.now().year;
  }

  bool get _isLastMonth => _currentMonth == _yearMonths.length - 1;
  bool get _isFirstMonth => _currentMonth == 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return widget.swticherStyle == EasyMonthSwitcherStyle.defaultStyle
        ? SizedBox(
            width: screenWidth * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: IconButton(
                    onPressed: () {
                      if (_isFirstMonth) {
                        if (_isFirstMonth) {
                          _currentMonth = _yearMonths.length - 1;
                          _currentYear = _currentYear - 1;
                          widget.onMonthChange?.call(
                              _yearMonths[_currentMonth],
                              EasyYear(
                                  name: "$_currentYear", vale: _currentYear));
                          return;
                        }
                        return;
                      }
                      _currentMonth--;
                      widget.onMonthChange?.call(_yearMonths[_currentMonth],
                          EasyYear(name: "$_currentYear", vale: _currentYear));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: _isFirstMonth ? Colors.grey : null,
                    ),
                  ),
                ),
                // Expanded(
                //   child: FittedBox(
                //     fit: BoxFit.scaleDown,
                //     child: Text(
                //       _yearMonths[_currentMonth].name,
                //       textAlign: TextAlign.center,
                //       style: widget.style,
                //     ),
                //   ),
                // ),
                Flexible(
                  child: IconButton(
                    onPressed: () {
                      if (_isFirstMonth) {
                        if (_isFirstMonth) {
                          _currentMonth = _yearMonths.length - 1;
                          _currentYear = _currentYear - 1;
                          widget.onMonthChange?.call(
                              _yearMonths[_currentMonth],
                              EasyYear(
                                  name: "$_currentYear", vale: _currentYear));
                          return;
                        }
                        return;
                      }
                      _currentMonth--;
                      widget.onMonthChange?.call(_yearMonths[_currentMonth],
                          EasyYear(name: "$_currentYear", vale: _currentYear));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: _isLastMonth ? Colors.grey : null,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (_isFirstMonth) {
                    if (_isFirstMonth) {
                      _currentMonth = _yearMonths.length - 1;
                      _currentYear = _currentYear - 1;
                      widget.onMonthChange?.call(_yearMonths[_currentMonth],
                          EasyYear(name: "$_currentYear", vale: _currentYear));
                      return;
                    }
                    return;
                  }
                  _currentMonth--;
                  widget.onMonthChange?.call(_yearMonths[_currentMonth],
                      EasyYear(name: "$_currentYear", vale: _currentYear));
                },
                icon: widget.headerProps!.iconBack ??
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: _isFirstMonth ? Colors.grey : null,
                    ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "${_yearMonths[_currentMonth].name} $_currentYear",
                    textAlign: TextAlign.center,
                    style: widget.style,
                    maxLines: 1,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_isLastMonth) {
                    _currentMonth = 0;
                    _currentYear = _currentYear + 1;
                    widget.onMonthChange?.call(_yearMonths[_currentMonth],
                        EasyYear(name: "$_currentYear", vale: _currentYear));
                    return;
                  }
                  _currentMonth++;
                  widget.onMonthChange?.call(_yearMonths[_currentMonth],
                      EasyYear(name: "$_currentYear", vale: _currentYear));
                },
                icon: widget.headerProps!.iconForward ??
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: _isLastMonth ? Colors.grey : null,
                    ),
              ),
            ],
          );
  }
}

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Date Timeline',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Easy Date Timeline 😊'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<Widget>(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.range,
                          showActionButtons: true,
                          onSubmit: (value) {
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.ads_click))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 32.0,
            // ),
            // const EasyInfiniteDateTimeLineExample(),
            // const Divider(
            //   height: 32,
            // ),
            // _mainExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _customBackgroundExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _changeTodyHighlightColorExample(),
            const SizedBox(
              height: 32.0,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  activeColor: Colors.amber,
                  onDateChange: (selectedDate) {},
                  // timeLineProps: EasyTimeLineProps(),
                  itemBuilder: (context, dayNumber, dayName, monthName,
                      fullDate, isSelected) {
                    bool isRedColor = dayName.toLowerCase() == "sun" ||
                        dayName.toLowerCase() == "sat";
                    return Container(
                      width: 45,
                      height: 60,
                      decoration: BoxDecoration(
                        // color: Colors.purple,
                        border: Border.all(
                            color: DateTime.now().day == int.parse(dayNumber)
                                ? Colors.purple
                                : Colors.transparent),
                        gradient: isSelected
                            ? LinearGradient(
                                begin: const Alignment(0.991, -0.253),
                                end: const Alignment(-1.8, 0.55),
                                colors: <Color>[
                                  const Color(0xffac0860),
                                  const Color(0xff791162),
                                  const Color(0xce49004b).withOpacity(.95)
                                ],
                                stops: const <double>[0, 0.316, 1],
                                tileMode: TileMode.mirror,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dayName,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : isRedColor
                                      ? Colors.red
                                      : Colors.black,
                            ),
                          ),
                          Text(
                            dayNumber,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  headerProps: EasyHeaderProps(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    centerHeader: true,
                    monthPickerType: MonthPickerType.switcher,
                    selectedDateFormat: SelectedDateFormat.monthAsStrY,
                    showSelectedDate: true,
                    monthStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    iconBack: Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    iconForward: Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  dayProps: EasyDayProps(
                    height: 70,
                    width: 45,
                    borderColor: Colors.transparent,

                    dayStructure: DayStructure.dayStrDayNum,
                    // // ignore: deprecated_member_use
                    // activeDayStrStyle:s
                    //     context.textTheme.bodySmall?.copyWith(
                    //   color: Colors.white,
                    // ),
                    // // ignore: deprecated_member_use
                    // activeDayNumStyle:
                    //     context.textTheme.bodyLarge?.copyWith(
                    //   color: Colors.white,
                    // ),

                    inactiveDayStrStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    inactiveDayNumStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                    activeDayStyle: DayStyle(
                      dayNumStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      dayStrStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                          begin: const Alignment(0.991, -0.253),
                          end: const Alignment(-1.8, 0.55),
                          colors: <Color>[
                            const Color(0xffac0860),
                            const Color(0xff791162),
                            const Color(0xce49004b).withOpacity(.95)
                          ],
                          stops: const <double>[0, 0.316, 1],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _landscapeViewExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _localeExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _changeHeaderAppearanceExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
            // _customizeDayAppearanceExample(),
            // const SizedBox(
            //   height: 32.0,
            // ),
          ],
        ),
      ),
    );
  }

  EasyDateTimeLine _mainExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
    );
  }

  EasyDateTimeLine _customBackgroundExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.fullDateDMY,
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EasyDateTimeLine _changeTodyHighlightColorExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff85A389),
      dayProps: const EasyDayProps(
        todayHighlightStyle: TodayHighlightStyle.withBackground,
        todayHighlightColor: Color(0xffE1ECC8),
      ),
    );
  }

  EasyDateTimeLine _changeDayStructureExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xffFFBF9B).withOpacity(.9),
      headerProps: const EasyHeaderProps(
        selectedDateFormat: SelectedDateFormat.monthOnly,
      ),
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(
          borderRadius: 48.0,
          dayNumStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  EasyDateTimeLine _localeExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xffB04759),
      locale: "ar",
    );
  }

  EasyDateTimeLine _landscapeViewExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff116A7B),
      dayProps: const EasyDayProps(
        landScapeMode: true,
        activeDayStyle: DayStyle(
          borderRadius: 48.0,
        ),
        dayStructure: DayStructure.dayStrDayNum,
      ),
      headerProps: const EasyHeaderProps(
        selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
      ),
    );
  }

  EasyDateTimeLine _changeHeaderAppearanceExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff37306B),
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
      ),
      dayProps: const EasyDayProps(
        activeDayStyle: DayStyle(
          borderRadius: 32.0,
        ),
        inactiveDayStyle: DayStyle(
          borderRadius: 32.0,
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        hPadding: 16.0, // padding from left and right
        separatorPadding: 16.0, // padding between days
      ),
    );
  }

  EasyDateTimeLine _customizeDayAppearanceExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      dayProps: const EasyDayProps(
        height: 56.0,
        // You must specify the width in this case.
        width: 124.0,
      ),
      headerProps: const EasyHeaderProps(
        selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
      ),
      itemBuilder: (BuildContext context, String dayNumber, dayName, monthName,
          fullDate, isSelected) {
        return Container(
          //the same width that provided previously.
          width: 124.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffFF6D60) : null,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                monthName,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayNumber,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : const Color(0xff393646),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayName,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EasyInfiniteDateTimeLineExample extends StatefulWidget {
  const EasyInfiniteDateTimeLineExample({super.key});

  @override
  State<EasyInfiniteDateTimeLineExample> createState() =>
      _EasyInfiniteDateTimeLineExampleState();
}

class _EasyInfiniteDateTimeLineExampleState
    extends State<EasyInfiniteDateTimeLineExample> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime? _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          controller: _controller,
          firstDate: DateTime(2023),
          focusDate: _focusDate,
          lastDate: DateTime(2023, 12, 31),
          onDateChange: (selectedDate) {
            setState(() {
              _focusDate = selectedDate;
            });
          },
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.animateToFocusDate();
              },
              child: const Text('Animate To Focus Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToCurrentData();
              },
              child: const Text('Animate To Current Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToDate(DateTime(2023, 6, 5));
              },
              child: const Text('Animate To 2023-6-5 '),
            ),
          ],
        ),
      ],
    );
  }
}

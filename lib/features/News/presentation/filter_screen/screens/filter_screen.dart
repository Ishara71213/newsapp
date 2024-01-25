import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';
import 'package:newsapp/core/constants/categories.dart';
import 'package:newsapp/core/constants/sortby.dart';
import 'package:newsapp/core/widgets/widgets_library.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _range = '';
  final DateTime _minDate = DateTime.now().add(const Duration(days: -30));
  final DateTime _maxDate = DateTime.now();
  List<DropdownMenuItem<String>> categoryType = [];
  String selectedCategoryType = "-1";

  List<DropdownMenuItem<String>> sortByType = [];
  String selectedSortByType = "-1";

  List<Map<String, String>> categoryList = [
    {"label": "Business", "value": Categories.business},
    {"label": "Entertainment", "value": Categories.entertainment},
    {"label": "General", "value": Categories.general},
    {"label": "Health", "value": Categories.health},
    {"label": "Science", "value": Categories.science},
    {"label": "Sports", "value": Categories.sports},
    {"label": "Technology", "value": Categories.technology},
  ];

  List<Map<String, String>> sortByFilterList = [
    {"label": "Relevancy", "value": SortBy.relevancy},
    {"label": "Popularity", "value": SortBy.popularity},
    {"label": "PublishedAt", "value": SortBy.publishedAt}
  ];

  @override
  void initState() {
    super.initState();
    loadCategoryTypes();
    loadSortByTypes();
  }

  Future<void> loadCategoryTypes() async {
    categoryType.addAll(categoryList.map(
      (item) {
        return DropdownMenuItem(
          value: item['value'],
          child: Text(item['label']!),
        );
      },
    ).whereType<DropdownMenuItem<String>>());
    selectedCategoryType = categoryType.first.value!;
  }

  Future<void> loadSortByTypes() async {
    sortByType.addAll(sortByFilterList.map(
      (item) {
        return DropdownMenuItem(
          value: item['value'],
          child: Text(item['label']!),
        );
      },
    ).whereType<DropdownMenuItem<String>>());
    selectedSortByType = sortByType.first.value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(title: "Filter"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DropDownWidget(
              isDecoration: true,
              items: categoryType,
              value: selectedCategoryType,
              onChanged: (value) {
                selectedCategoryType = value!;
              },
              selectedValue: selectedCategoryType,
            ),
            const SizedBox(
              height: 20,
            ),
            DropDownWidget(
              isDecoration: true,
              items: sortByType,
              value: selectedSortByType,
              onChanged: (value) {
                selectedSortByType = value!;
              },
              selectedValue: selectedSortByType,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 8.0),
              child: SfDateRangePicker(
                enablePastDates: true,
                minDate: _minDate,
                maxDate: _maxDate,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                monthCellStyle: const DateRangePickerMonthCellStyle(
                    todayTextStyle: TextStyle(color: Colors.black)),
                rangeSelectionColor: Colors.cyan,
                startRangeSelectionColor: Colors.black45,
                endRangeSelectionColor: Colors.black45,
                todayHighlightColor: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} /'
          ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
    } else if (args.value is DateTime) {
      // _selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      // _dateCount = args.value.length.toString();
    } else {
      // _rangeCount = args.value.length.toString();
    }
    setState(() {});
  }
}

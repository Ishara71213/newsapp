import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';
import 'package:newsapp/core/utils/filter.dart';
import 'package:newsapp/core/widgets/widgets_library.dart';
import 'package:newsapp/features/News/presentation/filter_screen/bloc/cubit/filter_cubit.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:newsapp/core/constants/categories.dart';
import 'package:newsapp/core/constants/sortby.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late FilterCubit filterCubit;

  //String _range = '';
  String startDate = '';
  String endDate = '';
  final DateTime _minDate = DateTime.now().add(const Duration(days: -30));
  final DateTime _maxDate = DateTime.now();

  List<DropdownMenuItem<String>> categoryType = [];
  List<Map<String, String>> categoryList = [
    {"label": "Business", "value": Categories.business},
    {"label": "Entertainment", "value": Categories.entertainment},
    {"label": "General", "value": Categories.general},
    {"label": "Health", "value": Categories.health},
    {"label": "Science", "value": Categories.science},
    {"label": "Sports", "value": Categories.sports},
    {"label": "Technology", "value": Categories.technology},
  ];

  List<DropdownMenuItem<String>> sortByType = [];
  List<Map<String, String>> sortByFilterList = [
    {"label": "Relevancy", "value": SortBy.relevancy},
    {"label": "Popularity", "value": SortBy.popularity},
    {"label": "PublishedAt", "value": SortBy.publishedAt}
  ];

  Future<void> loadCategoryTypes() async {
    categoryType = [];
    categoryType.addAll(categoryList.map(
      (item) {
        return DropdownMenuItem(
          value: item['value'],
          child: Text(item['label']!),
        );
      },
    ).whereType<DropdownMenuItem<String>>());
    filterCubit.selectedCategoryType = filterCubit.selectedCategoryType == "-1"
        ? categoryType.first.value!
        : filterCubit.selectedCategoryType;
  }

  Future<void> loadSortByTypes() async {
    sortByType = [];
    sortByType.addAll(sortByFilterList.map(
      (item) {
        return DropdownMenuItem(
          value: item['value'],
          child: Text(item['label']!),
        );
      },
    ).whereType<DropdownMenuItem<String>>());
    filterCubit.selectedSortByType = filterCubit.selectedSortByType == "-1"
        ? sortByType.first.value!
        : filterCubit.selectedSortByType;
  }

  @override
  void initState() {
    super.initState();
    filterCubit = BlocProvider.of<FilterCubit>(context);
    loadCategoryTypes();
    loadSortByTypes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: const AppBarWithBackBtn(title: "Filter"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const LabelWidget(
                  text: 'Categories',
                ),
                DropDownWidget(
                  isDecoration: true,
                  items: categoryType,
                  value: filterCubit.selectedCategoryType,
                  onChanged: (value) {
                    filterCubit.selectedCategoryType = value!;
                  },
                  selectedValue: filterCubit.selectedCategoryType,
                ),
                const SizedBox(
                  height: 20,
                ),
                const LabelWidget(
                  text: 'Sort By',
                ),
                DropDownWidget(
                  isDecoration: true,
                  items: sortByType,
                  value: filterCubit.selectedSortByType,
                  onChanged: (value) {
                    filterCubit.selectedSortByType = value!;
                  },
                  selectedValue: filterCubit.selectedSortByType,
                ),
                const SizedBox(
                  height: 20,
                ),
                const LabelWidget(
                  text: 'Search date range',
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                  child: SfDateRangePicker(
                    enablePastDates: true,
                    minDate: _minDate,
                    maxDate: _maxDate,
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                        todayTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground)),
                    rangeSelectionColor:
                        Theme.of(context).colorScheme.secondary,
                    startRangeSelectionColor:
                        Theme.of(context).colorScheme.primary,
                    endRangeSelectionColor:
                        Theme.of(context).colorScheme.primary,
                    todayHighlightColor: Theme.of(context).colorScheme.primary,
                    rangeTextStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FilledButtonCustom(
                    initText: "Filter",
                    onPressed: () async {
                      homeCubit.clearFilter();
                      Filter filter = Filter(
                        category: filterCubit.selectedCategoryType,
                        sortBy: filterCubit.selectedSortByType,
                        dateRange: 'from=$startDate&to=$endDate',
                      );
                      homeCubit.setFilter(filter);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      // _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} /'
      //     ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
      startDate = DateFormat('yyyy-MM-dd').format(args.value.startDate);
      endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate);
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

class LabelWidget extends StatelessWidget {
  final String text;
  const LabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

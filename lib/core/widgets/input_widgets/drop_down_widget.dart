part of 'input_widgets_library.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.paddingVertical = 0.015,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    required value,
    this.isDropdownLoading = false,
    this.isDecoration = false,
  });
  final double paddingVertical;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? selectedValue;
  final bool isDecoration;
  final bool isDropdownLoading;

  String? _formFieldValidator(String? val, BuildContext context) {
    if (val == '-1') {
      return "Field can't be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: 64,
      child: Center(
        child: DropdownButtonFormField(
          menuMaxHeight: size.height / 2,
          isDense: true,
          validator: (value) => _formFieldValidator(value, context),
          decoration: isDecoration
              ? InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).inputDecorationTheme.fillColor!,
                        width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).inputDecorationTheme.fillColor!,
                        width: 1),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor!,
                )
              : const InputDecoration.collapsed(hintText: ''),
          items: items,
          value: selectedValue,
          onChanged: isDropdownLoading ? null : onChanged,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:colornames/colornames.dart';
import 'package:menu_app/models/category.dart';
import 'package:menu_app/screens/adaptive_alert.dart';

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({super.key, required this.onAddCategory});

  final Function onAddCategory;

  @override
  State<NewCategoryScreen> createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  final _titleController = TextEditingController();
  Color _color = Colors.orange;

  void _submitData() {
    if (_titleController.text.isEmpty) {
      _showDialog();
      return;
    } else {
      Category category = Category(
          id: DateTime.now().toString(),
          title: _titleController.text,
          color: _color);
      widget.onAddCategory(category);
      Navigator.of(context).pop();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog.namedConstructor(
        "Invalid input! Please make sure that you enterred valid data",
        getAlertActions(),
      ),
    );
  }

  void changeColor(Color pickedColor) {
    setState(() {
      _color = pickedColor;
    });
  }

  Widget getColorPickerContent() {
    return SingleChildScrollView(
      child: ColorPicker(
        pickerColor: _color,
        onColorChanged: changeColor,
      ),
    );
  }

  List<Widget> getAlertActions() {
    return [
      ElevatedButton(
        child: Text(
          'Got it',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        "Pick up color",
        getColorPickerContent(),
        getAlertActions(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthDevice * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                label: Text("Enter the title"),
                contentPadding: EdgeInsets.all(10)),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Color ${ColorNames.guess(_color)}",
              )),
              ElevatedButton(
                  onPressed: _showColorPicker,
                  child: const Text("Choose a color"))
            ],
          ),
          const SizedBox(height: 35),
          OutlinedButton(onPressed: _submitData, child: const Text("Create"))
        ],
      ),
    );
  }
}

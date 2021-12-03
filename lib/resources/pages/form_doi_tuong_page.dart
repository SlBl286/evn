import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/thu_thap_controller.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';
import '../../app/controllers/form_doi_tuong_controller.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class FormDoiTuongPage extends NyStatefulWidget {
  static const route = "/form_doi_tuong";
  final FormDoiTuongController controller = FormDoiTuongController();

  FormDoiTuongPage({Key? key}) : super(key: key);

  @override
  _FormDoiTuongPageState createState() => _FormDoiTuongPageState();
}

class _FormDoiTuongPageState extends NyState<FormDoiTuongPage> {
  late DoiTuong a;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  widgetDidLoad() async {
    a = widget.data();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NyColors.of(context).appBarBackground,
        title: Text(
          a != null ? a.name : "",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderFilterChip(
                  checkmarkColor: NyColors.of(context).primaryContent,
                  selectedColor:
                      NyColors.of(context).primaryAccent.withAlpha(180),
                  backgroundColor: NyColors.of(context).primaryAccent,
                  name: 'filter_chip',
                  decoration: InputDecoration(
                    labelText: 'filter_chip',
                  ),
                  options: [
                    FormBuilderFieldOption(
                        value: 'Test',
                        child: Text(
                          'Test',
                          style: TextStyle(
                              color: NyColors.of(context).primaryContent),
                        )),
                    FormBuilderFieldOption(
                        value: 'Test 1',
                        child: Text(
                          'Test 1',
                          style: TextStyle(
                              color: NyColors.of(context).primaryContent),
                        )),
                    FormBuilderFieldOption(
                        value: 'Test 2',
                        child: Text(
                          'Test 2',
                          style: TextStyle(
                              color: NyColors.of(context).primaryContent),
                        )),
                    FormBuilderFieldOption(
                        value: 'Test 3',
                        child: Text(
                          'Test 3',
                          style: TextStyle(
                              color: NyColors.of(context).primaryContent),
                        )),
                    FormBuilderFieldOption(
                        value: 'Test 4',
                        child: Text(
                          'Test 4',
                          style: TextStyle(
                              color: NyColors.of(context).primaryContent),
                        )),
                  ],
                ),
                FormBuilderChoiceChip(
                  selectedColor:
                      NyColors.of(context).primaryAccent.withAlpha(150),
                  backgroundColor: NyColors.of(context).primaryAccent,
                  name: 'choice_chip',
                  decoration: InputDecoration(
                    labelText: 'choice_chip',
                  ),
                  options: [
                    FormBuilderFieldOption(
                        value: 'Test',
                        child: Text('Test',
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent))),
                    FormBuilderFieldOption(
                        value: 'Test 1',
                        child: Text('Test 1',
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent))),
                    FormBuilderFieldOption(
                        value: 'Test 2',
                        child: Text('Test 2',
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent))),
                    FormBuilderFieldOption(
                        value: 'Test 3',
                        child: Text('Test 3',
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent))),
                    FormBuilderFieldOption(
                        value: 'Test 4',
                        child: Text('Test 4',
                            style: TextStyle(
                                color: NyColors.of(context).primaryContent))),
                  ],
                ),
                FormBuilderCheckboxGroup(
                    decoration: InputDecoration(
                      labelText: 'CheckBox',
                    ),
                    name: 'checkbox',
                    options: [1, 2, 3, 4, 5].map((e) {
                      return FormBuilderFieldOption(
                        value: e,
                        child: Text('option $e'),
                      );
                    }).toList()),
                FormBuilderRadioGroup(
                    decoration: InputDecoration(
                      labelText: 'Radio',
                    ),
                    name: 'Radio',
                    options: [1, 2, 3, 4, 5].map((e) {
                      return FormBuilderFieldOption(
                        value: e,
                        child: Text('option $e'),
                      );
                    }).toList()),
                FormBuilderDateTimePicker(
                  style: TextStyle(color: NyColors.of(context).primaryAccent),
                  name: 'date',
                  // onChanged: _onChanged,
                  inputType: InputType.time,
                  decoration: InputDecoration(
                    labelText: 'Timepicker',
                  ),
                  initialTime: TimeOfDay(hour: 8, minute: 0),
                  // initialValue: DateTime.now(),
                  // enabled: true,
                ),
                FormBuilderDateRangePicker(
                  style: TextStyle(color: NyColors.of(context).primaryAccent),
                  name: 'date_range',
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2030),
                  format: DateFormat('yyyy-MM-dd'),
                  decoration: InputDecoration(
                    labelText: 'Date Range',
                    hintText: 'Hint text',
                  ),
                ),
                FormBuilderSlider(
                  name: 'slider',
                  onChanged: (double? value) {},
                  min: 0.0,
                  max: 10.0,
                  initialValue: 7.0,
                  divisions: 20,
                  activeColor: NyColors.of(context).primaryAccent,
                  inactiveColor:
                      NyColors.of(context).primaryAccent.withAlpha(100),
                  decoration: InputDecoration(
                    labelText: 'Number of things',
                  ),
                ),
                FormBuilderTextField(
                  style: TextStyle(color: NyColors.of(context).primaryAccent),
                  name: 'age',
                  decoration: InputDecoration(
                    labelText:
                        'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                  ),

                  // valueTransformer: (text) => num.tryParse(text),

                  keyboardType: TextInputType.number,
                ),
                FormBuilderDropdown(
                  style: TextStyle(color: NyColors.of(context).primaryAccent),
                  name: 'gender',
                  decoration: InputDecoration(
                    labelText: 'Gender',
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Select Gender'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: ['male', 'female']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: NyColors.of(context).primaryAccent,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            print(_formKey.currentState!.value);
                          } else {
                            print("validation failed");
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: MaterialButton(
                        color: NyColors.of(context).primaryAccent,
                        child: Text(
                          "Reset",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

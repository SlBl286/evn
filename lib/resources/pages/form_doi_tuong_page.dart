import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/thu_thap_controller.dart';
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
        title: Text(a != null ? a.name : ""),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderFilterChip(
                name: 'filter_chip',
                decoration: InputDecoration(
                  labelText: 'Select many options',
                ),
                options: [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderChoiceChip(
                name: 'choice_chip',
                decoration: InputDecoration(
                  labelText: 'Select an option',
                ),
                options: [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderDateTimePicker(
                name: 'date',
                // onChanged: _onChanged,
                inputType: InputType.time,
                decoration: InputDecoration(
                  labelText: 'Appointment Time',
                ),
                initialTime: TimeOfDay(hour: 8, minute: 0),
                // initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderDateRangePicker(
                name: 'date_range',
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
                format: DateFormat('yyyy-MM-dd'),
                decoration: InputDecoration(
                  labelText: 'Date Range',
                  helperText: 'Helper text',
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
                activeColor: Colors.red,
                inactiveColor: Colors.pink[100],
                decoration: InputDecoration(
                  labelText: 'Number of things',
                ),
              ),
              FormBuilderTextField(
                name: 'age',
                decoration: InputDecoration(
                  labelText:
                      'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                ),

                // valueTransformer: (text) => num.tryParse(text),

                keyboardType: TextInputType.number,
              ),
              FormBuilderDropdown(
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
                      color: Theme.of(context).colorScheme.secondary,
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
                      color: Theme.of(context).colorScheme.secondary,
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
      )),
    );
  }
}

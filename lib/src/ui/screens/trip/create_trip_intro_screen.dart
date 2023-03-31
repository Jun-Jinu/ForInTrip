import 'package:flutter/material.dart';

import 'package:for_in_trip/src/ui/widgets/appbar/menu_appbar.dart';
import 'package:for_in_trip/src/ui/theme/app_color.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTripIntroScreen extends StatefulWidget {
  @override
  _CreateTripIntroScreenState createState() => _CreateTripIntroScreenState();
}

class _CreateTripIntroScreenState extends State<CreateTripIntroScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tripNameController = TextEditingController();
  DateTimeRange? _dateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 1)),
    );
    final pickedDateRange = await showModalBottomSheet<DateTimeRange>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
              initialDateRange.start,
              initialDateRange.end,
            ),
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                _dateRange = DateTimeRange(
                  start: args.value.startDate!,
                  end: args.value.endDate!,
                );
              });
            },
          ),
        );
      },
    );
    if (pickedDateRange != null) {
      setState(() {
        _dateRange = DateTimeRange(
          start: pickedDateRange.start,
          end: pickedDateRange.end,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(title: "Create Trip"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Make you a trip! ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // TextSpan(
                      //   text: 'For In Trip!\n',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: primaryColor,
                      //   ),
                      // ),
                      TextSpan(
                        text: 'Please enter information about your trip!',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 26.0,
                          color: gray1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextFormField(
                controller: _tripNameController,
                decoration: InputDecoration(labelText: 'Trip Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a trip name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Travel Start: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.arrow_right),
                  SizedBox(width: 16),
                  Text(
                    'Travel End: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDateRange(context);
                },
                child: Text('Select Date Range'),
              ),
              SizedBox(height: 16.0),
              if (_dateRange != null)
                Text(
                  'Selected Date Range: ${_dateRange!.start.toLocal()} - ${_dateRange!.end.toLocal()}',
                  style: TextStyle(fontSize: 16),
                ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 48.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _dateRange != null) {
                            // Form is valid and date range is selected, do something with the data
                            String tripName = _tripNameController.text;
                            DateTime startDate = _dateRange!.start;
                            DateTime endDate = _dateRange!.end;

                            // TODO: Do something with the data

                            // Navigate back to previous screen
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

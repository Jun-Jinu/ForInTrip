import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:for_in_trip/src/ui/widgets/appbar/menu_appbar.dart';
import 'package:for_in_trip/src/ui/theme/app_color.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/place_menu_container.dart';
import '../trip/create_trip_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CreateTripIntroScreen extends StatefulWidget {
  @override
  _CreateTripIntroScreenState createState() => _CreateTripIntroScreenState();
}

class _CreateTripIntroScreenState extends State<CreateTripIntroScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tripNameController = TextEditingController();
  DateTimeRange? _dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 1)),
  );

  Future<void> _selectDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 1)),
    );
    final pickedDateRange = await showModalBottomSheet<DateTimeRange>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
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
            selectionColor: lightPrimaryColor,
            startRangeSelectionColor: lightPrimaryColor,
            endRangeSelectionColor: lightPrimaryColor,
            rangeSelectionColor: lightPrimaryColor,
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

  // WebViewController _webViewController = WebViewController()
  //   ..loadRequest(Uri.parse('https://youtube.com'))
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted);

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
              // Expanded(
              //   child: WebViewWidget(controller: _webViewController),
              // ),
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
              SizedBox(
                height: 100,
                child: TextFormField(
                  controller: _tripNameController,
                  decoration: InputDecoration(labelText: 'Trip Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a trip name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () => _selectDateRange(context),
                child: PlaceMenuContainer(
                  title: "Date of trip",
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat('MM/dd/yyyy').format(_dateRange!.start.toLocal())}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_right),
                        Text(
                          '${DateFormat('MM/dd/yyyy').format(_dateRange!.end.toLocal())}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' (${_dateRange!.end.difference(_dateRange!.start).inDays + 1} days)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
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

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTripScreen()),
                            );
                          }
                        },
                        child: Text(
                          "Creating a New Journey",
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

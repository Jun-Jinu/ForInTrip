import 'package:flutter/material.dart';

class CreateTripIntroScreen extends StatefulWidget {
  @override
  _CreateTripIntroScreenState createState() => _CreateTripIntroScreenState();
}

class _CreateTripIntroScreenState extends State<CreateTripIntroScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tripNameController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  void _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _startDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate != _startDate) {
      setState(() {
        _startDate = pickedDate;
      });
    }
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _endDate,
        firstDate: _startDate,
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate != _endDate) {
      setState(() {
        _endDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip Intro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                children: [
                  Text('Start Date: '),
                  GestureDetector(
                    onTap: () {
                      _selectStartDate(context);
                    },
                    child: Text(
                      '${_startDate.toLocal()}'.split(' ')[0],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('End Date: '),
                  GestureDetector(
                    onTap: () {
                      _selectEndDate(context);
                    },
                    child: Text(
                      '${_endDate.toLocal()}'.split(' ')[0],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit form logic here
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

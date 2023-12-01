import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lumos/utils.dart';

class AddEvent2 extends StatefulWidget {
  const AddEvent2({Key? key}) : super(key: key);

  @override
  State<AddEvent2> createState() => _AddEvent2State();
}

class _AddEvent2State extends State<AddEvent2> {
  int _selectedValue = 0;
  int _selectedDuration = 0;
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _registrationDeadlineController = TextEditingController();
  final TextEditingController _eventPrizePoolController = TextEditingController();

  DateTime? _selectedDate; // Store the selected date

  Future<void> postDataToUrl() async {
    // Replace with the URL where you want to post the data
    final url = ApiConfig.baseUrl+'event/';

    final Map<String, dynamic> eventData = {
      'userID':"praj2k2",
      "link":"https://images.unsplash.com/photo-1698414461871-a01e73316c2a?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8",
      'content':"A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
      'description':"A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
'maxNumbers':"5",
      'type':"Online",
      'name': _eventNameController.text,
      'eventType': _eventTypeController.text,
      // 'date': "2006-01-02T15:04:05Z0",
      'endDate': _endDateController.text,
      'registrationDeadline': _registrationDeadlineController.text,
      'eventPrizePool': _eventPrizePoolController.text,
    };

    final response = await http.post(
      Uri.parse(url),
      body: eventData,
    );

    if (response.statusCode == 201) {
      Navigator.of(context).pushNamed('/');
      print('Data posted successfully');
    } else {
      // Handle the error or provide appropriate feedback
      print('Failed to post data. Status code: ${response.body}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18,),
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create An Event",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ),
            Row(
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: _selectedValue,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                Text('Online'),
                Radio<int>(
                  value: 1,
                  groupValue: _selectedValue,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                Text('In-Person'),
              ],
            ),

            SizedBox(height: 20),
            _buildInputField("Event Name", _eventNameController),
            SizedBox(height: 20),
            _buildInputField("Event Type", _eventTypeController),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              padding:  EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(100, 56, 165, 165)
              ),
              child: const Column(
                children: [
                  Align(child: Text("Description" ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),alignment:Alignment.centerLeft ,),
                  Text('A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.')
                ],
              ),
            ),
            SizedBox(height: 20),



            Row(
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('One-day'),
                Radio<int>(
                  value: 1,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('Two-day'),
                Radio<int>(
                  value: 2,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('3-day'),
              ],
            ),
            SizedBox(height: 20),
            _buildDateField("Start Date", _startDateController),
            SizedBox(height: 20),
            _buildDateField("End Date", _endDateController),
            SizedBox(height: 20),
            _buildDateField("Registration Deadline", _registrationDeadlineController),
            SizedBox(height: 20),
            Row(
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('Prize Pool'),
                Radio<int>(
                  value: 1,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('Winners'),
                Radio<int>(
                  value: 2,
                  groupValue: _selectedDuration,
                  activeColor: Color(0xFF38A3A5),
                  onChanged: (value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                  },
                ),
                Text('Other'),
              ],
            ),
            SizedBox(height: 20),
            _buildInputField("Event Prize Pool", _eventPrizePoolController),
            Container(
              margin: EdgeInsets.all(20),
              padding:  EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(100, 56, 165, 165)
              ),
              child: const Column(
                children: [
                  Align(child: Text("If Others Mention:" ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),alignment:Alignment.centerLeft ,),
                  Text('A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.')
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                postDataToUrl();
              },
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF38A3A5)),
                  color: Color(0xFF38A3A5),
                ),
                child: Center(
                  child: Text(
                    "Add Event",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color(0xFF38A3A5)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.0),
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Widget _buildDateField(String labelText, TextEditingController controller) {
    return GestureDetector(
      onTap: () {
        _selectDate(context, controller);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFF38A3A5)),
        ),
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.0),
            labelText: labelText,
            border: InputBorder.none,
          ),
          child: Text(
            controller.text.isNotEmpty ? controller.text : "Select Date",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportsarena/widgets/court_data.dart';

class CourtDetailScreen extends StatefulWidget {
  final CourtData courtData;

  const CourtDetailScreen({super.key, required this.courtData});

  @override
  _CourtDetailScreenState createState() => _CourtDetailScreenState();
}

class _CourtDetailScreenState extends State<CourtDetailScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedPaymentMethod = 'Select Payment Method';

  List<String> paymentMethods = ['Credit Card', 'Debit Card', 'QRis', 'Bank Transfer'];

  int calculateTotalPrice() {
    if (selectedStartTime != null && selectedEndTime != null) {
      final startTime = selectedStartTime!.hour + selectedStartTime!.minute / 60.0;
      final endTime = selectedEndTime!.hour + selectedEndTime!.minute / 60.0;
      final duration = endTime - startTime;
      return (duration * widget.courtData.pricePerHour).toInt();
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Court Detail'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          widget.courtData.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.courtData.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Location: ${widget.courtData.location}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Opening Hours: ${widget.courtData.openingHours}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Price per Hour:  ${widget.courtData.pricePerHour.toString()}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Booking Date:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 1),
                        );

                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      child: const Text('Select Date', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                    if (selectedDate != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                    const SizedBox(height: 16),
                    const Text(
                      'Booking Time:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? startTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (startTime != null && startTime != selectedStartTime) {
                              setState(() {
                                selectedStartTime = startTime;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                          child: const Text('Start Time', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                        if (selectedStartTime != null) ...[
                          Text(
                            '${selectedStartTime!.hour}:${selectedStartTime!.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                        ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? endTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (endTime != null && endTime != selectedEndTime) {
                              setState(() {
                                selectedEndTime = endTime;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                          child: const Text('End Time', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                        if (selectedEndTime != null) ...[
                          Text(
                            '${selectedEndTime!.hour}:${selectedEndTime!.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment Method:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.deepPurpleAccent,
                        value: selectedPaymentMethod,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                        iconSize: 36,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPaymentMethod = newValue;
                          });
                        },
                        items: [
                          const DropdownMenuItem(
                            value: 'Select Payment Method',
                            child: Text('Select Payment Method'),
                          ),
                          ...paymentMethods.map((String method) {
                            return DropdownMenuItem<String>(
                              value: method,
                              child: Text(method),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedDate != null &&
                      selectedStartTime != null &&
                      selectedEndTime != null &&
                      selectedPaymentMethod != null &&
                      selectedPaymentMethod != 'Select Payment Method') {
                    final totalPrice = calculateTotalPrice();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Booking Confirmation', style: TextStyle(color: Colors.deepPurpleAccent)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Court: ${widget.courtData.name}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Location: ${widget.courtData.location}',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Time: ${selectedStartTime!.hour}:${selectedStartTime!.minute.toString().padLeft(2, '0')} - ${selectedEndTime!.hour}:${selectedEndTime!.minute.toString().padLeft(2, '0')}',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Payment Method: $selectedPaymentMethod',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Total Price: Rp ${totalPrice.toString()}',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                            ),
                            child: const Text('Confirm', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ],
                      )

                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Incomplete Selection'),
                        content: const Text('Please complete all booking details.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  elevation: 5,
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

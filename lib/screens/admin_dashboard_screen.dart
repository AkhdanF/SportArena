import 'package:flutter/material.dart';
import 'package:sportsarena/widgets/court_data.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _openingHoursController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void _addCourt() {
    final name = _nameController.text;
    final location = _locationController.text;
    final openingHours = _openingHoursController.text;
    final imageAsset = _imageUrlController.text;
    final pricePerHour = num.parse(_priceController.text);

    CourtData newCourt = CourtData(
      name: name,
      location: location,
      openingHours: openingHours,
      pricePerHour: pricePerHour,
      imageAsset: imageAsset,
    );

    addCourt(newCourt);

    _nameController.clear();
    _locationController.clear();
    _openingHoursController.clear();
    _imageUrlController.clear();
    _priceController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Court added successfully'),
        duration: Duration(seconds: 2),
      ),
    );

    setState(() {});
  }

  void _deleteCourt(int index) {
    setState(() {
      courtDataList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Court deleted'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Court Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _openingHoursController,
              decoration: const InputDecoration(labelText: 'Opening Hours'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price Per Hour'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCourt,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: const Text('Add Court'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Existing Courts:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courtDataList.length,
                itemBuilder: (context, index) {
                  CourtData court = courtDataList[index];
                  return Dismissible(
                    key: Key(court.name),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      _deleteCourt(index);
                    },
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      title: Text('${court.name}'),
                      subtitle: Text(
                        'Location: ${court.location}\nOpening Hours: ${court.openingHours}\nPrice Per Hour: Rp${court.pricePerHour.toStringAsFixed(0)}',
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(court.imageAsset),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

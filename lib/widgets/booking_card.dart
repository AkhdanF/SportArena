import 'package:flutter/material.dart';
import 'package:sportsarena/widgets/court_data.dart';

class BookingCard extends StatelessWidget {
  final CourtData courtData;

  const BookingCard({
    Key? key,
    required this.courtData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.deepPurple.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.network(
              courtData.imageAsset,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courtData.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Location: ${courtData.location}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Opening Hours: ${courtData.openingHours}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Price per Hour: ${courtData.pricePerHour}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

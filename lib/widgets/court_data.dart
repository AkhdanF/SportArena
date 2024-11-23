class CourtData {
  final String name;
  final String location;
  final String openingHours;
  final num pricePerHour;
  final String imageAsset;

  CourtData({
    required this.name,
    required this.location,
    required this.openingHours,
    required this.pricePerHour,
    required this.imageAsset,
  });
}

List<CourtData> courtDataList = [
  CourtData(
    name: 'Lapangan Futsal 1',
    location: 'Sports Arena, Central Park',
    openingHours: '09:00 - 22:00',
    pricePerHour: 100000,
    imageAsset: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa_bL-_jqRIQ8uiXhV5ecX-P8RnSyOfmY0Shk9iWcu6nc1V-wO_I5fMA7icBYhfb_w4N0&usqp=CAU',
  ),
  CourtData(
    name: 'Lapangan Futsal 2',
    location: 'Sports Arena, Downtown',
    openingHours: '08:00 - 20:00',
    pricePerHour: 80000,
    imageAsset: 'https://www.infobdg.com/v2/wp-content/uploads/2011/06/futsal.jpg',
  ),
  CourtData(
    name: 'Lapangan Futsal 3',
    location: 'Sports Arena, City Center',
    openingHours: '07:00 - 21:00',
    pricePerHour: 120000,
    imageAsset: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvd_JC08EDdkFoVajOavg8Jvmhs7qpjnf1HQ&s',
  ),
  CourtData(
    name: 'Lapangan Futsal 4',
    location: 'Sports Arena, Riverside',
    openingHours: '10:00 - 18:00',
    pricePerHour: 60000,
    imageAsset: 'https://kuy-ent.s3.ap-southeast-1.amazonaws.com/images/post/3d30f247-759b-4685-8538-5a9ed493b2db_original.jpg',
  ),
  CourtData(
    name: 'Lapangan Futsal 5',
    location: 'Sports Arena, Suburb',
    openingHours: '11:00 - 19:00',
    pricePerHour: 50000,
    imageAsset: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaoIccHsK66ybmwTzSKb8itHVh1WDJcUP3jQ&s',
  ),
];

void addCourt(CourtData court) {
  courtDataList.add(court);
}

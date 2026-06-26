class LocationModel {
  final String name;
  final double x;
  final double y;

  const LocationModel({
    required this.name,
    required this.x,
    required this.y,
  });
}

const List<LocationModel> campusLocations = [

  // Entry
  LocationModel(name: "Main Gate", x: 55, y: 520),

  // Departments
  LocationModel(name: "AI & ML Department", x: 250, y: 165),
  LocationModel(name: "IT Department", x: 330, y: 165),
  LocationModel(name: "CSE Department", x: 380, y: 170),
  LocationModel(name: "ECE Department", x: 640, y: 300),
  LocationModel(name: "Mechanical Block", x: 720, y: 190),
  LocationModel(name: "Civil Block", x: 690, y: 450),

  // Buildings
  LocationModel(name: "Library", x: 150, y: 180),
  LocationModel(name: "Administrative Block", x: 470, y: 310),
  LocationModel(name: "Auditorium", x: 560, y: 320),
  LocationModel(name: "MCA Block", x: 270, y: 455),

  // Facilities
  LocationModel(name: "Canteen", x: 350, y: 450),
  LocationModel(name: "Parking", x: 820, y: 410),
  LocationModel(name: "Hostel", x: 610, y: 140),

  // Sports
  LocationModel(name: "Arjun Sports Maidan", x: 430, y: 120),
  LocationModel(name: "Play Ground", x: 280, y: 360),

  // Extra Places
  LocationModel(name: "Seminar Hall", x: 510, y: 250),
  LocationModel(name: "Exam Cell", x: 560, y: 260),
  LocationModel(name: "Principal Office", x: 495, y: 290),
  LocationModel(name: "Placement Cell", x: 610, y: 280),
  LocationModel(name: "Bus Parking", x: 890, y: 470),
];
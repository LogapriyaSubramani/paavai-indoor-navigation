import '../models/graph_node.dart';

class CampusData {
  static final List<GraphNode> nodes = [
    GraphNode(
      id: "gate",
      name: "Main Gate",
      x: 80,
      y: 650,
    ),
    GraphNode(
      id: "admin",
      name: "Admin Block",
      x: 170,
      y: 560,
    ),
    GraphNode(
      id: "library",
      name: "Library",
      x: 300,
      y: 470,
    ),
    GraphNode(
      id: "cse",
      name: "CSE Block",
      x: 420,
      y: 360,
    ),
    GraphNode(
      id: "it",
      name: "IT Block",
      x: 560,
      y: 320,
    ),
    GraphNode(
      id: "canteen",
      name: "Canteen",
      x: 640,
      y: 520,
    ),
    GraphNode(
      id: "hostel",
      name: "Hostel",
      x: 720,
      y: 700,
    ),
    GraphNode(
      id: "parking",
      name: "Parking",
      x: 240,
      y: 760,
    ),
  ];
}
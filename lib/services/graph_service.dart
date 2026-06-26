import '../models/graph_edge.dart';

class GraphService {
  static const List<GraphEdge> edges = [
    GraphEdge(
      from: "gate",
      to: "admin",
      distance: 100,
    ),
    GraphEdge(
      from: "admin",
      to: "library",
      distance: 120,
    ),
    GraphEdge(
      from: "library",
      to: "cse",
      distance: 90,
    ),
    GraphEdge(
      from: "cse",
      to: "it",
      distance: 70,
    ),
    GraphEdge(
      from: "it",
      to: "canteen",
      distance: 140,
    ),
    GraphEdge(
      from: "canteen",
      to: "hostel",
      distance: 180,
    ),
    GraphEdge(
      from: "gate",
      to: "parking",
      distance: 90,
    ),
    GraphEdge(
      from: "parking",
      to: "canteen",
      distance: 220,
    ),
  ];
}
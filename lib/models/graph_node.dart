class GraphNode {
  final String id;
  final String name;
  final double x;
  final double y;
  final int floor;

  const GraphNode({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    this.floor = 0,
  });
}
import 'dart:io';

// Define an interface
abstract class ShapeInterface {
  double calculateArea();
}

// Define a base class implementing the interface
class Shape implements ShapeInterface {
  String color;

  Shape(this.color);

  @override
  double calculateArea() {
    return 0; // Placeholder implementation for base class
  }
}

// Define a derived class that overrides the inherited method
class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

// Define a class that implements an interface
class Square implements ShapeInterface {
  String color;
  double side;

  Square(this.color, this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

// Define a method to initialize an instance of a class from a file
Shape initializeFromFile(String fileName) {
  File file = File(fileName);
  List<String> lines = file.readAsLinesSync();

  if (lines.length < 3) {
    throw Exception('File does not contain enough data');
  }

  String color = lines[0];
  double sideOrRadius = double.parse(lines[1]);
  String shapeType = lines[2];

  if (shapeType == 'circle') {
    return Circle(color, sideOrRadius);
  } else if (shapeType == 'square') {
    return Square(color, sideOrRadius);
  } else {
    throw Exception('Invalid shape type');
  }
}

// Define a method that demonstrates the use of a loop
void printAreas(List<Shape> shapes) {
  for (Shape shape in shapes) {
    double area = shape.calculateArea();
    print('Area of ${shape.runtimeType}: $area');
  }
}

void main() {
  // Create instances of classes
  Circle circle = Circle('Red', 5);
  Square square = Square('Blue', 4);
  
  // Initialize an instance from a file
  Shape shapeFromFile = initializeFromFile('shape_data.txt');

  // Demonstrate the use of a loop
  printAreas([circle, square, shapeFromFile]);
}

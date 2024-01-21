import 'dart:io';

class Student {
  String name;
  String father_name;
  int age;
  int class_name;
  Student(this.name, this.age, this.class_name, this.father_name);
}

class StudentManagementSystem {
  List<Student> students = [];

  void addStudent() {
    stdout.write('Enter student name: ');
    String name = stdin.readLineSync()!;

    stdout.write('Enter student father name: ');
    String father_name = stdin.readLineSync()!;

    stdout.write('Enter student age: ');
    int age = int.parse(stdin.readLineSync()!);

    stdout.write('Enter student class name: ');
    int class_name = int.parse(stdin.readLineSync()!);

    students.add(Student(name, age, class_name, father_name));
    print('Student added successfully!\n');
  }

  void viewStudents() {
    if (students.isEmpty) {
      print('No students in the system.\n');
    } else {
      print('List of Students:');
      for (var i = 0; i < students.length; i++) {
        print(
            '${i + 1}. Name: ${students[i].name}, Father Name: ${students[i].father_name}, Age: ${students[i].age}, ClassName: ${students[i].class_name}');
      }
      print('');
    }
  }

  void deleteStudent() {
    if (students.isEmpty) {
      print('No students to delete.\n');
      return;
    }

    viewStudents();

    stdout.write('Enter the number of the student to delete: ');
    var index = int.parse(stdin.readLineSync()!) - 1;

    if (index >= 0 && index < students.length) {
      print('Deleting student: ${students[index].name}');
      students.removeAt(index);
      print('Student deleted successfully!\n');
    } else {
      print('Invalid index. No student deleted.\n');
    }
  }
}

void main() {
  var studentManagementSystem = StudentManagementSystem();

  while (true) {
    print('Student Management System');
    print('1. Add Student');
    print('2. View Students');
    print('3. Delete Student');
    print('4. Exit');

    stdout.write('Enter your choice (1-4): ');
    var choice = stdin.readLineSync();

    if (choice == '1') {
      studentManagementSystem.addStudent();
    } else if (choice == '2') {
      studentManagementSystem.viewStudents();
    } else if (choice == '3') {
      studentManagementSystem.deleteStudent();
    } else if (choice == '4') {
      print('Exiting the program. Goodbye!');
      exit(0);
    } else {
      print('Invalid choice. Please enter a number between 1 and 4.\n');
    }
  }
}

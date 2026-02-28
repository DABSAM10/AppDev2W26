void main() {
  Map<String, double> salaries = {
    "John": 65000,
    "Charles": 48000,
    "Jenny": 70000,
    "Karen": 85000,
    "Tom": 55000
  };

  salaries.forEach((name, salary) {
    if (salary >= 50000 && salary <= 75000)  {
      print(name);
    }
  });
}
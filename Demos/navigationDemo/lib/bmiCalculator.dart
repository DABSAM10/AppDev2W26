import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/second': (context) => Result()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  double bmi = 0.0;

  String calculate() {
    double w = double.tryParse(weight.text) ?? 0;
    double h = double.tryParse(height.text) ?? 0;
    setState(() {
      bmi = (w / (h * h));
    });
    return bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Mass Index (BMI) Calculator',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter your weight (kg)'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: height,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter your height (m)'
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/second',
                      arguments: {
                        'weight': weight.text,
                        'height': height.text,
                        // 'bmi': calculate()
                      }
                  );
                  // Navigator.pushNamed(context, '/second', arguments: height);
                },
                child: Text('Compute')
            )
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final int weight = int.tryParse(data['weight'] ?? '0') ?? 0;
    final double height = double.tryParse(data['height'] ?? '0') ?? 0;
    // final double bmi = double.tryParse(data['bmi'] ?? '0') ?? 0;
    final double bmi = weight / (height * height);
    final Widget result;

    if (bmi < 18.5) {
      result = Text('Underweight', style: TextStyle(fontSize: 28, color: Colors.blueAccent),
      ) as Widget;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = Text('Normal', style: TextStyle(fontSize: 28, color: Colors.green),
      ) as Widget;
    } else if (bmi >= 25 && bmi <= 29.9) {
      result = Text('Overweight', style: TextStyle(fontSize: 28, color: Colors.yellowAccent),
      );
    } else {
      result = Text('Obese', style: TextStyle(fontSize: 28, color: Colors.red),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'BMI Result',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Text('Weight: $weight\t\tHeight: $height', style: TextStyle(fontSize: 18),),
            SizedBox(height: 15,),
            Text(
                'BMI: ${bmi.toStringAsFixed(1)}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
        SizedBox(height: 15,),
        result
          ],
        ),
      ),
    );
  }
}

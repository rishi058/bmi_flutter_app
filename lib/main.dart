import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment 1',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//******************************************************************************************************************************

class _HomeState extends State<Home> {

  final _heightController = TextEditingController();


  final _weightController = TextEditingController();

  double? _bmi;

  String _message = 'Please enter your height an weight';


  void _calculate(){
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);


    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    }
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: Colors.white54,

      ),

      backgroundColor: Colors.deepOrange,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

          children: <Widget>[
            Container(
              width: 280,
              height: 350,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(labelText: 'Height(m)'),
                    controller: _heightController,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(labelText: 'Weight(kg)'),
                    controller: _weightController,
                  ),
                  ElevatedButton(onPressed: _calculate, child: Text('Calculate'),),
                  const SizedBox(height: 30,),
                  Container(
                    child: Text(
                      _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      _message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

            Container(
              width: 280,
              height: 350,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: 'Height(m)'),
                        controller: _heightController,
                      ),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: 'Weight(kg)'),
                        controller: _weightController,
                      ),
                      ElevatedButton(onPressed: _calculate, child: Text('Calculate'),),
                      const SizedBox(height: 30,),
                      Container(
                        child: Text(
                          _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Text(
                          _message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

        ],



      ),
    );
  }
}

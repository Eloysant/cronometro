/*import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  //-----------------------------------------------------------LOGICA DE LA APP:
  int segundos = 0, minutos = 0, horas = 0;
  String digitsegundo = "00", digitminuto = "00", digithoras = "00";

  Timer? timer;
  bool started = false;
  List laps = [];

  //----------------------------------------------------------FUNCION DE PARAR TIEMPO:
  void parar() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //----------------------------------------------------------FUNCION DE REINICIAR TIEMPO:
  void reiniciar() {
    timer!.cancel();
    setState(() {
      segundos = 0;
      minutos = 0;
      horas = 0;

      digitsegundo = "00";
      digitminuto = "00";
      digithoras = "00";

      started = false;
    });
  }

  void addlap() {
    String lap = "$digitsegundo:$digitminuto:$digithoras";

    setState(() {
      laps.add(lap);
    });
  }

  //----------------------------------------------------------FUNCION DE INICIAR TIEMPO:
  void iniciar() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localsegundos = segundos + 1;
      int localminutos = minutos;
      int localhoras = horas;

      if (localsegundos > 59) {
        if (localminutos > 59) {
          localhoras++;
          localminutos = 0;
        } else {
          localminutos++;
          localsegundos = 0;
        }
      }
      setState(() {
        segundos = localsegundos;
        minutos = localminutos;
        horas = localhoras;
        digitsegundo = (segundos >= 10) ? "$segundos" : "0$segundos";
        digitminuto = (minutos >= 10) ? "$minutos" : "0$minutos";
        digithoras = (horas >= 10) ? "$horas" : "0$horas";
      });
    });

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(
            0xFF1C2757), //----------------------------aqui coloque el color del fondo
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Cronometro App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        28.0, //------------------------------------aqui las puse un poco mas grande
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //------------------------------------------------aqui coloque las letras, les puse color,  y aparte las centre
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "$digithoras:$digitminuto:$digitsegundo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 82.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "lap n° ${index + 1}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "${laps[index]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //---------------------------------------aqui coloque la parte de abajo con un cuadrado y las puntas un poco Circulares
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        (!started) ? iniciar() : parar();
                      },
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text(
                        (!started) ? "Iniciar" : "Pausa",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  //----------------------------------------------aqui cree el boton y le di color a las letras
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      addlap();
                    },
                    icon: Icon(Icons.flag),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        reiniciar();
                      },
                      fillColor: Colors.blue,
                      shape: StadiumBorder(),
                      child: Text(
                        "Reiniciar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      );
    }
  }
}

//-------------------------------------------------------------------------------------------



import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Cronómetro App',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: StopwatchTimer(),
    );
  }
}

class StopwatchTimer extends StatefulWidget {
  @override
  _StopwatchTimerState createState() => _StopwatchTimerState();
}

class _StopwatchTimerState extends State<StopwatchTimer> {
  int _seconds = 0;
  bool started = false;
  List<int> laps = [];

  void iniciar() {
    setState(() {
      started = true;
      Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (started) {
          setState(() {
            _seconds++;
          });
        } else {
          timer.cancel();
        }
      });
    });
  }

  void parar() {
    setState(() {
      started = false;
    });
  }

  void addlap() {
    setState(() {
      laps.add(_seconds);
    });
  }

  void reiniciar() {
    setState(() {
      _seconds = 0;
      laps.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cronómetro App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Tiempo transcurrido: $_seconds seg', style: TextStyle(fontSize: 28)),
            SizedBox(height: 28),
            Expanded(
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vuelta n° ${index + 1}", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                        Text("${laps[index]}", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RawMaterialButton(
                    onPressed: () {
                      (!started) ? iniciar() : parar();
                    },
                    shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                    child: Text((!started) ? "Iniciar" : "Pausa", style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    addlap();
                  },
                  icon: Icon(Icons.flag),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: RawMaterialButton(
                    onPressed: () {
                      reiniciar();
                    },
                    fillColor: Colors.grey,
                    shape: StadiumBorder(),
                    child: Text("Reiniciar", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int seconds = 60;
  bool isRunning = false;

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      Timer.periodic(Duration(seconds: 1), (Timer t) {
        if (seconds == 0) {
          t.cancel();
          setState(() {
            isRunning = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Tiempo terminado'),
                actions: <Widget>[
                  /*FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cerrar'),
                  ),*/
                ],
              );
            },
          );
        } else {
          setState(() {
            seconds--;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temporizador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tiempo restante: $seconds segundos',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            /*RaisedButton(
              onPressed: startTimer,
              child: Text('Iniciar temporizador'),
            ),*/
          ],
        ),
      ),
    );
  }
}

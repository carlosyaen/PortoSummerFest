import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.indigo.shade800,
        textTheme: GoogleFonts.acmeTextTheme(),
      ),
      home: const MyHomePage(title: 'PortoSummerFest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController _controller;
  final Map _numeros = {123456: 'Bono Copas', 654321: 'Chupito'};

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _checkValue(String value) {
    //return (_numeros.contains(value));
    int valor = int.parse(value);
    String mensaje = '¡SE SIENTE!';
    String premio = 'No desistas, sigue intentándolo';
    if (_numeros.containsKey(valor)) {
      mensaje = '¡ENHORABUENA!';
      String premio2 = _numeros[valor];
      premio = '¡Has ganado un  ' + premio2;
      print(premio2);
      print(premio);
    }
    print(_numeros[value]);

    return AlertDialog(
      title: Text(mensaje),
      content: Text(premio),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Prueba tu código aquí',
            ),
            const Text("¡MUCHA SUERTE!"),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            SizedBox(
              width: 100,
              height: 70,
              child: TextField(
                controller: _controller,
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _checkValue(value);
                    },
                  );
                },
              ),
            ),
            const TextButton(
              onPressed: null,
              child: Text("Comprobar"),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

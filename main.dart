import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // tirar o debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void decrement() {
    setState(() {
      count--;
      if (count < 0) {
        count == 'Error';
      }
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/images/hillux.jpg'),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // eixo principal mainaxixalignment

            children: [
              Text(
                isFull ? 'Está lotado' : 'Pode entrar',
                style: TextStyle(
                    fontSize: 26,
                    color: isFull
                        ? Color.fromARGB(255, 250, 17, 0).withRed(1)
                        : Colors.blue,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                '$count',
                style: TextStyle(
                    fontSize: 26,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement, // para o padding
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.2)
                            : Colors.blue,
                        fixedSize: const Size(100, 100),
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )), // .only(left: 00, ...) para especificar os lados especificos
                    // ou .fromLTRB
                    child: Text(
                      'Saiu',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.2) : Colors.blue,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Entrando',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

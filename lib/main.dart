import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/FadeAnimation.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            image:
                'https://raw.githubusercontent.com/ReyesRamirez/Act1_FlutterTrip/main/nigiri.jpg',
            title: "Sushi Nigiri",
            description:
                'El Nigiri es la expresión más pura y elegante del sushi. Cada pieza consiste en una pequeña porción de arroz de sushi, moldeada a mano a la perfección, coronada con una loncha impecable de pescado o marisco fresco de la más alta calidad. Una experiencia minimalista pero profundamente satisfactoria que resalta la frescura del ingrediente principal.',
            pageNumber: 1,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ReyesRamirez/Act1_FlutterTrip/main/arcoiris.png',
            title: "Sushi Arcoiris",
            description:
                'El Arcoíris es una obra de arte culinaria que deleita tanto a la vista como al paladar. Sobre un roll de sushi relleno de cangrejo y aguacate, se despliega una vibrante selección de finas lonchas de pescado fresco, como atún, salmón y pez blanco. Cada pieza ofrece una sinfonía de texturas y sabores que te transportarán.',
            pageNumber: 2,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ReyesRamirez/Act1_FlutterTrip/main/roll.jpg',
            title: "Sushi Rolls",
            description:
                'Nuestros Sushi Rolls son una explosión de sabor en cada bocado. Delicadas láminas de alga nori abrazan arroz de sushi perfectamente sazonado, rellenos de ingredientes frescos como pescado, mariscos, vegetales crujientes y cremosos aderezos. Ideales para compartir o para disfrutar de una comida completa y deliciosa. ¡Hay uno para cada gusto!',
            pageNumber: 3,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ReyesRamirez/Act1_FlutterTrip/main/empanizado.jpg',
            title: "Sushi Empanizado",
            description:
                'Para los amantes de lo crujiente, nuestro sushi Empanizado es la elección perfecta. Estos rolls se rebozan ligeramente y se fríen hasta obtener una capa dorada y crocante que contrasta maravillosamente con el suave relleno interior. Experimenta una nueva dimensión de sabor y textura con cada mordisco.',
            pageNumber: 4,
          ),
        ],
      ),
    );
  }

  Widget makePage(
      {required String image,
      required int pageNumber,
      title,
      required String description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(
                    delay:
                        1.0, // Puedes ajustar este valor para controlar el momento de la animación
                    child: Text(
                      pageNumber.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Aquí puedes agregar más widgets si necesitas
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        delay:
                            2.0, // El delay debe ser un double y usar nombre de parámetro
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                          delay: 1.5,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                              Text(
                                '4.0',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '(2300)',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          delay: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              description,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  height: 1.9,
                                  fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:191689610.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3450377488.
                      FadeAnimation(
                          delay: 2.2,
                          child: Text(
                            'READ MORE',
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

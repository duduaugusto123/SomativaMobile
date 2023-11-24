import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TravelHomePage(animal: false),
    );
  }
}

class Destination {
  final String name;
  final String description;
  final String imagePath;
  final double baseValue;
  final int numberOfPeople;
  final double costPeople;
  final double destinationPeopleValue;
  final bool animal;

  Destination({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.baseValue,
    required this.numberOfPeople,
    required this.costPeople,
    required this.destinationPeopleValue,
    required this.animal,
  });
}

class DestinationDetails {
  final String name;
  final String description;
  final double baseValue;
  final int numberOfPeople;
  final String imagePath;
  final double destinationPeopleValue;
  final double costPeople;
  final bool animal;

  DestinationDetails({
    required this.name,
    required this.description,
    required this.baseValue,
    required this.numberOfPeople,
    required this.imagePath,
    required this.destinationPeopleValue,
    required this.costPeople,
    required this.animal,
  });
}

class TravelHomePage extends StatelessWidget {
  final List<Destination> destinations;
  final bool animal;

  TravelHomePage({Key? key, required this.animal})
      : destinations = generateDestinations(animal),
        super(key: key);

  static List<Destination> generateDestinations(bool animal) {
    List<Destination> destinations = [];
    List<String> destinationNames = [
      "Angra dos Reis",
      "Arraial do Cabo",
      "Florianópolis",
      "Jericoacoara",
      "Chile",
      "Madrid",
      "Paris",
      "Roma",
      "Orlando",
      "LasVegas"
    ];
    List<String> destinationDescriptions = [
      "Um paraíso tropical no litoral do Rio de Janeiro, Angra dos Reis encanta com suas ilhas paradisíacas, praias de águas cristalinas e a exuberante Mata Atlântica.",
      "Conhecido como o Caribe brasileiro, Arraial do Cabo impressiona com suas praias de areias brancas, águas azul-turquesa e uma rica vida marinha, ideal para mergulho",
      "A ilha da magia no sul do Brasil, Florianópolis combina praias deslumbrantes, dunas, lagoas e uma atmosfera descontraída, oferecendo uma experiência única entre o urbano e a natureza.",
      "Um oásis no nordeste brasileiro, Jericoacoara é famoso por suas dunas, lagoas de água doce, ventos ideais para kitesurfe e um pôr do sol inesquecível nas dunas.",
      "Do deserto do Atacama aos picos nevados da Cordilheira dos Andes, o Chile cativa com sua diversidade geográfica, vinhedos exuberantes, e cidades vibrantes como Santiago.",
      "A capital espanhola, Madrid é um centro cultural efervescente, repleto de museus de classe mundial, arquitetura histórica, animada vida noturna e uma gastronomia que celebra a paixão espanhola pela comida.",
      "A Cidade Luz, Paris é sinônimo de romance, arte e moda. Com ícones como a Torre Eiffel, o Louvre e a Champs-Élysées, oferece uma experiência encantadora em cada esquina.",
      "Uma cidade eterna, Roma é um tesouro histórico com o Coliseu, o Fórum Romano e o Vaticano. Além disso, sua culinária deliciosa e atmosfera romântica conquistam os visitantes.",
      "O destino dos sonhos para os amantes de parques temáticos, Orlando é lar da Disney World, Universal Studios e outras atrações mágicas que encantam crianças e adultos.",
      "Conhecida como a cidade do entretenimento, Las Vegas é famosa por seus cassinos deslumbrantes, espetáculos de classe mundial, vida noturna agitada e uma atmosfera de luxo e diversão sem limites.",
    ];
    List<String> destinationImagePaths = [
      'build/assets/destination_1.png',
      'build/assets/destination_2.png',
      'build/assets/destination_3.png',
      'build/assets/destination_4.png',
      'build/assets/destination_5.png',
      'build/assets/destination_6.png',
      'build/assets/destination_7.png',
      'build/assets/destination_8.png',
      'build/assets/destination_9.png',
      'build/assets/destination_10.png',
    ];
    List<double> destinationBaseValue = [
      384,
      571,
      534,
      348,
      401,
      546,
      616,
      504,
      478,
      446,
    ];

    List<double> destinationPeopleValue = [
      70,
      65,
      85,
      75,
      95,
      85,
      95,
      85,
      105,
      110,
    ];

    for (int i = 0; i < destinationNames.length; i++) {
      destinations.add(
        Destination(
          name: destinationNames[i],
          description: destinationDescriptions[i],
          imagePath: destinationImagePaths[i],
          baseValue: double.parse(destinationBaseValue[i].toString()),
          destinationPeopleValue: destinationPeopleValue[i],
          numberOfPeople: 4,
          costPeople: destinationPeopleValue[i],
          animal: animal,
        ),
      );
    }
    return destinations;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselScreen(destinations: destinations);
  }
}

class CarouselScreen extends StatelessWidget {
  final List<Destination> destinations;

  CarouselScreen({required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('TripSave Destinations'),
        ),
        backgroundColor: Color.fromRGBO(0, 199, 225, 0.784),
        actions: [
          IconButton(
            onPressed: () {
              // Login function to login and if
              // also logged turn to logoff button
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            CarouselSlider(
              items: destinations.map((destination) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Text(
                            destination.name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  destination.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReservationDetailsScreen(
                                    destinationDetails: DestinationDetails(
                                      name: destination.name,
                                      description: destination.description,
                                      baseValue: destination.baseValue,
                                      costPeople: destination.costPeople,
                                      numberOfPeople: destination.numberOfPeople,
                                      imagePath: destination.imagePath,
                                      destinationPeopleValue: destination
                                          .destinationPeopleValue,
                                      animal: destination.animal,
                                    ),
                                    animal: destination.animal,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Reservar'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  // Lógica para mudar de página
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReservationDetailsScreen extends StatefulWidget {
  final DestinationDetails destinationDetails;
  final bool animal;

  ReservationDetailsScreen({required this.destinationDetails, required this.animal});

  @override
  _ReservationDetailsScreenState createState() => _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  int numberOfPeople = 1;
  int numberOfDays = 1;
  double costAnimal = 0;

  void onPeopleChanged(int value) {
    setState(() {
      numberOfPeople = value;
    });
  }

  void onDaysChanged(int value) {
    setState(() {
      numberOfDays = value;
    });
  }

  void onAnimalChanged(bool value) {
    setState(() {
      costAnimal = value ? 50 : 0;
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    double basePrice = widget.destinationDetails.baseValue;
    double pricePerPerson = widget.destinationDetails.costPeople;

    totalPrice = (basePrice * numberOfDays) + (pricePerPerson * numberOfPeople) + costAnimal;

    return totalPrice;
  }

  void showReservationAlert(BuildContext context, double totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reserva Realizada'),
          content: Text(
            'Sua reserva foi confirmada em ${widget.destinationDetails.name}!\nPreço Total: \$${totalPrice.toStringAsFixed(2)}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Reserva'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  widget.destinationDetails.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              widget.destinationDetails.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Valor Diária: \$${widget.destinationDetails.baseValue.toString()}',
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.destinationDetails.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            ReservationForm(
              onPeopleChanged: onPeopleChanged,
              onDaysChanged: onDaysChanged,
              onAnimalChanged: onAnimalChanged,
              onCalculateTotal: () {
                double totalPrice = calculateTotalPrice();
                print('Preço Total: \$${totalPrice.toStringAsFixed(2)}');
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showReservationAlert(context, totalPrice);
              },
              child: const Text('Reservar'),
            ),
            const SizedBox(height: 10),
            Text('Preço Total: \$${totalPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class ReservationForm extends StatefulWidget {
  final Function(int) onPeopleChanged;
  final Function(int) onDaysChanged;
  final Function(bool) onAnimalChanged;
  final Function() onCalculateTotal;

  ReservationForm({
    required this.onPeopleChanged,
    required this.onDaysChanged,
    required this.onAnimalChanged,
    required this.onCalculateTotal,
  });

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  int numberOfPeople = 1;
  bool animal = false;
  int numberOfDays = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      width: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(10, 67, 240, 0.498),
            Color.fromRGBO(0, 204, 255, 0.5)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pessoas: $numberOfPeople',
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      if (numberOfPeople > 1) {
                        setState(() {
                          numberOfPeople--;
                          widget.onPeopleChanged(numberOfPeople);
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        numberOfPeople++;
                        widget.onPeopleChanged(numberOfPeople);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dias: $numberOfDays',
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      if (numberOfDays > 1) {
                        setState(() {
                          numberOfDays--;
                          widget.onDaysChanged(numberOfDays);
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        numberOfDays++;
                        widget.onDaysChanged(numberOfDays);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Animais: ${animal ? 'Sim' : 'Não'}',
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  Switch.adaptive(
                    value: animal,
                    onChanged: (bool value) {
                      setState(() {
                        animal = value;
                        widget.onAnimalChanged(value);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
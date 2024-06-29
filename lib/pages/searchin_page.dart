import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 131, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use ClipRRect to give the image rounded corners
            SizedBox(
              width: 250, // Set this to the actual width of your image
              height: 250, // Set this to the actual height of your image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                child: Image.asset(
                  "assets/images/weather-3889464_960_720.webp",
                  fit: BoxFit.cover,
                ),
              ),
            ),
           
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Enter City Name",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String city = cityController.text;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HomePage(city: city);
                }));
              },
              child: const Text("Check Weather"),
            ),
            const SizedBox(
              height: 100,)
          ],
        ),
      ),
    );
  }
}

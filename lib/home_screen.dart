import 'package:flutter/material.dart';
import 'gemini.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var languageToTranslate = "English";
  var translateToLanguage = "English";
  final translationInputController = TextEditingController();
  final translationOutputController = TextEditingController();
  bool isLoading = false;
  var languages = [
    "English",
    "Dutch",
    "French",
    "German",
    "Italian",
    "Portuguese",
    "Russian",
    "Spanish",
    "Turkish",
    "Urdu"
  ];

  void clearScreen() {
    translationOutputController.clear();
  }

  void _showEmptyTextDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Please type something to translate.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Translator App',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.grey[50]),
          ),
          backgroundColor: Colors.grey[700],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      items: languages.map((String dropdownMenuItem) {
                        return DropdownMenuItem<String>(
                          value: dropdownMenuItem,
                          child: Text(dropdownMenuItem,
                              style: TextStyle(color: Colors.grey[50])),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          languageToTranslate = newValueSelected!;
                        });
                      },
                      value: languageToTranslate,
                      dropdownColor: Colors.grey[700],
                      underline: Container(
                        height: 2,
                        color: Colors.grey[50],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.grey[50],
                        size: 30,
                      ),
                    ),
                    DropdownButton<String>(
                      items: languages.map((String dropdownMenuItem) {
                        return DropdownMenuItem<String>(
                          value: dropdownMenuItem,
                          child: Text(dropdownMenuItem,
                              style: TextStyle(color: Colors.grey[50])),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          translateToLanguage = newValueSelected!;
                        });
                      },
                      value: translateToLanguage,
                      dropdownColor: Colors.grey[700],
                      underline: Container(
                        height: 2,
                        color: Colors.grey[50],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 150,
                  child: TextField(
                    controller: translationInputController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Enter the text to translate',
                      hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0), // Adjust padding to fit.
                    ),
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 150,
                  child: TextField(
                    controller: translationOutputController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: 'Output will be shown here',
                      hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0), // Adjust padding to fit.
                    ),
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (translationInputController.text.isEmpty) {
                      _showEmptyTextDialog();
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      String message = translationInputController.text;
                      await run(
                        message: message,
                        languageToTranslate: languageToTranslate,
                        translateToLanguage: translateToLanguage,
                      );
                      String response = getRespone();
                      setState(() {
                        clearScreen();
                        isLoading = false;
                        translationOutputController.text = response;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    shadowColor: Colors.grey[900],
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.grey[50],
                          strokeWidth: 2,
                        )
                      : Text('Translate',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[50])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

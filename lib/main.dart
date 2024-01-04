import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> termsAndConditions = [
    {
      "id": 7610,
      "value": "1 Year Service Warranty & 5 Years Plywood Warranty",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7611,
      "value":
      "Customer Should inform about the Changes (if any Design & colour) before\nproduction or else Customer should pay Extra",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7612,
      "value": "Material will be delivered 3-4 weeks the date of Confirmation of Order",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7613,
      "value": "Quotation cant be changed / revised once accepted by the customer",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7614,
      "value": "If any extra works are needed then it should be paid by customer",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7615,
      "value":
      "Custom Handles will be charged extra.Handle price may vary based of designs &\nspecifications",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7616,
      "value": "Once the Project is confirmed, the amount cannot be refunded",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7617,
      "value": "This Quote will be valid only for 15 Days",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    },
    {
      "id": 7618,
      "value":
      "Any additional work which is out of the quotation in any aspects is to be paid extra by\nthe customer",
      "createdAt": "2023-09-04 12:11:42",
      "updatedAt": "2023-09-04 12:11:42"
    }
  ];

  late OnDeviceTranslator _onDeviceTranslator;

  ScrollController _scrollController = ScrollController();
  stt.SpeechToText _speech = stt.SpeechToText();
  String spokenText = "";
  bool _isSpeechInitialized = false;

  @override
  void initState() {
    super.initState();
    // Attach the scroll listener in the initState
    _scrollController.addListener(_scrollListener);
    _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.hindi,
    );

    _initSpeechToText();
  }
  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _scrollController.dispose();
    _onDeviceTranslator.close();
    super.dispose();
  }

  // Scroll listener callback
  void _scrollListener() {
    // Check if we have reached the end of the list
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Load more terms and conditions
      _loadMoreTermsAndConditions();
    }
  }

  // Load more terms and conditions
  void _loadMoreTermsAndConditions() {
    // For demonstration purposes, let's add more dummy data
    // In a real-world scenario, you would fetch data from an API or another source
    setState(() {
      termsAndConditions.addAll([
        {
          "id": 7610,
          "value": "1 Year Service Warranty & 5 Years Plywood Warranty",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7611,
          "value":
          "Customer Should inform about the Changes (if any Design & colour) before\nproduction or else Customer should pay Extra",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7612,
          "value": "Material will be delivered 3-4 weeks the date of Confirmation of Order",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7613,
          "value": "Quotation cant be changed / revised once accepted by the customer",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7614,
          "value": "If any extra works are needed then it should be paid by customer",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7615,
          "value":
          "Custom Handles will be charged extra.Handle price may vary based of designs &\nspecifications",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7616,
          "value": "Once the Project is confirmed, the amount cannot be refunded",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7617,
          "value": "This Quote will be valid only for 15 Days",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        },
        {
          "id": 7618,
          "value":
          "Any additional work which is out of the quotation in any aspects is to be paid extra by\nthe customer",
          "createdAt": "2023-09-04 12:11:42",
          "updatedAt": "2023-09-04 12:11:42"
        }
      ]);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: ListView.builder(
        controller: _scrollController, // Assign the ScrollController
        itemCount: termsAndConditions.length + 1, // +1 for the "Add More" button
        itemBuilder: (context, index) {
          if (index == termsAndConditions.length) {
            // This is the last item, render the "Add More" button
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Add More" button click
                  // You'll implement this functionality in later steps
                },
                child: Text('Add More'),
              ),
            );
          } else {
            // Render each item as a card
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      termsAndConditions[index]["hindiValue"] ?? termsAndConditions[index]["value"],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "View in Hindi" button click
                      _viewInHindi(index);
                    },
                    child: Text('View in Hindi'),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMoreBottomSheet();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String> translateText(String text, String s) async {
    try {
      final String response = await _onDeviceTranslator.translateText(text);
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  void _viewInHindi(int index) async {
    final englishText = termsAndConditions[index]["value"];
    final hindiText = await translateText(englishText, "hi");

    // Update the UI to display the translated text
    setState(() {
      termsAndConditions[index]["hindiValue"] = hindiText;
    });
  }
  void _showAddMoreBottomSheet() {
    final TextEditingController _inputController = TextEditingController();
    bool isListening = false;
    String spokenText = "";

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _inputController,
                    decoration: InputDecoration(labelText: 'Add New Term'),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Start voice input
                          await _listen();
                          setState(() {
                            _inputController.text = spokenText;
                          });
                        },
                        child: Text('Speak'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle translation for the spoken text
                          String translatedText = await translateText(spokenText, "");
                          _inputController.text = translatedText;
                        },
                        child: Text('Translate'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle adding the new term
                      _addNewTerm(_inputController.text);
                      Navigator.pop(context);
                    },
                    child: Text('Add Term'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  Future<void> _listen() async {
    String recognizedWords = ""; // Separate variable to store spoken text

    if (!_speech.isListening) {
      if (!_isSpeechInitialized) {
        await _initSpeechToText(); // Initialize if not initialized
      }
      print("here2");
      _speech.listen(
        onResult: (val) {
          setState(() {
            spokenText = val.recognizedWords;
          });
          print(val.recognizedWords);
        },
        listenFor: Duration(seconds: 60), // Increase timeout duration
      );
    } else {
      _speech.stop();
    }
  }

  Future<void> _initSpeechToText() async {
    // Check if permission is granted, if not request it
    var status = await Permission.microphone.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      // You might want to show a dialog here explaining why you need the microphone permission
      await Permission.microphone.request();
    }

    // Now check the status again
    status = await Permission.microphone.status;
    if (status.isGranted) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) {
          print('onError: $val');
          setState(() {
            _isSpeechInitialized = false;
          });
        },
      );
      print("Speech to text initialized: $available");
      setState(() {
        _isSpeechInitialized = available;
      });
    } else {
      // Handle the case when the user denied the microphone permission
      print("Microphone permission denied");
      setState(() {
        _isSpeechInitialized = false;
      });
    }
  }
  void _addNewTerm(String term) {
    setState(() {
      termsAndConditions.add({
        "id": DateTime.now().millisecondsSinceEpoch,
        "value": term,
        "createdAt": DateTime.now().toString(),
        "updatedAt": DateTime.now().toString(),
      });
    });
  }
  Future<void> _showMicrophonePermissionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Microphone Permission Required"),
          content: Text(
            "This app requires access to your device's microphone to enable voice input. "
                "Please grant the microphone permission in order to use this feature.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

}

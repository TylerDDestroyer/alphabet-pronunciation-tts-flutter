import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alphabet Pronunciation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: KidsAlphabetGuideScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/letters': (context) => LettersScreen(),
        '/match_letters': (context) => MatchLettersScreen(),
        '/letter_sound': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'];

  final List<String> alphabetItems = [
    'A, Apple',
    'B, Ball',
    'C, Cat',
    'D, Dog',
    'E, Elephant',
    'F, Fish',
    'G, Grapes',
    'H, Hat',
    'I, Ice cream',
    'J, Jacket',
    'K, Kite',
    'L, Lion',
    'M, Monkey',
    'N, Nest',
    'O, Orange',
    'P, Penguin',
    'Q, Queen',
    'R, Rainbow',
    'S, Sun',
    'T, Tree',
    'U, Umbrella',
    'V, Violin',
    'W, Watermelon',
    'X, Xylophone',
    'Y, Yak',
    'Z, Zebra',
  ];


  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Pronunciation',style: TextStyle(fontFamily: 'Jolly',fontSize: 30,
          color: Colors.yellowAccent,
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],)),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green
      ,
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(alphabets.length, (index) {
          return GestureDetector(
            onTap: () {
              _speak(alphabetItems[index]);
            },
            child: Card(
              elevation: 5,
              color: Colors.yellowAccent,
              child: Center(
                child: Text(
                  alphabets[index],
                  style: TextStyle(fontSize: 48, fontFamily: 'Jolly',
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],color: Colors.greenAccent),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _speak(String letter) {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage("en-US");
    flutterTts.speak(letter);
  }
}
class KidsAlphabetGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/StockCake-Colorful Alphabet Soup_1719706612.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.music_note,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                'Alpha Speak',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Jolly', color: Colors.yellowAccent,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icon(Icons.play_arrow,color: Colors.black,),
                label: Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Jolly',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.green
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Alpha Speak',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Jolly',
            color: Colors.yellowAccent,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/StockCake-Colorful Alphabet Mess_1719717765.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/letters');
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/StockCake-Alphabet cookie A_1719717820.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Letters',
                          style: TextStyle(fontSize: 20,color: Colors.yellowAccent, fontFamily: 'Jolly',
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/letter_sound');
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/StockCake-Colorful Alphabet Soup_1719706612.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Letter Sound',
                          style: TextStyle(fontFamily: 'Jolly',color: Colors.yellowAccent, fontSize: 20,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/match_letters');
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/StockCake-Magnified Alphabet Soup_1719717638.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Match Letters',
                          style: TextStyle(fontSize: 20,color: Colors.yellowAccent, fontFamily: 'Jolly',
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class LettersScreen extends StatelessWidget {
  final List<String> alphabets = ['Aa', 'Bb', 'Cc', 'Dd', 'Ee', 'Ff', 'Gg', 'Hh', 'Ii', 'Jj',
    'Kk', 'Ll', 'Mm', 'Nn', 'Oo', 'Pp', 'Qq', 'Rr', 'Ss', 'Tt',
    'Uu', 'Vv', 'Ww', 'Xx', 'Yy', 'Zz'];

  final List<String> alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'];

  void _speak(String letter) {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage("en-US");
    flutterTts.speak(letter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Alphabet',style: TextStyle(fontFamily: 'Jolly',fontSize: 30,
          color: Colors.yellowAccent,
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],)),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green
      ,
      body: GridView.count(
        crossAxisCount: 1,
        children: List.generate(alphabets.length, (index) {
          return GestureDetector(
            onTap: () {
              _speak(alphabet[index]);
            },
            child: Card(
              elevation: 5,
              color: Colors.yellowAccent,
              child: Center(
                child: Text(
                  alphabets[index],
                  style: TextStyle(fontSize: 150,fontFamily: 'Appercu',
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],color: Colors.greenAccent),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MatchLettersScreen extends StatefulWidget {
  @override
  _MatchLettersScreenState createState() => _MatchLettersScreenState();
}

class _MatchLettersScreenState extends State<MatchLettersScreen> {
  late stt.SpeechToText _speech;
  String _recognizedWords = '';
  Map<String, String> _correctPronunciations = {
    'A': 'apple',
    'B': 'banana',
    // Add more alphabet-pronunciation pairs as needed
  };
  bool _isListening = false;
  String _currentLetter = '';
  String _feedbackMessage = '';
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _speechRecognitionAvailable = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeechRecognizer();
    _currentLetter = _correctPronunciations.keys.first;
  }

  Future<void> _initializeSpeechRecognizer() async {
    try {
      print('Initializing speech recognizer...');
      _speechRecognitionAvailable = await _speech.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (error) {
          print('onError: $error');
          if (error.errorMsg == 'speech recognition not available') {
            setState(() {
              _feedbackMessage = 'Speech recognition not available. Please install Google Speech Recognition.';
            });
            _showInstallPrompt();
          }
        },
      );
      print('Speech recognizer initialized: $_speechRecognitionAvailable');
      if (!_speechRecognitionAvailable) {
        setState(() {
          _feedbackMessage = 'Speech recognition not available.';
        });
      }
    } catch (e) {
      print('Error initializing speech recognizer: $e');
      setState(() {
        _feedbackMessage = 'Error initializing speech recognizer. Please try again.';
      });
    }
  }

  void _showInstallPrompt() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Install Google Speech Recognition'),
          content: Text('Google Speech Recognition is not installed. Please install it from the Google Play Store.'),
          actions: <Widget>[
            TextButton(
              child: Text('Install'),
              onPressed: () {
                _launchURL('https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void startListening() {
    if (_speechRecognitionAvailable && !_speech.isListening) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            _recognizedWords = result.recognizedWords.trim().toLowerCase();
            print('Recognized words: $_recognizedWords');
            // Compare recognized words with correct pronunciation for the current alphabet
            if (_recognizedWords == _correctPronunciations[_currentLetter]) {
              print('Correct pronunciation for $_currentLetter!');
              _feedbackMessage = 'Correct! Good job!';
              _playSound('correct.mp3');
              _goToNextLetter();
            } else {
              _feedbackMessage = 'Try again!';
              _playSound('incorrect.mp3');
            }
          });
        },
      );
      setState(() {
        _isListening = true;
      });
    } else {
      setState(() {
        _feedbackMessage = 'Speech recognition not available';
      });
    }
  }

  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
      });
    }
  }

  void _goToNextLetter() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _feedbackMessage = '';
        _currentLetter = _correctPronunciations.keys.elementAt(
          (_correctPronunciations.keys.toList().indexOf(_currentLetter) + 1) %
              _correctPronunciations.length,
        );
      });
    });
  }

  void _playSound(String fileName) async {
    await _audioPlayer.play(AssetSource(fileName));
  }

  @override
  void dispose() {
    _speech.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          'Match Letters',
          style: TextStyle(
            fontFamily: "Jolly",
            fontSize: 30,
            color: Colors.yellowAccent,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Say the word for the letter:',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'Apercu',
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _currentLetter,
                    style: TextStyle(
                      fontSize: 160,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jolly',
                      color: Colors.yellowAccent,
                      shadows: [
                        Shadow(
                          offset:
                          const Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _feedbackMessage,
                    style: TextStyle(fontSize: 24, color: Colors.yellowAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isListening ? null : startListening,
              child: Text('Start Recording'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isListening ? stopListening : null,
              child: Text('Stop Recording'),
            ),
            SizedBox(height: 20),
            Text('Recognized Words:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(_recognizedWords, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}



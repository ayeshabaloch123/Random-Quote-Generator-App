import 'package:flutter/material.dart';
import 'package:share/share.dart';

class RandomQuoteScreen extends StatefulWidget {
  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  late String currentQuote;
  Color myCardColor = const Color(0xFF5D5A8C);

  final List<String> quotes = [
    "Be yourself; everyone else is already taken!",
    "So many books, so little time!",
    "Life is what happens when you're busy making other plans!",
    "The only way to do great work is to love what you do!",
    "Success is not final, failure is not fatal: It is the courage to continue that counts!",
    "Be the change that you wish to see in the world!",
    "The only thing we have to fear is fear itself!",
    "It is never too late to be what you might have been!",
    "The best way to predict the future is to create it!",
    "In the middle of difficulty lies opportunity!"
    // Add more quotes as needed
  ];

  @override
  void initState() {
    super.initState();
    generateRandomQuote();
  }

  void generateRandomQuote() {
    final int randomIndex =
        DateTime.now().millisecondsSinceEpoch % quotes.length;
    setState(() {
      currentQuote = quotes[randomIndex];
    });
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  void showSocialMediaIcons(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading:
                    Image.asset('assets/whatsapp.png', width: 24, height: 24),
                title: const Text('WhatsApp'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/fb.jpg', width: 24, height: 24),
                title: const Text('Facebook'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/insta.png', width: 24, height: 24),
                title: const Text('Instagram'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    Image.asset('assets/linkedin.png', width: 34, height: 34),
                title: const Text('LinkedIn'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote Generator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00297F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: myCardColor,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      currentQuote,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        showSocialMediaIcons(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/share-icon.png',
                            width: 40, height: 40),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: generateRandomQuote,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF00297F),
                ),
                fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
              ),
              child: const Text('Get New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}

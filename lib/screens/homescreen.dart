import 'package:all_sports/constants/links.dart';
import 'package:all_sports/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Using url_launcher to remove URL bar and share button

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> unsupportedUrls = [
    'http://41.205.93.154/STARSPORTS1/index.m3u8', // Add any URLs that don't support WebView here
    'http://cdn.live247stream.com/thelight/tv/playlist.m3u8',
    'http://175.107.244.52:4457/play/a08g/index.m3u8',
    'http://fl2.moveonjoy.com/CBS_SPORTS_NETWORK/index.m3u8',
    'http://103.199.161.254/Content/ddsports/Live/Channel(DDSPORTS)/Stream(02)/index.m3u8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 169, 58, 1),
      appBar: AppBar(
        
        title: const Text('Live Stream',style: TextStyle(color: Colors.white, 
        fontFeatures: [
                FontFeature.enable('smcp'), // Small Caps
                FontFeature.enable('liga'), // Enable Ligatures
                FontFeature.enable('onum'), // Old-style Numbers
              ], 
              
              ),
              
              ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
       
       
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(0, 17, 108, 10),
              Color(0xff00ff00),
              Color.fromARGB(255, 95, 163, 95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildLiveStreamButton(context, urlSports18Hindi, "images/18sports.png",
                "Sports 18 Hindi", "Cricket"),
            buildLiveStreamButton(context, urlPrimeHindi, "images/Prime1.png",
                "Prime Hindi", "Hindi Cricket"),
            buildLiveStreamButton(context, urlPrimeEnglish, "images/Prime2.png",
                "Prime English", "English Cricket"),
            buildLiveStreamButton(context, urlPrimeSports, "images/prime.png",
                "Prime Sports", "Sports"),
            buildLiveStreamButton(
                context, urlWillo, imgWillow, "Willow", "Cricket"),
            buildLiveStreamButton(
                context, urlTNT1, "images/TNT1.png", "TNT1", "Cricket"),
            buildLiveStreamButton(
                context, urlSony, "images/Sony.png", "Sony", "Cricket"),
            buildLiveStreamButton(context, urlStarSports1, "images/Star1.png",
                "Star Sports 1", "Cricket"),
            buildLiveStreamButton(context, urlAstro, "images/Astro.png",
                "Astro Cricket", "Cricket"),
            buildLiveStreamButton(
                context, urlMUTV, "images/f1.png", "Football 1", "Football"),
            buildLiveStreamButton(context, urlRealMadrid, "images/f2.png",
                "Football 2", "Football"),
            buildLiveStreamButton(context, urlAbuDhabiFootbal, "images/f3.png",
                "Football 3", "Football"),
            buildLiveStreamButton(context, urlalfasportFootbal2,
                "images/f4.png", "Football 4", "Football"),
            buildLiveStreamButton(context, urlBahrainFootbal3, "images/f5.png",
                "Football 5", "Football"),
            buildLiveStreamButton(context, urlPtvSports, "images/PTVSports.png",
                "PTV Sports", "Sports"),
            buildLiveStreamButton(context, urlTLTislamic,
                "images/TLTislamic.png", "Islamic", "Islamic"),
            buildLiveStreamButton(context, urlAbuDhabiWrestling,
                "images/wres1.jpg", "Wrestling 1", "Wrestling"),
            buildLiveStreamButton(context, urlCombateGlobalWrestling2,
                "images/wres2.png", "Wrestling 2", "Wrestling"),
            buildLiveStreamButton(context, urlAfrosportNigeria,
                "images/advanture.png", "Adventure", "Adventure"),
            buildLiveStreamButton(context, urlSnokersports,
                "images/Snooker.png", "SnookerView", "Snooker"),
            buildLiveStreamButton(context, urlAfrosportNigeria,
                "images/Afro.png", "Afro Sport", "Sports"),
            buildLiveStreamButton(
                context, urlAtgsports, "images/ATG.png", "ATG Sport", "Sports"),
            buildLiveStreamButton(context, urlCBSsportsUSA, "images/cbs.png",
                "CBS Sport", "Sports"),
            buildLiveStreamButton(context, urlDDSports, "images/DDSports.png",
                "DD Sports", "Sports"),
            
            
          ],
        ),
      ),
    );
  }

  Widget buildLiveStreamButton(BuildContext context, String url,
      String imagePath, String label, String subtitle) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xff00ff00),
              Color.fromARGB(0, 17, 108, 10),
              Color.fromARGB(255, 95, 163, 95),
              
            ]),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 90,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      if (unsupportedUrls.contains(url)) {
        // Open in external browser if the URL is in the unsupported list
        if (await canLaunch(url)) {
          await launch(url, forceSafariVC: false, forceWebView: false);
        } else {
          throw 'Could not launch $url';
        }
      } else {
        // Open in WebView for other links
        if (await canLaunch(url)) {
          await launch(
            url,
            forceWebView: true,
            enableJavaScript: true,
          );
        } else {
          throw 'Could not launch $url';
        }
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to launch stream.')),
      );
    }
  }
}

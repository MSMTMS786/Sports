

import 'package:all_sports/constants/links.dart';
import 'package:all_sports/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Sports Live Stream'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 236, 79, 184),
        elevation: 3,
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.purpleAccent,
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
            buildLiveStreamButton(context, urlWillo, "images/willow.png", "Willow"),
            buildLiveStreamButton(context, urlTNT1, "images/TNT1.png", "TNT1"),
            buildLiveStreamButton(context, urlSony, "images/Sony.png", "Sony"),
            buildLiveStreamButton(context, urlStarSports1, "images/Star1.png", "Star Sports 1"),
            buildLiveStreamButton(context, urlAstro, "images/Astro.png", "Astro Cricket"),
            buildLiveStreamButton(context, urlAbuDhabiFootbal, "images/f1.png", "Footbal 1"),
            buildLiveStreamButton(context, urlalfasportFootbal2, "images/footbal2.png", "Footbal 2"),
            buildLiveStreamButton(context, urlBahrainFootbal3, "images/footbal3.png", "Footbal 3"),
            buildLiveStreamButton(context, urlAbuDhabiWrestling, "images/wres1.jpg", "Wrestling 1"),
            buildLiveStreamButton(context, urlCombateGlobalWrestling2, "images/wres2.png", "Wrestling 2"),
            buildLiveStreamButton(context, urlAfrosportNigeria, "images/advanture.png", "Adventure"),
            buildLiveStreamButton(context, urlSnokersports, "images/Snooker.png", "Snooker"),
            buildLiveStreamButton(context, urlAfrosportNigeria, "images/Afro.png", "Afro Sport"),
            buildLiveStreamButton(context, urlAtgsports, "images/ATG.png", "ATG Sport"),
            buildLiveStreamButton(context, urlCBSsportsUSA, "images/cbs.png", "CBS Sport"),
          ],
        ),
      ),
    );
  }

  Widget buildLiveStreamButton(BuildContext context, String url, String imagePath, String label) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () => _launchUrl(context, url),
        child: Container(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 90,
                child: Image.asset(imagePath, fit: BoxFit.contain)),
            
              
              Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Icon(Icons.play_arrow, size: 20, color: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(url),
        customTabsOptions: CustomTabsOptions(
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: false,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
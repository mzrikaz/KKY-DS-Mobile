import 'package:flutter/material.dart';

import '../constants.dart';

class ShowVisionMission extends StatelessWidget {
  final size;
  const ShowVisionMission({
    Key key,
    this.size,
  }) : super(key: key);

  // Vision Mission Card is visible on entry screen of the app

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.maxHeight * 0.18,
      child: Container(
        width: size.maxWidth,
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: kTertiaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'தூரநோக்கு',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'இலங்கையின் அதியுயர் வாழ்க்கைத்தரம் கொண்ட மக்களுடைய காத்தான்குடி பிரதேசம். ',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'பணிக்கூற்று',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'பயன்விளைவுள்ள பிரதேச மட்ட நிர்வாகத்தினூடாக காத்தான்குடி மக்களின் வாழ்க்கைத்தரத்தினை உயர்த்துதல்.',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

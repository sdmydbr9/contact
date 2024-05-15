// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Clinicpaws',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Eyesome',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
              backgroundColor: Colors.transparent, // transparent background
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                // Add your refresh logic here
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent, // transparent background
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://storage.googleapis.com/sudhacdn/light.png',
                      width: 800,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '"Prepare to be enchanted as we whisk your pets away on a whimsical journey through the cosmos of veterinary excellence, where the absurd and the sublime converge in glorious harmony."',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center, // Align text in the center
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _launchURL(
                        'https://schedule.clinicpaws.com/sdmydbr/appointment');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      'Book an Appointment',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: ServicesTile(),
            ),
            const SliverToBoxAdapter(
              child: ContactUsTile(),
            ),
            const SliverToBoxAdapter(
              child: ConnectUsOnSocialTile(),
            ),
            const SliverToBoxAdapter(
              child: AboutMeTile(),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: CupertinoColors.extraLightBackgroundGray.withOpacity(0),
                padding: const EdgeInsets.all(8.0),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Clinicpaws ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black, // Set text color
                          fontStyle:
                              FontStyle.italic, // Set text style to italic
                          fontFamily: 'Eyesome', // Set font family to Eyesome
                        ),
                      ),
                      TextSpan(
                        text: '2023 Copyright © All rights reserved',
                        style: TextStyle(color: Colors.black, fontSize: 8),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Align text in the center
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMeTile extends StatelessWidget {
  const AboutMeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.transparent
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12.0),
          color: CupertinoColors
              .white, // Set the background color of the tile to white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Show enlarged image on tap
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: GestureDetector(
                        onTap: () {
                          // Close the dialog when tapped
                          Navigator.of(context).pop();
                        },
                        child: Image.network(
                          'https://storage.googleapis.com/sudhacdn/profile.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 32, // Adjust the size of the circle avatar as needed
                  backgroundImage: NetworkImage(
                      'https://storage.googleapis.com/sudhacdn/profile.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ), // Set text color to white
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      """I'm a vibrant veterinarian with over two years of experience in clinical practice, class of '24. Passionate about animal welfare and forging connections with both furry patients and their human companions. Outside the clinic, I'm a social butterfly who thrives on exploring diverse interests. From delving into the intricacies of computer science and electronics to unraveling the tapestry of human cultures through anthropology, I find joy in continuous learning. Traveling serves as my canvas for discovery, enriching my understanding of the world. With a blend of compassion, curiosity, and technical prowess, I'm on a journey to make a difference in both animal care and beyond.""",
                      style: TextStyle(
                          color: Colors.black), // Set text color to white
                      softWrap:
                          true, // Allow text to wrap within the available space
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerRight, // Align to the right
                      child: RichText(
                        text: const TextSpan(
                          text: 'Dr.Sudhamoy',
                          style: TextStyle(
                            fontFamily: 'buongiorno',
                            fontSize: 64,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesTile extends StatelessWidget {
  const ServicesTile({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? CupertinoColors.white
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book_circle_fill,
                color: Colors.green[900],
                size: 32, // Use a darker shade of green
              ),
              title: const Text('Consultations'),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 72.0), // Adjust the left padding to align with the text
              child: Divider(
                  color: CupertinoColors
                      .extraLightBackgroundGray), // Divider below Consultations text
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.heart_circle_fill,
                color: Colors.red[900],
                size: 32,
              ),
              title: const Text('Medical checkups'),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 72.0), // Adjust the left padding to align with the text
              child: Divider(
                  color: CupertinoColors
                      .extraLightBackgroundGray), // Divider below Medical checkups text
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.wand_stars,
                color: CupertinoColors.systemYellow,
                size: 28,
              ),
              title: Text('Routine vaccinations'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsTile extends StatelessWidget {
  const ContactUsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? CupertinoColors.white
        : Colors.transparent;
    final borderColor =
        brightness == Brightness.light ? Colors.white : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.person_circle_fill,
                color: CupertinoColors.activeGreen,
                size: 32,
              ),
              title: const Text('Dr. Sudhamoy Debbarma'),
              subtitle: GestureDetector(
                onTap: () async {
                  final Uri phoneUri =
                      Uri(scheme: 'tel', path: '+919612690810');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  } else {}
                },
                child: const Text('+91 9612690810'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 72.0), // Adjust the left padding to align with the text
              child: Divider(
                  color: CupertinoColors
                      .extraLightBackgroundGray), // Divider below Consultations text
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.envelope_circle_fill,
                color: CupertinoColors.activeBlue,
                size: 32,
              ),
              title: GestureDetector(
                onTap: () async {
                  final Uri emailUri =
                      Uri(scheme: 'mailto', path: 'contact@clinicpaws.com');
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  } else {}
                },
                child: const Text('contact@clinicpaws.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 72.0), // Adjust the left padding to align with the text
              child: Divider(
                  color: CupertinoColors
                      .extraLightBackgroundGray), // Divider below Consultations text
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.link_circle_fill,
                color: CupertinoColors.activeBlue,
                size: 32,
              ),
              title: GestureDetector(
                onTap: () async {
                  final Uri websiteUri =
                      Uri.parse('https://www.clinicpaws.com');
                  if (await canLaunchUrl(websiteUri)) {
                    await launchUrl(websiteUri);
                  } else {}
                },
                child: const Text('www.clinicpaws.com'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectUsOnSocialTile extends StatelessWidget {
  const ConnectUsOnSocialTile({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? CupertinoColors.white
        : Colors.transparent;
    final borderColor =
        brightness == Brightness.light ? Colors.white : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Connect Us on Social',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildSocialButton(
                    icon: FontAwesomeIcons.whatsapp,
                    color: const Color(0xFF25D366),
                    text: 'WhatsApp',
                    onPressed: () async {
                      final Uri whatsappUri =
                          Uri.parse('https://wa.me/7085445367');
                      if (await canLaunchUrl(whatsappUri)) {
                        await launchUrl(whatsappUri);
                      } else {}
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.instagram,
                    color: const Color(0xFFE1306C),
                    text: 'Instagram',
                    onPressed: () async {
                      final Uri instagramUri =
                          Uri.parse('https://www.instagram.com/sudha_moy/');
                      if (await canLaunchUrl(instagramUri)) {
                        await launchUrl(instagramUri);
                      } else {}
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    color: const Color(0xFF0077B5),
                    text: 'LinkedIn',
                    onPressed: () async {
                      final Uri linkedinUri = Uri.parse(
                          'https://www.linkedin.com/in/sudhamoy-debbarma-46a6211b6/');
                      if (await canLaunchUrl(linkedinUri)) {
                        await launchUrl(linkedinUri);
                      } else {}
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildSocialButton(
                    icon: FontAwesomeIcons.x,
                    color: Colors.black,
                    text: 'X (formerly twitter)',
                    onPressed: () async {
                      final Uri twitterUri =
                          Uri.parse('https://x.com/sudhamoydebbar/');
                      if (await canLaunchUrl(twitterUri)) {
                        await launchUrl(twitterUri);
                      } else {}
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSocialButton({
  required IconData icon,
  required Color color,
  required String text,
  required VoidCallback onPressed,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20,
        color: color,
      ),
      const SizedBox(width: 12),
      Expanded(
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    ],
  );
}

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

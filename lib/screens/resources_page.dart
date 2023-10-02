import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      'Resources For You',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      'Unlock a world of endless discovery and joy!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 16.0),
                    child: Text(
                      "Explore our treasure trove of knowledge and entertainment designed just for you",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategorySection(
              title: 'Articles',
              icon: Icons.article,
              bgColor: const Color.fromARGB(255, 203, 230, 251),
              children: [
                buildResourceCard(
                  title: 'Healthy Eating Habits for Old People',
                  subtitle: 'Learn about nutrition and aging.',
                  imageUrl: 'images/article1.png',
                  bgcolor: const Color.fromARGB(255, 75, 159, 227),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://medlineplus.gov/nutritionforolderadults.html');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
                buildResourceCard(
                  title: 'Staying Active After Retirement',
                  subtitle: 'Keep your body and mind active.',
                  imageUrl: 'images/article2.png',
                  bgcolor: const Color.fromARGB(255, 75, 159, 227),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://www.irt.org.au/the-good-life/7-ways-to-stay-active-in-retirement/');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
            CategorySection(
              title: 'Books',
              icon: Icons.book,
              bgColor: const Color.fromARGB(255, 248, 206, 147),
              children: [
                buildResourceCard(
                  title:
                      'The Joy of Being Older: Make the Rest of your Life, The Best of your Life',
                  subtitle: 'By: Ingrid Johansson PhD',
                  imageUrl: 'images/book1.jpg',
                  bgcolor: const Color.fromARGB(255, 250, 176, 66),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://books.google.co.in/books/about/The_Joy_of_Being_Older.html?id=kbiKvgEACAAJ&redir_esc=y');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
                buildResourceCard(
                  title: 'A Man Called Ove',
                  subtitle: 'By: Fredrik Backman',
                  imageUrl: 'images/book2.jpeg',
                  bgcolor: const Color.fromARGB(255, 250, 176, 66),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://books.google.co.in/books?id=m7S2CAAAQBAJ&printsec=frontcover&redir_esc=y#v=onepage&q&f=false');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
            CategorySection(
              title: 'Movies',
              icon: Icons.movie,
              bgColor: const Color.fromARGB(255, 254, 178, 204),
              children: [
                buildResourceCard(
                  title: 'Sholay',
                  subtitle: 'Basanti inn kutto ke saamne mat naachna!',
                  imageUrl: 'images/movie1.jpeg',
                  bgcolor: const Color.fromARGB(255, 252, 110, 158),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/pu6tUW-S_-8?si=YBfqRKI9RpRvEzGT');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
                buildResourceCard(
                  title: 'Karan Arjun',
                  subtitle: 'Mere Karan Arjun Aaenge!',
                  imageUrl: 'images/movie2.jpeg',
                  bgcolor: const Color.fromARGB(255, 252, 110, 158),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/uhWcgeItFxU?si=o3o0jaY_c1CwgOX6');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
            CategorySection(
              title: 'Music',
              icon: Icons.music_note,
              bgColor: const Color.fromARGB(255, 235, 193, 242),
              children: [
                buildResourceCard(
                  title: 'Kishore Kumar',
                  subtitle: 'Tune into the music that touches the Heart',
                  imageUrl: 'images/music1.jpeg',
                  bgcolor: const Color.fromARGB(255, 216, 98, 237),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/XjI8ohFGC1I?si=7oW5T3zv_t-m48r5');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
                buildResourceCard(
                  title: 'Lata Mangeshkar',
                  subtitle: 'Enjoy the Soul-Stirring Classics',
                  imageUrl: 'images/music2.jpeg',
                  bgcolor: const Color.fromARGB(255, 216, 98, 237),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/hFpXv4eVfjo?si=DHpk_NgZs1cPuFKO');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
            CategorySection(
              title: 'Videos',
              icon: Icons.video_file,
              bgColor: const Color.fromARGB(255, 206, 249, 208),
              children: [
                buildResourceCard(
                  title: 'Yoga for Senior Citizens',
                  subtitle: 'Stay active and healthy with yoga.',
                  imageUrl: 'images/video1.png',
                  bgcolor: const Color.fromARGB(255, 105, 213, 55),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/laIWV6qJWbk?si=-upb11gAaReN82bL');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
                buildResourceCard(
                  title: 'Meditation Techniques',
                  subtitle: 'Keep your mind at peace!',
                  imageUrl: 'images/video2.png',
                  bgcolor: const Color.fromARGB(255, 105, 213, 55),
                  onTap: () async {
                    Uri url = Uri.parse(
                        'https://youtu.be/inpok4MKVLM?si=ZVj83F5_Jler32tQ');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildResourceCard({
  required String title,
  required String subtitle,
  required String imageUrl,
  required Color bgcolor,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: bgcolor,
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left: Image
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class CategorySection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final List<Widget> children;
  final IconData icon2 = Icons.arrow_forward;

  const CategorySection({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(icon),
            trailing: Icon(icon2),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle category tap
            },
          ),
          ...children,
        ],
      ),
    );
  }
}

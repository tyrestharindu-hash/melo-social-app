
import 'package:flutter/material.dart';

void main() {
  runApp(const MeloApp());
}

const melonGreen = Color(0xFFB8E986);
const darkGreen = Color(0xFF10251A);
const cardGreen = Color(0xFF1A3525);
const mutedGreen = Color(0xFF8BA393);

class MeloApp extends StatelessWidget {
  const MeloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkGreen,
        colorScheme: ColorScheme.fromSeed(
          seedColor: melonGreen,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MeloHome(),
    );
  }
}

class MeloHome extends StatefulWidget {
  const MeloHome({super.key});

  @override
  State<MeloHome> createState() => _MeloHomeState();
}

class _MeloHomeState extends State<MeloHome> {
  int selectedTab = 0;
  String searchText = '';

  final List<Map<String, dynamic>> friends = [
    {
      'name': 'Amaya',
      'message': 'Hey! How are you? 🍈',
      'time': '10:42',
      'color': Colors.pinkAccent,
      'online': true,
      'unread': 2,
    },
    {
      'name': 'Kasun',
      'message': 'Sent you a photo',
      'time': '10:15',
      'color': Colors.blueAccent,
      'online': true,
      'unread': 0,
    },
    {
      'name': 'Nethmi',
      'message': 'See you tomorrow!',
      'time': '09:48',
      'color': Colors.purpleAccent,
      'online': false,
      'unread': 1,
    },
    {
      'name': 'Ravindu',
      'message': 'Voice message',
      'time': 'Yesterday',
      'color': Colors.orangeAccent,
      'online': false,
      'unread': 0,
    },
    {
      'name': 'Melo Friends',
      'message': 'You: Good morning 🌞',
      'time': 'Yesterday',
      'color': melonGreen,
      'online': false,
      'unread': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = friends.where((friend) {
      return friend['name']
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _searchBar(),
            _stories(),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 12),
              child: Row(
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${filtered.length} chats',
                    style: const TextStyle(color: mutedGreen),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final friend = filtered[index];
                  return _chatTile(friend);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: melonGreen,
        foregroundColor: darkGreen,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New chat feature coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.edit_rounded),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: melonGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.chat_bubble_rounded,
              color: darkGreen,
              size: 27,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Melo',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: melonGreen,
                ),
              ),
              Text(
                'Chat. Share. Connect.',
                style: TextStyle(fontSize: 11, color: mutedGreen),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        decoration: BoxDecoration(
          color: cardGreen,
          borderRadius: BorderRadius.circular(18),
        ),
        child: TextField(
          onChanged: (value) {
            setState(() => searchText = value);
          },
          decoration: const InputDecoration(
            hintText: 'Search friends or messages',
            prefixIcon: Icon(Icons.search_rounded),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _stories() {
    final names = ['Your Story', 'Amaya', 'Kasun', 'Nethmi', 'Ravi'];
    final colors = [
      mutedGreen,
      Colors.pinkAccent,
      Colors.blueAccent,
      Colors.purpleAccent,
      Colors.orangeAccent,
    ];

    return SizedBox(
      height: 118,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 18, top: 18),
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: index == 0 ? mutedGreen : melonGreen,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: colors[index],
                    child: index == 0
                        ? const Icon(
                            Icons.add,
                            color: darkGreen,
                            size: 28,
                          )
                        : Text(
                            names[index][0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  names[index],
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _chatTile(Map<String, dynamic> friend) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Chat with ${friend['name']} coming soon!'),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 11,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: friend['color'],
                  child: Text(
                    friend['name'][0],
                    style: const TextStyle(
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                if (friend['online'])
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: melonGreen,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: darkGreen,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    friend['message'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: mutedGreen,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  friend['time'],
                  style: const TextStyle(
                    color: mutedGreen,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 7),
                if (friend['unread'] > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: melonGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${friend['unread']}',
                      style: const TextStyle(
                        color: darkGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: cardGreen,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.chat_bubble_rounded, 'Chats', 0),
          _navItem(Icons.explore_outlined, 'Explore', 1),
          _navItem(Icons.play_circle_outline, 'Moments', 2),
          _navItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final selected = selectedTab == index;

    return InkWell(
      onTap: () {
        setState(() => selectedTab = index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? melonGreen : mutedGreen,
            size: 25,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: selected ? melonGreen : mutedGreen,
            ),
          ),
        ],
      ),
    );
  }
}

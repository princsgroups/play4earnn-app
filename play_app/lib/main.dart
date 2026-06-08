import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Play4EarnnApp());
}

class Play4EarnnApp extends StatelessWidget {
  const Play4EarnnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play4Earnn',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  int _coins = 1842; 

  void _addCoins(int amount) {
    setState(() {
      _coins += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      DashboardScreen(coins: _coins, onCoinsUpdated: _addCoins), 
      const Center(child: Text('Tasks Screen 📝', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))), 
      const Center(child: Text('Earn Screen 💎', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))), 
      WalletScreen(coins: _coins), 
      const Center(child: Text('Profile Screen 👤', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))), 
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, -2))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Tasks'),
              BottomNavigationBarItem(icon: Icon(Icons.stars_outlined), label: 'Earn'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  final int coins;
  final Function(int) onCoinsUpdated;
  const DashboardScreen({super.key, required this.coins, required this.onCoinsUpdated});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final int _lifetimeCoins = 3692;

  @override
  Widget build(BuildContext context) {
    double rupees = widget.coins / 100;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back 👋', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text('Hi, Task', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.black),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF6A11CB).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('YOUR BALANCE', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Color(0xFFFFC107), shape: BoxShape.circle),
                        child: const Icon(Icons.monetization_on, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.coins}',
                            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, height: 1),
                          ),
                          Text(
                            'coins ≈ ₹${rupees.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.trending_up, color: Colors.white, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Lifetime earned: $_lifetimeCoins coins',
                          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFFFFB300).withOpacity(0.15), shape: BoxShape.circle),
                    child: const Icon(Icons.card_giftcard, color: Color(0xFFFFB300), size: 28),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Daily Check-in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(height: 2),
                        Text('Streak badhao · Day 7 par 5x reward', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green, size: 24),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ways to earn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.2,
              children: [
                _buildGridCard('Watch & Earn', 'Up to 50 coins / video', Icons.play_circle_fill, const [Color(0xFFE040FB), Color(0xFF00BCD4)], () {}),
                _buildGridCard('Play Quiz', '5 coins per correct', Icons.psychology, const [Color(0xFFFFB300), Color(0xFFFF6D00)], () {}),
                _buildGridCard('Spin Wheel', 'Win 1 to 30 coins', Icons.incomplete_circle, const [Color(0xFF9C27B0), Color(0xFFFF5252)], () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomSpinWheelScreen(
                        onCoinsWon: (wonCoins) {
                          widget.onCoinsUpdated(wonCoins);
                        },
                      ),
                    ),
                  );
                }),
                _buildGridCard('Refer & Earn', '500 coins per friend', Icons.people, const [Color(0xFFFFB300), Color(0xFFFFAB40)], () {}),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard(String title, String subtitle, IconData icon, List<Color> colors, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  final int coins;
  const WalletScreen({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    double rupees = coins / 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet 💳', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Column(
                children: [
                  const Text('Available Balance', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.amber, size: 32),
                      const SizedBox(width: 8),
                      Text('$coins', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Equivalent to ≈ ₹${rupees.toStringAsFixed(2)}', style: TextStyle(color: Colors.green.shade700, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Withdrawal Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 12),

            _buildWithdrawCard(
              context,
              title: 'Paytm Wallet',
              subtitle: 'Instant transfer to your Paytm wallet',
              iconImage: Icons.account_balance_wallet,
              color: const Color(0xFF00B9F5),
              minCoins: 1000,
              amountText: '₹10',
            ),
            const SizedBox(height: 12),

            _buildWithdrawCard(
              context,
              title: 'UPI Transfer',
              subtitle: 'Transfer directly via BHIM UPI ID',
              iconImage: Icons.vignette_sharp,
              color: const Color(0xFF5E249F),
              minCoins: 5000,
              amountText: '₹50',
            ),
            const SizedBox(height: 12),

            _buildWithdrawCard(
              context,
              title: 'Google Play Redeem Code',
              subtitle: 'Get instant Play Store redeem code',
              iconImage: Icons.shop_two,
              color: const Color(0xFF34A853),
              minCoins: 2500,
              amountText: '₹25',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWithdrawCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData iconImage,
    required Color color,
    required int minCoins,
    required String amountText,
  }) {
    bool isEligible = coins >= minCoins;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
            child: Icon(iconImage, color: color, size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 6),
                Text('Requires $minCoins coins ($amountText)', style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: isEligible 
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$title withdrawal request submitted!')),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey.shade200,
              disabledForegroundColor: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            child: const Text('Redeem', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class CustomSpinWheelScreen extends StatefulWidget {
  final Function(int) onCoinsWon;
  const CustomSpinWheelScreen({super.key, required this.onCoinsWon});

  @override
  State<CustomSpinWheelScreen> createState() => _CustomSpinWheelScreenState();
}

class _CustomSpinWheelScreenState extends State<CustomSpinWheelScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isSpinning = false;
  int _wonValue = 0;
  final List<int> _wheelValues = [2, 10, 5, 30, 1, 8, 3, 20];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spinWheel() {
    if (_isSpinning) return;
    setState(() => _isSpinning = true);
    int luckyRoll = Random().nextInt(100);
    int targetedIndex = luckyRoll < 30 ? 0 : luckyRoll < 55 ? 2 : luckyRoll < 75 ? 4 : luckyRoll < 90 ? 6 : luckyRoll < 96 ? 1 : luckyRoll < 99 ? 7 : 3;
    _wonValue = _wheelValues[targetedIndex];
    double sectorAngle = (2 * pi) / _wheelValues.length;
    double targetAngle = (2 * pi * 4) + (sectorAngle * targetedIndex);
    _animation = Tween<double>(begin: 0, end: targetAngle).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward(from: 0).then((_) {
      widget.onCoinsWon(_wonValue);
      _showRewardDialog(_wonValue);
      setState(() => _isSpinning = false);
    });
  }

  void _showRewardDialog(int coins) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Badhai Ho! 🎉', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.monetization_on, color: Colors.amber, size: 60),
            const SizedBox(height: 12),
            Text('Aapne jeete hain $coins Coins!', style: const

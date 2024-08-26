import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'phone_payment_page.dart';
import 'internet_payment_page.dart';
import 'pstn_payment_page.dart';
import 'electricity_page.dart';
import 'water_supply_page.dart';
import 'notification_page.dart';
import 'my_qr_code_page.dart';
import 'qr_pay_page.dart';
import 'setting_page.dart';
import 'register_agent_page.dart';
import 'register_merchant_page.dart';
import 'show_basic_page.dart';
import 'more_info_page.dart';

class MyHomePage extends StatelessWidget {
  static const List<IconData> _icons = [
    Icons.phone, Icons.wifi, Icons.phone, Icons.electrical_services,
    Icons.water, Icons.notifications, Icons.qr_code, Icons.qr_code_2,
    Icons.settings, Icons.app_registration, Icons.store, Icons.help,
    Icons.info,
  ];

  static const List<String> _labels = [
    'Phone payment', 'Internet payment', 'PSTN payment', 'Electricity',
    'Water supply', 'Notification', 'My QR code', 'QR pay',
    'Setting', 'Register agent', 'Register merchant', 'Show basic',
    'More info',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ETL Digital FinTech',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
         backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
              ),
              Positioned(
                right: 5,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '0', // Replace '0' with the actual notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
            title: const Text('ຮູບໂປໄຟລ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                return _buildGridItem(
                    _icons[index], _labels[index], context, _getPage(index));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label, BuildContext context, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(8), // Optional: To make the corners rounded
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 40, color: Colors.blueAccent),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0: return PhonePaymentPage();
      case 1: return InternetPaymentPage();
      case 2: return PSTNPaymentPage();
      case 3: return ElectricityPage();
      case 4: return WaterSupplyPage();
      case 5: return NotificationPage();
      case 6: return MyQRCodePage();
      case 7: return QRPayPage();
      case 8: return SettingPage();
      case 9: return RegisterAgentPage();
      case 10: return RegisterMerchantPage();
      case 11: return ShowBasicPage();
      case 12: return MoreInfoPage();
      default: return MoreInfoPage();
    }
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("ຢືນຢັນການອອກຈາກລະບົບ"),
          content: const Text("ເຈົ້າແນ່ໃຈ ຫຼື ບໍ່ທີຈະອອກຈາກລະບົບ?"),
          actions: [
            TextButton(
              child: const Text("ຍົກເລີກ"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("ອອກຈາກລະບົບ"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

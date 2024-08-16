import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ETL Digital FinTech'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
            title: const Text('Profile Page'),
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
              itemCount: 13,
              itemBuilder: (context, index) {
                final items = [
                  Icons.phone, Icons.wifi, Icons.phone, Icons.electrical_services,
                  Icons.water, Icons.notifications, Icons.qr_code, Icons.qr_code_2,
                  Icons.settings, Icons.app_registration, Icons.store, Icons.help,
                  Icons.info,
                ];
                final labels = [
                  'Phone payment', 'Internet payment', 'PSTN payment', 'Electricity',
                  'Water supply', 'Notification', 'My QR code', 'QR pay',
                  'Setting', 'Register agent', 'Register merchant', 'Show basic',
                  'More info',
                ];

                return _buildGridItem(items[index], labels[index], context, _getPage(index));
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
          Icon(icon, size: 40, color: Colors.blueAccent),
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
}

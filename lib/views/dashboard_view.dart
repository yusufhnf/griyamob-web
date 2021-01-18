import 'package:flutter/material.dart';
import 'package:griyaadmin/viewmodels/dashboard_viewmodel.dart';
import 'package:griyaadmin/views/announcement_view.dart';
import 'package:griyaadmin/views/history_view.dart';
import 'package:griyaadmin/views/promo_view.dart';
import 'package:griyaadmin/views/summary_view.dart';
import 'package:griyaadmin/views/topup_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<String> _sideMenuTitle = [
    "Summary",
    "Top-up",
    "Pengumuman",
    "Promo",
    "Riwayat Transaksi"
  ];
  final List<IconData> _sideMenuIcon = [
    LineIcons.bar_chart_o,
    LineIcons.money,
    LineIcons.microphone,
    LineIcons.newspaper_o,
    LineIcons.history
  ];

  int _selectedIndex = 0;

  final _layoutPage = [
    SummaryView(),
    TopupView(),
    AnnouncementView(),
    PromoView(),
    HistoryView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [Profile()],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(
                        height: 400.0,
                        child: ListView.builder(
                          itemCount: _sideMenuTitle.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: index == _selectedIndex
                                      ? Colors.blue[800]
                                      : Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      _sideMenuIcon[index],
                                      color: Colors.white,
                                    ),
                                    trailing: Icon(
                                      LineIcons.angle_right,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      _sideMenuTitle[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    onTap: () {
                                      _onItemTapped(index);
                                    },
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(padding: const EdgeInsets.all(16.0), child: LogOut()),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: Text(
                    _sideMenuTitle[_selectedIndex],
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 40.0,
                        color: Colors.blue[900]),
                  ),
                ),
                _layoutPage.elementAt(_selectedIndex),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.busy(model.adminResult)
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  model.position,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.white),
                )
              ],
            ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.busy(model.adminResult)
          ? CircularProgressIndicator()
          : RaisedButton(
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 22.0),
              onPressed: () {
                model.logOutUser();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Center(
                child: Text(
                  "Keluar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
    );
  }
}

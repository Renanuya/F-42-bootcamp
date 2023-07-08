import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thinktank/pages/rankPages/view/rank_page.dart';
import 'package:thinktank/pages/splashPages/splash_page_1.dart';
import 'package:thinktank/pages/splashPages/splash_page_3.dart';

import '../providers/theme.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';
import '../theme/theme_service.dart';
import 'calendar/calendar_main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  // ignore: non_constant_identifier_names
  void OnTabSelected(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      // Ana sayfaya yönlendirme
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (currentIndex == 1) {
      // profil sayfasına yönlendirme
    } else if (currentIndex == 2) {
      // Ayarlar sayfasına yönlendirme
    } else if (currentIndex == 3) {
      // Giriş sayfasına yönlendirme
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPageThree()),
      );
    }
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the sign-in page or any other page you desire

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashPageOne(),
        ),
      );
    } catch (e) {
      // Display an error message or handle the error as needed
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Consumer<ThemeChange>(
              builder: (context, themeChange, _) => IconButton(
                onPressed: () {
                  themeChange.changeTheme =
                      themeChange.isLightTheme ? darkTheme : lightTheme;
                  ThemeService().saveTheme(
                      themeChange.isLightTheme ? 'darkTheme' : 'lightTheme');
                  ThemeService().getThemeFromSave();
                },
                icon: Icon(
                  themeChange.isLightTheme ? Icons.dark_mode : Icons.sunny,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 59, 0),
                  child: Text(
                    user != null
                        ? 'Hoş geldin ${user.displayName}'
                        : 'Aramıza Hoş geldin',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xFF37352F),
                      fontSize: 26,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              padding: const EdgeInsets.fromLTRB(17, 17, 0, 18.28),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffa4a4a3)),
                color: const Color(0xffe7e7e6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: const Text(
                      'Ders çalışmaya başlayın',
                      style: TextStyle(
                        color: Color(0xFF37352F),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 11, 11),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          width: 20,
                          height: 20,
                          decoration:
                              BoxDecoration(color: Colors.black.withOpacity(0)),
                          child: const Stack(
                            //ikon değiştirilecek
                            children: [
                              Icon(
                                Icons.edit_note,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 259,
                          height: 19,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 259,
                                    height: 19,
                                    child: Text(
                                      'Bu gün 3 saat, 25 dakika çalıştınız.',
                                      style: TextStyle(
                                        color: Color(0xFF37352F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          width: 20,
                          height: 20,
                          decoration:
                              BoxDecoration(color: Colors.black.withOpacity(0)),
                          child: const Stack(
                            children: [
                              Icon(Icons.edit_note),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 270,
                          height: 19,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 259,
                                    height: 19,
                                    child: Text(
                                      'Bu hafta 9 saat, 50 dakika çalıştınız.',
                                      style: TextStyle(
                                        color: Color(0xFF37352F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          width: 20,
                          height: 20,
                          decoration:
                              BoxDecoration(color: Colors.black.withOpacity(0)),
                          child: const Stack(
                            children: [
                              Icon(Icons.edit_note),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 270,
                          height: 19,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 259,
                                    height: 19,
                                    child: Text(
                                      '4 gündür her gün çalışıyorsun.',
                                      style: TextStyle(
                                        color: Color(0xFF37352F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(9, 0, 23, 0),
                    width: double.infinity,
                    height: 51.72,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffff534c)),
                      color: const Color(0xfffac6c4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'Zamanlayıcı Aç',
                          style: TextStyle(
                            color: Color(0xFFF13131),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 30),
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarMainPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 36, 17, 34),
                        margin: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffa4a4a3)),
                          color: const Color(0xffe7e7e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              width: 15,
                              height: 30,
                              child: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: const Text(
                                'Takvim',
                                style: TextStyle(
                                  color: Color(0xFF37352F),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RankPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 36, 17, 34),
                        margin: const EdgeInsets.fromLTRB(
                            0, 0, 30, 0), // Add right margin
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffa4a4a3)),
                          color: const Color(0xffe7e7e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              width: 15,
                              height: 30,
                              child: const Icon(
                                Icons.format_list_numbered,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: const Text(
                                'Sıralama',
                                style: TextStyle(
                                  color: Color(0xFF37352F),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 3, 0),
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 36, 17, 34),
                        margin: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffa4a4a3)),
                          color: const Color(0xffe7e7e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              width: 15,
                              height: 30,
                              child: const Icon(
                                Icons.group_rounded,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: const Text(
                                'boş',
                                style: TextStyle(
                                  color: Color(0xFF37352F),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Buraya işlemlerini ekleyebilirsiniz
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 36, 17, 34),
                        margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffa4a4a3)),
                          color: const Color(0xffe7e7e6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              width: 15,
                              height: 30,
                              child: const Icon(
                                Icons.format_list_numbered,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: const Text(
                                'boş',
                                style: TextStyle(
                                  color: Color(0xFF37352F),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
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
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        color: const Color(0xfffac6c4),
        buttonBackgroundColor: const Color(0xffe7e7e6),
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (currentIndex == 0) {
            // Ana sayfaya yönlendirme
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (currentIndex == 1) {
            // profil sayfasına yönlendirme
          } else if (currentIndex == 2) {
            // Ayarlar sayfasına yönlendirme
          } else if (currentIndex == 3) {
            // Giriş sayfasına yönlendirme
            _signOut(context);
          }
        },
        items: const [
          Icon(
            Icons.home,
            color: Color(0xffff534c),
          ),
          Icon(
            Icons.person,
            color: Color(0xffff534c),
          ),
          Icon(
            Icons.settings,
            color: Color(0xffff534c),
          ),
          Icon(
            Icons.logout,
            color: Color(0xffff534c),
          ),
        ],
      ),
    );
  }
}

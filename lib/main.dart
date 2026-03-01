import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elektroinštalácie',
      theme: ThemeData(
        primaryColor: const Color(0xffd32f4a),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Segoe UI',
        useMaterial3: true,
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const ElectricianHomePage(),
    );
  }
}

class ElectricianHomePage extends StatefulWidget {
  const ElectricianHomePage({Key? key}) : super(key: key);

  @override
  State<ElectricianHomePage> createState() => _ElectricianHomePageState();
}

class _ElectricianHomePageState extends State<ElectricianHomePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _isScrolled = _scrollController.offset > 50;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToSection(BuildContext context, String section) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigácia na: $section')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Header with Navigation
            _buildHeader(context),
            // Hero Section
            _buildHeroSection(context),
            // Services Section
            _buildServicesSection(),
            // About Section
            _buildAboutSection(),
            // References Section
            _buildReferencesSection(),
            // Contact Section
            _buildContactSection(context),
            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: _isScrolled
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ]
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                '⚡',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 8),
              Text(
                'Elektroinštalácie',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xffd32f4a),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNavLink(context, 'Domov'),
                _buildNavLink(context, 'Služby'),
                _buildNavLink(context, 'O mne'),
                _buildNavLink(context, 'Referencie'),
                _buildNavLink(context, 'Kontakt'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () => _navigateToSection(context, title),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffd32f4a), Color(0xffa01830)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Spoľahlivé elektroinštalácie\npre domácnosti a firmy',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Profesionálne elektrikárske služby s certifikáciou\na dlhoročnými skúsenosťami v Slovenskej republike.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.95),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => _navigateToSection(context, 'Kontakt'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xffd32f4a),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 4,
            ),
            child: const Text(
              'Kontaktujte ma',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    final services = [
      {
        'icon': '🏠',
        'title': 'Kompletné elektroinštalácie',
        'description':
        'Projektovanie a realizácia elektroinštalácií pre nové aj existujúce budovy.'
      },
      {
        'icon': '🔨',
        'title': 'Rekonštrukcie bytov a domov',
        'description':
        'Modernizácia a úprava elektroinštalácií pri rekonštrukciách priestorov.'
      },
      {
        'icon': '✅',
        'title': 'Revízie elektrických zariadení',
        'description':
        'Odborné revízie a skúšky elektrických zariadení podľa platných noriem.'
      },
      {
        'icon': '💡',
        'title': 'Montáž svietidiel a zásuviek',
        'description':
        'Odborná montáž elektroinštalačných prvkov s garantovanou kvalitou.'
      },
      {
        'icon': '⚡',
        'title': 'Poruchy a havarijná služba',
        'description':
        'Operatívne riešenie porúch 24/7 s rýchlym nasadením kvalitného riešenia.'
      },
    ];

    return Container(
      color: const Color(0xfff5f5f5),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          _buildSectionTitle('Naše služby'),
          const SizedBox(height: 16),
          Text(
            'Komplexný rozsah elektrikárskych služieb na profesionálnej úrovni',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff555555),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1.0,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return _buildServiceCard(
                service['icon'] as String,
                service['title'] as String,
                service['description'] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String icon, String title, String description) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(
              color: const Color(0xffd32f4a),
              width: 0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xffd32f4a),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff555555),
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          _buildSectionTitle('O mne'),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  'Som certifikovaný elektrikár s viac ako 15 rokmi skúseností v oblasti elektroinštalácií. Špecializujem sa na komplexné riešenia pre domácnosti a malé až stredné firmy v Slovenskej republike.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Moja práca je založená na presnosti, profesionalite a zodpovednosti voči mojim klientom. Všetky práce vykonávam v súlade s platnými normami a bezpečnostnými predpismi.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffd32f4a), Color(0xffa01830)],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: const Text(
                    '✓ Certifikovaný elektrikár',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferencesSection() {
    final references = [
      {
        'icon': '🏗️',
        'title': 'Bytový dom - Bratislava',
        'description':
        'Komplexné projektovanie a inštalácia elektroinštalácie pre 8-poschodový bytový dom.',
      },
      {
        'icon': '🏢',
        'title': 'Kancelárske priestory - Košice',
        'description':
        'Modernizácia elektroinštalácií a montáž nového osvetlenia v kancelárskych priestoroch.',
      },
      {
        'icon': '🏭',
        'title': 'Priemyselný objekt - Žilina',
        'description':
        'Pravidelná údržba, revízie a modernizácia elektroinštalácie v priemyselnom objekte.',
      },
    ];

    return Container(
      color: const Color(0xfff5f5f5),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          _buildSectionTitle('Naše referencie'),
          const SizedBox(height: 16),
          Text(
            'Príklady našich úspešne realizovaných projektov',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff555555),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 1.1,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
            itemCount: references.length,
            itemBuilder: (context, index) {
              final ref = references[index];
              return _buildReferenceCard(
                ref['icon'] as String,
                ref['title'] as String,
                ref['description'] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceCard(String icon, String title, String description) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffd32f4a), Color(0xffa01830)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 64),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffd32f4a),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff555555),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          _buildSectionTitle('Kontakt'),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                // Contact Info
                Row(
                  children: [
                    Expanded(
                      child: _buildContactInfo(
                        icon: '📱',
                        title: 'Telefón',
                        value: '+421 950 123 456',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: _buildContactInfo(
                        icon: '✉️',
                        title: 'Email',
                        value: 'info@elektrikarcardos.sk',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildContactInfo(
                  icon: '📍',
                  title: 'Poloha',
                  value: 'Košice',
                  onTap: () {},
                ),
                const SizedBox(height: 48),
                // Contact Form
                _buildContactForm(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo({
    required String icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xff555555),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Zoltán Kardos',
            labelStyle: const TextStyle(
              color: Color(0xffd32f4a),
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xffe0e0e0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffd32f4a),
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: const TextStyle(
              color: Color(0xffd32f4a),
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xffe0e0e0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffd32f4a),
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: messageController,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: 'Správa',
            labelStyle: const TextStyle(
              color: Color(0xffd32f4a),
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xffe0e0e0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffd32f4a),
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  messageController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Prosím, vyplňte všetky polia.'),
                  ),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Ďakujem, ${nameController.text}! Vaša správa bola prijatá.'),
                ),
              );

              nameController.clear();
              emailController.clear();
              messageController.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffc41e3a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'Odoslať správu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xffc41e3a),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      color: const Color(0xff1a1a1a),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Elektroinštalácie. Všetky práva vyhradené.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

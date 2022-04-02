// import 'package:flutter/material.dart';

// import 'constants.dart';
// import 'screen/home/home_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';

// import 'Chat_screen.dart';
// import 'Feed_screen.dart';
// import 'Home_screen.dart';
// import 'Person_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //static final String title = "My App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(title: 'My first flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  int currentIndex = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  final screen = [
    Container(
      child: Text(
        'Home',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    ),
    Container(
      child: Text(
        'Feed',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    ),
    Container(
      child: Text(
        'Chat',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    ),
    Container(
      child: Text(
        'Friends',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    ),
  ]; //screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: IndexedStack(
          index: currentIndex,
          children: screen,
        ),
      ),
      /*Center(
        child: Text(
          //screen[currentIndex],
          'Home',
          style: TextStyle(fontSize: 40),
        ),
      ),*/

      /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),*/

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          //showSelectedLabels: false,
          //showUnselectedLabels: false,
          selectedFontSize: 25,
          unselectedFontSize: 16,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: Colors.deepOrange,
          iconSize: 40,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.deepOrange,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Feed',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Friends',
                backgroundColor: Colors.yellow),
          ]),
    );
  }
}











/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'AppBar';

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyHomePage(title: "My App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int _count = 0;
  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => print("Pressed Menu Button"),
        ),
        title: Text(
          MyApp.title,
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () => print("Pressed Notification Button"),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print("Pressed Search Button"),
          ),
          IconButton(
            icon: Icon(Icons.navigation),
            onPressed: () => print("Pressed Navigation Button"),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 60.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              label: "Feed",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
              backgroundColor: Colors.orange)
        ],
      ),
      floatingActionButton: buildMessageButton(),
    );
  }
}

Widget buildMessageButton() => FloatingActionButton.extended(
      icon: Icon(Icons.message),
      label: Text("Message"),
      //backgroundColor: Colors.green,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () => print("Pressed"),
    );*/


/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String _title = 'AppBar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(title: "My First Flutter App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*Future<String> getData() async {
  await Future.delayed(const Duration(seconds: 2));
  //throw 'An Error Occured';
  return "It Works";
}*/

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int _count = 0;
  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        // leading: Icon(Icons.live_tv),
        // elevation: 30,
        // title: Text(
        //   widget.title,
        //   style: TextStyle(
        //     color: Colors.black87,
        //   ),
        // ),
        leading: IconButton(
          onPressed: () {
            print("Menu Button Preesed");
          },
          icon: Icon(Icons.menu),
        ),
        title: Text(
          MyApp._title,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              print('notification Button Preesed');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search Button Preesed');
            },
          ),
          IconButton(
            icon: Icon(Icons.navigation),
            onPressed: () {
              print('navigation Button Preesed');
            },
          ),
        ],
        /*flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),*/
      ),

      body:
          //Future Builder >>>>>>
          /*Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snapshot.data.toString()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("Refresh"))
                ],
              );
            }
          },
        ),
      ),*/
          Center(
        child: Text(
          //'Home',
          '$_count',
          style: TextStyle(fontSize: 60),
        ),

        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),*/
      ),
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        //selectedItemColor: Colors.white,
        //unselectedItemColor: Colors.white70,
        iconSize: 40,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Feed',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.purple),
        ],
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),*/

      //floatingActionButton: buildNavigateButton(),
      floatingActionButton: buildMessageButton(),
    );
  }

  Widget buildMessageButton() => FloatingActionButton.extended(
        icon: Icon(Icons.message),
        label: Text("Message"),
        onPressed: () {
          print("Message Button Pressed");
        },
      );

/*Widget buildNavigateButton() => FloatingActionButton(
      child: Icon(Icons.navigation),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        print("Pressed");
      },
    );*/
}*/


/*import 'package:flutter/material.dart';

void main() {
  runApp(new Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Stateless Widget",
      home: new Scaffold(
          body: new Container(
        color: Colors.pink,
        child: new Container(
          color: Colors.yellow,
          margin: const EdgeInsets.all(30.0),
        ),
      )),
    );
  }
}*/


/*import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(
            child: Text('Home Page'),
          ),
        ),
        body: new Container(
          color: Color.fromARGB(255, 30, 67, 233),
          /*child: new Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(60.00),
            
          ),*/
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyName('Home'),
                SizedBox(
                  height: 8.0,
                ),
                MyName('Service'),
                SizedBox(
                  height: 8.0,
                ),
                MyName('Contact'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyName extends StatelessWidget {
  final String name;
  const MyName(this.name);

  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color.fromARGB(255, 67, 204, 13)),
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Text(name),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';

void main() {
  runApp(new DogApp());
}

class DogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Lecture App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tuitor Lab'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DogName('Rockey'),
            SizedBox(height: 8.0),
            DogName('Lyla'),
            SizedBox(height: 8.0),
            DogName('Nico'),
            SizedBox(height: 8.0),
          ]),
        ),
      ),
    );
  }
}

class DogName extends StatelessWidget {
  final String name;
  const DogName(this.name);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name),
      ),
    );
  }
}*/



//My Personal App Code
/*import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Arafin Islam Shaikat",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      backgroundColor: Color.fromARGB(255, 5, 10, 4)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "United International University",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      backgroundColor: Colors.cyan),
                ),
              ),
              Text("100 feet,Notun Bazar,Dhaka",
                  style: TextStyle(color: Colors.black)),
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Personal App"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Image.asset(
              '53857791_117494099413073_2152730813840490496_o.jpg',
              width: 500,
              height: 500,
              alignment: Alignment.topLeft,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}*/


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 150,
        child: buildListView(),
      ),

      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(expandedHeight: 500),
          ),
          SliverFillRemaining(
            child: PageView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://picsum.photos/id/${index + 1}/200/300",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              title: Text('인기글'),
              onTap: () {},
            ),
          ),
          Container(
            height: 30,
            child: ListTile(
              title: Text('일상'),
              onTap: () {},
            ),
          ),
          Container(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text('일상 1'),
                onTap: () {},
              ),
            ),
          ),
          Container(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text('일상 2'),
                onTap: () {},
              ),
            ),
          ),
          Container(
            height: 30,
            child: ListTile(
              title: Text('여행'),
              onTap: () {},
            ),
          ),
          Container(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text('여행 1'),
                onTap: () {},
              ),
            ),
          ),
          Container(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text('여행 2'),
                onTap: () {},
              ),
            ),
          ),
        ],
      );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://picsum.photos/id/16/200/300',
            fit: BoxFit.cover,
          ),
          _SliverPersistentHeaderGradient(),
          _AppBar(context),
          _SliverPersistentHeaderStory(),
        ],
      ),
    );
  }

  Positioned _SliverPersistentHeaderStory() {
    return Positioned(
          // bottom: expandedHeight / 4.0,
          left: 0.0,
          right: 0.0,
          top: 120,
          child: const Text(
            '어라운드에는 사람들의 삶이 보이네요.\n진솔된 이야기가 공감되고\n서로 격려해주면서 위안이 돼요. \n 이렇게 편한공간이 또 있을까요?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        );
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Around',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        );
  }

  Container _SliverPersistentHeaderGradient() {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        );
  }

  // 상속하여 사용시 필수 (최소 크기 제어)
  @override
  double get maxExtent => expandedHeight;

  // (최대 크기 제어)
  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant MySliverAppBar oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
  }
}

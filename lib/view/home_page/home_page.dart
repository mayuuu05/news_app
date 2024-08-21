import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../modal/country_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
           leading: const Icon(Icons.menu_open, color: Colors.white70),
          scrolledUnderElevation: 0.1,
          centerTitle: true,
          title: const Text(
            'MODERN NEWS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 3,
              wordSpacing: 2,
            ),
          ),
          bottom: TabBar(
            dividerColor: Colors.grey[900],
            padding: EdgeInsets.all(10),
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                  width: 3,
                ),
              ),
            ),
            tabs: const [
              Tab(
                icon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('All'),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Car'),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Business'),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Tech'),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Market & Investments'),
                ),
              ),
            ],
          ),

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1,
                colors: [
                  Color(0xff32343b),
                  Color(0xff1c1e22),
                ],
              ),
            ),
          ),

        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: [
                Color(0xff32343b),
                Color(0xff1c1e22),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                FutureBuilder(
                  future: newsController.fetchCompanyApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return listViewMethod(
                        width: width,
                        modal: newsController.newsModal!,
                        fetchData: newsController.fetchCompanyApiData(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.fetchTeslaApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return listViewMethod(
                        width: width,
                        modal: newsController.teslaModal!,
                        fetchData: newsController.fetchTeslaApiData(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.fetchBusinessApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return listViewMethod(
                        width: width,
                        modal: newsController.businessModal!,
                        fetchData: newsController.fetchBusinessApiData(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.fetchTechApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return listViewMethod(
                        width: width,
                        modal: newsController.techModal!,
                        fetchData: newsController.fetchTechApiData(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.fetchStocksApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return listViewMethod(
                        width: width,
                        modal: newsController.stockModal!,
                        fetchData: newsController.fetchStocksApiData(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView listViewMethod({
    required double width,
    required NewsModal modal,
    required Future<NewsModal?> fetchData,
  }) {
    return ListView.builder(
      itemCount: modal.articles.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          detailHelper = fetchData;
          detailList = modal;
          selectedIndex = index;
          Get.toNamed('/detail');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: width,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xff32343b),
                Color(0xff1c1e22),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  modal.articles[index].urlToImage.isEmpty
                      ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                      : modal.articles[index].urlToImage,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    modal.articles[index].source.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    modal.articles[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final newsController = Get.put(NewsController());

var detailHelper;
NewsModal? detailList;
int selectedIndex = 0;
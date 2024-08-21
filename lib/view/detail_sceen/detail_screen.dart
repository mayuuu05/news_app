import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../home_page/home_page.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      
        body: FutureBuilder(
          future: detailHelper,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
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
                    padding: const EdgeInsets.all(.80),
                    child: Column(
                      children: [
                        Image.network(
                          (detailList!.articles[selectedIndex].urlToImage == '')
                              ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                              : detailList!.articles[selectedIndex].urlToImage,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                detailList!.articles[selectedIndex].source.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                detailList!.articles[selectedIndex].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                detailList!.articles[selectedIndex].description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                detailList!.articles[selectedIndex].content,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      urlController.urlLaunch(
                                          detailList!.articles[selectedIndex].url);
                                    },
                                    child: const Text(
                                      'see more',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
      
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(detailList!.articles[selectedIndex].publishedAt, style: const TextStyle(color: Colors.white54)),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(detailList!.articles[selectedIndex].author, style: const TextStyle(color: Colors.white54)),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: height * 0.06,
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                
                                child: const Text(
                                  'Start Commenting',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                height: height * 0.06,
                                width: width,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    
                                  ),borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Repost',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.sync, color: Colors.white),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Container hashtagContainer(double height, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: height * 0.045,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

var urlController = Get.put(UrlLauncherController());

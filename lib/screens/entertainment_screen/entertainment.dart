import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/NewsModel.dart';
import 'package:api_session/screens/news_screen/controller/Controller.dart';

//post : rayeh a3ml action 3al data el fl api

//future builder
class Entertainment extends StatelessWidget {
  Entertainment({Key? key}) : super(key: key);

  Controller newsController = Get.put(Controller());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: newsController.getData('entertainment'),
              //return data(response):reformating to my model
              builder: (context, AsyncSnapshot snapshot) {
                //snapshot : simplify accessing and converting properties in json
                if (snapshot.hasData) {
                  NewsModel data = snapshot.data;
                  return ListView.builder(
                      itemCount: data.articles!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.articles![index].urlToImage != null
                                  ? Image.network(
                                '${data.articles![index].urlToImage}',
                                // 'https://thumbs.dreamstime.com/b/avengers-assemble-avenger-fight-action-figure-toys-photography-marvel-comic-captain-america-black-widow-hawkeye-ironman-thor-hulk-207802862.jpg',
                              )
                                  : Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png'
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.articles![index].title}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    SizedBox(
                                        width: 350,
                                        height: 70,
                                        child: Text(
                                          '${data.articles![index].description}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Container(child: CircularProgressIndicator()),
                  );
                }
              }),
        ),
      ),
    );
  }
}

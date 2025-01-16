import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:doctorq/extensions.dart';
import 'package:doctorq/screens/home/favorite_doctor_screen/favorite_doctor_screen.dart';
import 'package:doctorq/screens/home/notification_screen/notification_screen.dart';
import 'package:doctorq/screens/home/search_doctor_screen/search_doctor_screen.dart';
import 'package:doctorq/screens/home/specialist_doctor_screen/specialist_doctor_screen.dart';
import 'package:doctorq/screens/home/top_doctor_screen/top_doctor_screen.dart';
import 'package:doctorq/services/api_service.dart';
import 'package:doctorq/utils/utility.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'widgets/autolayouthor1_item_widget.dart';
import 'widgets/autolayouthor_item_widget.dart';
import 'package:doctorq/app_export.dart';
import 'package:doctorq/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:doctorq/data_files/specialist_list.dart';
import 'package:story_view/story_view.dart';

class ItemController extends GetxController {
  var cats = [].obs; // Reactive list to store fetched items
  var users = [].obs; // Reactive list to store fetched items
  final storyItems = <StoryItem>[].obs;
  @override
  void onInit() {
    super.onInit();
    refreshData();
    fetchStories();
  }

  Future<void> fetchStories() async {
    final response =
        await http.get(Uri.parse('https://onlinedoctor.su/api/faqs'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // Extract data from JSON
      final data = (jsonData['data'] as List<dynamic>)
          .map((e) => StoryItem.pageImage(
                url: 'https://admin.onlinedoctor.su/storage/' +
                    e['data'][0]['image'],
                controller: StoryController(),
                caption: Text(
                  e['data'][0]['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                    fontSize: 17,
                  ),
                ),
              ))
          .toList();
      //print(data);
      //storyItems.value = data;
      storyItems.value = data;
    } else {
      // Handle error
      print('Failed to load stories');
    }
  }

  Future<void> refreshData() async {
    // fetchDoctors();
    getDoctors();
    // Simulating fetching data from an API
    var response = await http.get(Uri.parse(
      'https://onlinedoctor.su/api/specializations',
    ));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // items = jsonResponse;
      cats.value = jsonResponse;
//      jsonResponse.map((item) => SpecialistModel.fromJson(item)).toList();
    }
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  TextEditingController autoLayoutVerController = TextEditingController();
  final ItemController itemController = Get.put(ItemController());

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // floatingActionButton: const FloatingActionButton( heroTag: "b", onPressed: null, child: Text("uId")),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width,
              margin: getMargin(
                top: 20,
              ),
              child: Padding(
                padding: getPadding(
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImageView(
                            imagePath: ImageConstant.appLogo,
                            height: getVerticalSize(36),
                            width: getHorizontalSize(36),
                          ),
                          HorizontalSpace(width: 20),
                          Padding(
                            padding: getPadding(
                              left: 0,
                              top: 8,
                              bottom: 1,
                            ),
                            child: Text(
                              "Телемедицина",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  26,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeNotificationScreen()),
                            );
                          },
                          child: Container(
                            padding: getPadding(all: 10),
                            height: getVerticalSize(44),
                            width: getHorizontalSize(44),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstant.blueA400.withOpacity(0.1),
                            ),
                            child: CommonImageView(
                              imagePath: ImageConstant.notifications,
                            ),
                          ),
                        ),
                        HorizontalSpace(width: 16),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeFavoriteDoctorScreen()),
                            );
                          },
                          child: Container(
                            padding: getPadding(all: 10),
                            height: getVerticalSize(44),
                            width: getHorizontalSize(44),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorConstant.blueA400.withOpacity(0.1),
                            ),
                            child: CommonImageView(
                              imagePath: ImageConstant.favorite,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: RefreshIndicator(
              displacement: 1.0,
              onRefresh: () async {
                await itemController.refreshData();
                await itemController.fetchStories();
                await Future.delayed(
                    const Duration(seconds: 2)); // Simulate network request
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: getPadding(
                    top: 26,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*
                      CustomSearchView(
                        isDark: isDark,
                        width: size.width,
                        focusNode: FocusNode(),
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeSearchDoctorScreen()));
                        },
                        controller: autoLayoutVerController,
                        hintText: "Поиск",
                        margin: getMargin(
                          left: 24,
                          right: 24,
                        ),
                        alignment: Alignment.center,
                        suffix: Padding(
                            padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  15.00,
                                ),
                                left: getHorizontalSize(15)),
                            child: Text("a")), //CommonImageView(
                        //imagePath: ImageConstant.search,
                        //)
                        //),
                        suffixConstraints: BoxConstraints(
                          maxWidth: getHorizontalSize(
                            50.00,
                          ),
                          maxHeight: getVerticalSize(
                            50.00,
                          ),
                        ),
                      ),*/
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 20,
                            top: 30,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Специализации",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: isDark
                                      ? ColorConstant.whiteA700
                                      : ColorConstant.bluegray800,
                                  fontSize: getFontSize(
                                    20,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 3,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeSpecialistDoctorScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Все",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.blueA400,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        //print(itemController.storyItems.length);
                        return FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          onFinish: (direction) =>
                              printLog('Direction $direction'),
                          child: SizedBox(
                            height: getVerticalSize(
                              220.00,
                            ),
                            width: getHorizontalSize(
                              528.00,
                            ),
                            //  child: NotificationListener<ScrollNotification>(

                            child: ListView.separated(
                              padding: getPadding(
                                left: 20,
                                right: 20,
                                top: 27,
                              ),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: itemController.cats.length,
                              separatorBuilder: (context, index) {
                                return HorizontalSpace(width: 16);
                              },
                              itemBuilder: (context, index) {
                                var cats = itemController.cats;
                                return AutolayouthorItemWidget(
                                  item: cats[index],
                                  index: index,
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      DoctorsSliderHeader(isDark: isDark),
                      SingleChildScrollView(child: DoctorsSilder()),
                      //  NewsHeader(isDark: isDark),
                      Obx(() {
                        print(itemController.storyItems.length);
                        return itemController.storyItems.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : SingleChildScrollView(child: NewsSlider());
                      })
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class NewsHeader extends StatelessWidget {
  NewsHeader({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          left: 20,
          top: 31,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Новости",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: isDark
                    ? ColorConstant.whiteA700
                    : ColorConstant.bluegray800,
                fontSize: getFontSize(
                  20,
                ),
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 1,
                bottom: 3,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopDoctorScreen()),
                  );
                },
                child: Text(
                  "Все",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorConstant.blueA400,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsSliderHeader extends StatelessWidget {
  const DoctorsSliderHeader({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          left: 20,
          top: 31,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Врачи",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: isDark
                    ? ColorConstant.whiteA700
                    : ColorConstant.bluegray800,
                fontSize: getFontSize(
                  20,
                ),
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 1,
                bottom: 3,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopDoctorScreen()),
                  );
                },
                child: Text(
                  "Все",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorConstant.blueA400,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsSilder extends StatelessWidget {
  const DoctorsSilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("doctors");
    print(context.doctorsData);
    return FadeInUp(
      child: SizedBox(
        height: getVerticalSize(
          266.00,
        ),
        width: getHorizontalSize(
          512.00,
        ),
        child: ListView.separated(
          padding: getPadding(
            left: 20,
            right: 20,
            top: 26,
          ),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: context.doctorsData.length,
          separatorBuilder: (context, index) {
            return HorizontalSpace(width: 16);
          },
          itemBuilder: (context, index) {
            return DoctorsSliderItem(
              item: context.doctorsData[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class NewsSlider extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  NewsSlider({
    Key? key,
  }) : super(key: key);
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: SizedBox(
          height: getVerticalSize(
            266.00,
          ),
          width: getHorizontalSize(
            512.00,
          ),
          child: ListView(children: <Widget>[
            Container(
                height: 300,
                child: StoryView(
                  controller: controller,
                  storyItems: itemController.storyItems,
                  /*[
                     StoryItem.text(
                    title:
                        "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                    backgroundColor: Colors.orange,
                    roundedTop: true,
                  ),*/

                  // StoryItem.inlineImage(
                  //   NetworkImage(
                  //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
                  //   caption: Text(
                  //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       backgroundColor: Colors.black54,
                  //       fontSize: 17,
                  //     ),
                  //   ),
                  // ),
                  /*StoryItem.inlineImage(
                  url:
                      "https://www.diagnosio.com/wp-content/uploads/2021/02/online-doctor-consultation.jpg",
                  controller: controller,
                  caption: Text(
                    "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                      fontSize: 17,
                    ),
                  ),
                ),*/
                  /*     StoryItem.inlineImage(
                  url:
                      "https://media1.tenor.com/m/GBBVrq9U3uUAAAAC/bh187-mr-bean.gif",
                  controller: controller,
                  caption: Text(
                    "Hektas, sektas and skatad",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                      fontSize: 17,
                    ),
                  ),
                )
            
                ],*/
                  onStoryShow: (storyItem, index) {
                    print("Showing a story");
                  },
                  onComplete: () {
                    print("Completed a cycle");
                  },
                  progressPosition: ProgressPosition.bottom,
                  repeat: true,
                  inline: true,
                  onVerticalSwipeComplete: (p0) {
                    print("swipe?");
                    //controller.play();
                    controller.next();
                  },
                ))
          ])),
    );
  }
}

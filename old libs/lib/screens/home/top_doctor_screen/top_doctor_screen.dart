import 'package:doctorq/data_files/doctors_list.dart';
import 'package:doctorq/widgets/bkBtn.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'widgets/listfullname3_item_widget.dart';
import 'package:doctorq/app_export.dart';
import 'package:flutter/material.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  State<TopDoctorScreen> createState() =>
      _TopDoctorScreenState();
}

class _TopDoctorScreenState extends State<TopDoctorScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BkBtn(),
                        HorizontalSpace(width: 20),
                        Text(
                          "Top Doctor",
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
                      ],
                    ),
                    Container(
                      padding: getPadding(all: 10),
                      height: getVerticalSize(44),
                      width: getHorizontalSize(44),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorConstant.blueA400.withOpacity(0.1),
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.filter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 24),
            SizedBox(
              height: getVerticalSize(36),
              child: TabBar(
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Все',
                  ),
                  Tab(
                    text: 'Brain',
                  ),
                  Tab(
                    text: 'Cardio',
                  ),
                  Tab(
                    text: 'Eye',
                  ),
                  Tab(
                    text: 'Dentist',
                  ),
                  Tab(
                    text: 'Nerve',
                  ),
                ],
                isScrollable: true,
                padding: getPadding(left: 20, right: 20),
                indicator: BoxDecoration(
                    //borderRadius: BorderRadius.circular(50),
                    color: ColorConstant.blueA400),
                unselectedLabelColor: ColorConstant.blueA400,
                unselectedLabelStyle: TextStyle(
                    fontSize: getFontSize(16),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Source Sans Pro'),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: getFontSize(16),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Source Sans Pro'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context)
                  .size
                  .height, ////Media(), //size.height - getVerticalSize(192),
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                  ListView.builder(
                    padding: getPadding(
                      left: 20,
                      right: 20,
                      top: 24,
                      bottom: 34,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Listfullname3ItemWidget(index: index);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

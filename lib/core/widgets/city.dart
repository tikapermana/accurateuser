import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/models/m_city.dart';
import 'package:accurate/core/constants/themes.dart';

class ListCity extends StatelessWidget {
  final String title;
  final List<ModelCity> lsCity;
  final TextEditingController txtController;

  const ListCity({
    Key? key,
    required this.title,
    required this.lsCity,
    required this.txtController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(AppSizing().defaultSpacing),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizing().extraSpacing,
                      horizontal: AppSizing().biggerSpacing
                    ),
                    child: Text(title,
                      style: AppText().textHeader1Bold(
                          color: Colors.grey.shade900
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: lsCity.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizing().defaultSpacing
                        ),
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                              thickness: 1.0,
                              color: Colors.grey.shade200,
                              indent: AppSizing().minSpacing,
                              endIndent: AppSizing().minSpacing,
                              height: AppSizing().biggerSpacing,
                            ),
                        itemBuilder: (context, index){
                          var name = lsCity[index].name ?? "-";
                          return GestureDetector(
                            onTap: (){
                              txtController.text = name;
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppSizing().biggerSpacing,
                                horizontal: AppSizing().defaultSpacing,
                              ),
                              child: Text(name,
                                style: AppText().textHeader4Bold(
                                    color: Colors.grey.shade800
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ]
            ),
          )
      ),
    );
  }
}

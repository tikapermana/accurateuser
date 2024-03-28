import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/pages/about/controllers/c_about.dart';

class About extends GetView<AboutController> {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.clear,
            color: Colors.black,
            size: 22,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizing().defaultSpacing,
            horizontal: AppSizing().veryExtraSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: AppSizing().veryExtraSpacing
                ),
                child: Text('I Gede Tika Permana',
                  style: AppText().textHeader2Bold(color: Colors.black),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: controller.lsEducation.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                  var edu = controller.lsEducation[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(var info in edu.entries)
                          if(info.key != 'icon')
                        ColumnContainer(
                            title:  info.key,
                            content: info.value.toString()
                        ),
                      ],
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

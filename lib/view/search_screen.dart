import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zrt_interview/components/custom_textfield/customField.dart';
import 'package:zrt_interview/utils/size-config/size_config.dart';
import 'package:zrt_interview/utils/ui_sizedbox/sizedbox_extension.dart';

import '../controller/search_controller.dart';
import 'detail_screen.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
       title: const Text('Country'),
      ),
      body: GetBuilder<SearchingController>(
        builder: (searchController) {
          return     Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
          child:  Column(
            children: 
            [
              20.sh,
              CustomTextField(
               controller: searchController.countryController,
               hintText: 'Enter Country',
               onChanged: (v){
                if(searchController.countryController.text.isEmpty)
                {
                  searchController.searchList =[];
                }
                searchController.getSearch(v);
               },
               ),
               20.sh, 
               searchController.searchList.isNotEmpty && searchController.countryController.text.isNotEmpty
               ?
                Expanded(
                child: 
                ListView.separated(
                  separatorBuilder: (context,index){return 10.sh;},
                  itemCount:searchController.searchList.length ,
                  itemBuilder: (context,index){
                   
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=>DetailScreen(
                          countryName: searchController.searchList[index].countryName,
                          flag: searchController.searchList[index].flag,
                          region: searchController.searchList[index].region,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          border: Border.all(color: Colors.black)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: getWidth(10),vertical: getHeight(10)),
                        height: getHeight(120),
                        width: getWidth(250),
                        child: Row(
                          children: [
                            
                                SizedBox(
                                  height: getHeight(60), 
                                  width: getWidth(60),
                                  child: Image.network(
                                    searchController.searchList[index].flag.toString(),
                                   // fit: BoxFit.fitHeight,
                                  ),
                               
                                ),
                             
                            30.sw,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 
                              [
                                      Text(searchController.searchList[index].countryName,style:const TextStyle(color: Colors.black)),
                                      Text(searchController.searchList[index].region,style:const TextStyle(color: Colors.black)),
                             ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
                  : 
                  Obx(() {
  return searchController.noCountry.value
      ? const Center(
          child: Text('No Country match'),
        )
      : const SizedBox(); // Empty space when no match is found
}),
                  50.sh,
            ],
          ),
        );
    
        },
      ),
    );
    
  }
}
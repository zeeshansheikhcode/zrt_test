import 'package:flutter/material.dart';
import 'package:zrt_interview/utils/size-config/size_config.dart';
import 'package:zrt_interview/utils/ui_sizedbox/sizedbox_extension.dart';
class DetailScreen extends StatelessWidget {
   final String countryName;
  final String region;
  final String flag;
  const DetailScreen({super.key, 
    required this.countryName, 
    required this.region,
    required this.flag
   });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        automaticallyImplyLeading: false,
       title: const Text('Country'),
      ),
      body: 
          Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
          child:  Column(
            children: 
            [
              20.sh,
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                height: getHeight(250), 
                width: getWidth(200),
                child: Center(
                child: Image.network(
                                  flag,
                                 // fit: BoxFit.fitHeight,
                                ),
                ),
              ),
              20.sh, 
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Name '),
                    Text(countryName)
                  ],
                ),
              ),
                 20.sh, 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Region '),
                    Text(region)
                  ],
                ),
              )
          
            ],
          ),
        )
    
      
      
    );
    
  }
}
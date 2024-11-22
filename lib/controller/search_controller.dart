
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zrt_interview/data/constants.dart';
import 'package:zrt_interview/model/country_model.dart';

import '../data/api.dart';
import '../data/service/CheckConnectionService.dart';
import '../utils/toasts.dart';

class SearchingController extends GetxController 
{
  final TextEditingController countryController = TextEditingController();
  final apiProvider = ApiProvider();
 RxBool noCountry = false.obs;
   List<CountryModel> searchList =[]; 
    Timer? _debounce;
  CheckConnectionService connectionService = CheckConnectionService();
 getSearch(String query) {
    // Cancel the previous timer if still running
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Set up a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      // Perform the search logic here
      await connectionService.checkConnection().then((value) async {
        if (!value) {
          CustomToast.failToast(msg: "No Internet");
        } else {
          await apiProvider.getData(
            Constants.baseUrl,
            query: query,
          ).then((response) {
            if(response.statusCode!=404)
            {
              final List<CountryModel> responseList = response.body.map<CountryModel>((item) {
              return CountryModel(
                countryName: item['name']['common'] ?? "Unknown",
                region: item['region'] ?? "Unknown",
                flag: item['flags']['png'] ?? "No Flag Available",
              );
            }).toList();
            searchList = responseList; // Update the search list
        
            }
            else 
            {
              searchList=[];
                noCountry.value=true;
                
            }
            update();
          }, onError: (error) {
            print('Error in API call: $error');
            if (error.toString().contains("SocketException")) {
              CustomToast.failToast(msg: "Please check your internet!");
            } else if (error.toString().contains("Service Unavailable")) {
              CustomToast.failToast(msg: "Server Unavailable");
            } else {
              CustomToast.failToast(msg: "Something went wrong, Please try Again");
            }
          });
        }
      });
    });
  }

  @override
  void onClose() {
    // Dispose of the debounce timer
    _debounce?.cancel();
    super.onClose();
  }
}
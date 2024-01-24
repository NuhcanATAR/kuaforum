import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/nofications_view/nofication_view.dart';
import 'package:kuaforum/feature/main_view/home/view/post_detail_view/post_detail_view.dart';
import 'package:kuaforum/feature/main_view/home/view/search_view/search_view.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/servicedetail_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/servicecategorys_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicelist/servicelist_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeRouterService {
  // nofication view router
  void noficationViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NoficationView(),
      ),
    );
  }

  // search view router
  void searchViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchView(),
      ),
    );
  }

  // slider card router control
  void sliderControlRouter(
      BuildContext context, Map<String, dynamic> data) async {
    if (data['URLACTIVE'] == true) {
      if (!await launchUrl(Uri.parse(data['URL'].toString()))) {
        throw Exception("Url Bulunamadı!");
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailView(
            data: data,
          ),
        ),
      );
    }
  }

  // service category list view router
  void serviceCategoryListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ServiceCategorysView(),
      ),
    );
  }

  // service list view router
  void serviceListViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceListView(
          data: data,
        ),
      ),
    );
  }

  // service detail view router
  void serviceDetailViewNavigator(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailView(
          data: data,
        ),
      ),
    );
  }

  // post detail view router
  void postDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailView(
          data: data,
        ),
      ),
    );
  }
}

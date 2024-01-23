import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {required this.routerService, required this.dynamicHeight, super.key});

  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.searchViewNavigatorRouter(context);
      },
      child: SizedBox(
        height: dynamicHeight(0.08),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.search_outlined,
                color: Colors.black54,
                size: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: LabelMediumBlackText(
                    text: HomeStrings.searchInputText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

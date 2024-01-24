import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/home/view/search_view/widget/servicecard_widget.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/base/main_view_base/search_base/search_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/search_db/search_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends SearchMainBase<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Arama",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: Column(
          children: <Widget>[
            // search
            buildSearchWidget,
            // list
            buildListWidget,
          ],
        ),
      ),
    );
  }

  // search widget
  Widget get buildSearchWidget => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: TextField(
          textAlign: TextAlign.left,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 18,
            ),
            hintText: 'Arama yapınız',
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: (val) {
            setState(() {
              modelService.input = val;
            });
          },
        ),
      );

  // list widget
  Widget get buildListWidget => Expanded(
        flex: 3,
        child: StreamBuilder<QuerySnapshot>(
          stream: SearchDB.BASICSERVICES.serviceList,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  if (data['ACTIVE'] == true &&
                      data['SERVICETITLE'] != null &&
                      data['SERVICETITLE']
                          .toString()
                          .toLowerCase()
                          .startsWith(modelService.input.toLowerCase())) {
                    return ServiceCardWidget(
                      data: data,
                      routerService: routerService,
                      maxWidth: maxWidth,
                      dynamicHeight: dynamicHeight,
                    );
                  }

                  return const Center();
                },
              ),
            );
          },
        ),
      );
}

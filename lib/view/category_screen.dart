import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_category_models.dart';
import 'package:news_app/view_models/news_view_models.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  NewViewModel newViewModel = NewViewModel();
  final fomart = DateFormat('MMMM dd, yyyy');
  String categoryName = "top";

  List<String> btnCategories = [
    'Top',
    'Business',
    'Crime',
    'Domestic',
    'education',
    'entertainment',
    'environment',
    'food',
    'health',
    'lifestyle',
    'other',
    'politics',
    'science',
    'sports',
    'technology',
    'top',
    'tourism',
    'world'
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: btnCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            categoryName = btnCategories[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: categoryName == btnCategories[index]
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Center(
                                  child: Text(
                                btnCategories[index].toString(),
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<NewsCategory>(
                  future: newViewModel.fetchNewsCategoryApi(categoryName),
                  builder: (context, AsyncSnapshot<NewsCategory> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child:
                            CircularProgressIndicator(), // Sử dụng CircularProgressIndicator thay vì SpinKitCircle
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.data == null ||
                        snapshot.data!.results == null ||
                        snapshot.data!.results!.isEmpty) {
                      return Center(
                        child: Text('No data available'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index) {
                          final result = snapshot.data!.results![index];
                          if (result == null) {
                            return Container();
                          }
                          DateTime? dateTime =
                              DateTime.tryParse(result.pubDate ?? '');

                          if (dateTime == null) {
                            // Xử lý ngày tháng không hợp lệ
                            return Container(); // hoặc một Widget thích hợp khác
                          }

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/IMG_Academy_Logo.svg/1200px-IMG_Academy_Logo.svg.png',
                                    fit: BoxFit.cover,
                                    height: height * .18,
                                    width: width * .3,
                                    filterQuality: FilterQuality.high,
                                    placeholder: (context, url) => Center(
                                      child:
                                          CircularProgressIndicator(), // Sử dụng CircularProgressIndicator thay vì SpinKitCircle
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: height * .18,
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          result.title ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              result.country?.join(', ') ??
                                                  '', // Sử dụng join để hiển thị danh sách quốc gia
                                              maxLines: 2,

                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              fomart.format(dateTime),
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.blue,
  size: 50,
);

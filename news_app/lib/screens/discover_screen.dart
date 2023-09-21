import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/image_container.dart';

import '../widgets/bottom_nav_bar.dart';
import 'article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Science'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: const MyBottomNavBar(index: 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const _DiscoverNews(),
                _CategoryNews(tabs: tabs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  final List<String> tabs;

  const _CategoryNews({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map((tab) => Tab(
                    icon: Text(
                      tab,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
        ),
        //bao listview trong 1 container chiem 47% man hinh
        Container(
          height: MediaQuery.of(context).size.height *
              0.475, // Adjust height as needed
          child: Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: tabs
                  .map(
                    (tab) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ArticleScreen.routeName,
                                arguments: articles[index]);
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                margin: const EdgeInsets.all(10.0),
                                width: 80,
                                height: 80,
                                imageUrl: articles[index].imageUrl,
                                borderRadius: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.schedule,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Icon(
                                          Icons.visibility,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${articles[index].views} views',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.tune,
                      color: Colors.grey,
                    ))),
          )
        ],
      ),
    );
  }
}

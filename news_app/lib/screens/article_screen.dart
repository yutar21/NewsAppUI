import 'package:flutter/material.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';
import 'package:news_app/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
      borderRadius: 0.0,
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadline(
              article: article,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTag(
                        backgroundColor: Colors.black,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                NetworkImage(article.authorImageUrl),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            article.author,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                        backgroundColor: Colors.grey.shade200,
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${DateTime.now().difference(article.createdAt).inHours}h',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                        backgroundColor: Colors.grey.shade200,
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${article.views}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${article.title}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${article.body}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.25),
                    itemBuilder: (context, index) {
                      return ImageContainer(margin: EdgeInsets.all(5),width: MediaQuery.of(context).size.width * 0.42, imageUrl: article.imageUrl);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  final Article article;

  const _NewsHeadline({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          CustomTag(backgroundColor: Colors.white.withAlpha(100), children: [
            Text(
              article.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

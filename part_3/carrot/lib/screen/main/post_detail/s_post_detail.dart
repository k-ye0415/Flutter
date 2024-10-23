import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_vertical_line.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/screen/main/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/main/post_detail/w_post_content.dart';
import 'package:fast_app_base/screen/main/post_detail/w_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostDetailScreen extends ConsumerWidget {
  final SimpleProductPost? simpleProductPost;
  final int id;

  const PostDetailScreen(this.id, {super.key, this.simpleProductPost});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));
    return productPost.when(
        data: (data) => _PostDetail(
              simpleProductPost ?? data.simpleProductPost,
              productPost: data,
            ),
        error: (error, trace) => "에러발생".text.make(),
        loading: () => simpleProductPost != null
            ? _PostDetail(simpleProductPost!)
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class _PostDetail extends HookWidget {
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  static const bottomMenuHeight = 100.0;

  const _PostDetail(this.simpleProductPost, {this.productPost, super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImagePager(context, pageController),
                UserProfileWidget(
                  simpleProductPost.product.user,
                  address: simpleProductPost.address,
                ),
                PostContentWidget(
                  simpleProductPost: simpleProductPost,
                  productPost: productPost,
                ),
              ],
            ),
          ),
          const _AppBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PostBottomMenu(simpleProductPost.product),
          )
        ],
      ),
    );
  }

  SizedBox _ImagePager(BuildContext context, PageController pageController) {
    return SizedBox(
      height: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: simpleProductPost.product.images
                .map((url) => CachedNetworkImage(imageUrl: url, fit: BoxFit.fill))
                .toList(),
          ),
          if (simpleProductPost.product.images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: simpleProductPost.product.images.length,
                  effect: ExpandingDotsEffect(
                    // verticalOffset: 3,
                    dotColor: Colors.white54,
                    activeDotColor: Colors.black45,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            )
        ],
      ),
    );
  }
}

class PostBottomMenu extends StatelessWidget {
  final Product product;

  const PostBottomMenu(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _PostDetail.bottomMenuHeight,
      color: context.backgroundColor,
      child: Column(
        children: [
          Line(),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 25,
                  ),
                ),
                width10,
                VerticalLine().pSymmetric(v: 15),
                width30,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          product.price.toWon().text.bold.make(),
                        ],
                      ),
                      "가격 제안하기".text.underline.make()
                    ],
                  ),
                ),
                RoundButton(
                  text: "채팅하기",
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                ),
                width10,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.statusBarHeight + 60,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Nav.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

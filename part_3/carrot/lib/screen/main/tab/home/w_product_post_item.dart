import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductPostItem extends StatelessWidget {
  final SimpleProductPost post;

  const ProductPostItem({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: post.product.images[0],
                width: 150,
              ),
            ),
            Width(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  post.title.text.make(),
                  Row(
                    children: [
                      post.address.simpleAddress.text
                          .color(context.appColors.lessImportantColor)
                          .make(),
                      "•".text.color(context.appColors.lessImportantColor).make(),
                      timeago
                          .format(post.createdTime, locale: context.locale.languageCode)
                          .text
                          .color(context.appColors.lessImportantColor)
                          .make()
                    ],
                  ),
                  post.product.price.toWon().text.bold.make(),
                ],
              ),
            ),
          ],
        ).p(15),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.message_outlined),
                post.chatCount.text.make(),
                Icon(Icons.favorite),
                post.likeCount.text.make(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

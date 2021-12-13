import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/modules/notification/presentation/views/notification_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  screenHeightPercentage(context, percentage: 0.07)),
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: kcWhite,
                centerTitle: true,
                title: AutoSizeText(
                  "Notifications",
                  style: ktsMediumBodyText.copyWith(color: Colors.black),
                ),
              ),
            ),
            body: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    : const _IsCompleted());
      },
      viewModelBuilder: () => NotificationViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<NotificationViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, NotificationViewModel model) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(error),
              ],
            ),
          );
        });
  }
}

class _IsLoading extends ViewModelWidget<NotificationViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, NotificationViewModel model) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 4,
        itemBuilder: (BuildContext ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade100,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.grey.shade200,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade100),
                ),
              ),
            ),
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              width: screenWidthPercentage(context, percentage: 0.6),
              height: 20,
              color: Colors.grey.shade200,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                ),
              ),
            ),
            subtitle: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              height: 20,
              color: Colors.grey.shade200,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  width: screenWidthPercentage(context, percentage: 0.3),
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                ),
              ),
            ),
          );
        });
  }
}

class _IsCompleted extends ViewModelWidget<NotificationViewModel> {
  const _IsCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, NotificationViewModel model) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        physics: const BouncingScrollPhysics(),
        itemCount: model.notify!.data.length,
        itemBuilder: (BuildContext ctx, index) {
          NotificationDataEntity notification = model.notify!.data[index];
          return ListTile(
            tileColor: kcWhite,
              leading: AvatarWidget(
                imageUrl: notification.user.avatar,
                radius: 35,
              ),
              trailing: notification.image != null ? Container(
                width: 60,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(notification.image!.image)
                  )
                ),
              ): null,
              title: AutoSizeText(
                "@" + notification.user.username,
                style: ktsSmallBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle:  AutoSizeText.rich(
                TextSpan(text: "${notification.description} " ,children: [
                TextSpan(text: timeago.format(DateTime.parse(notification.createdAt),
                     locale: 'en_short') , style: ktsSmallBodyText.copyWith(color: kcIcon))
                ]),
                
                style: ktsSmallBodyText,
                minFontSize: 5,
              ));
          // AutoSizeText(
          //     "${notification.description} " +
          //         timeago.format(DateTime.parse(notification.createdAt),
          //             locale: 'en_short'),
          //     style: ktsSmallBodyText));
        });
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.imageUrl,
    this.radius,
  }) : super(key: key);
  final String imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade300,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, url) => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: BoxFit.cover, image: url))),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey.shade200,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100, shape: BoxShape.circle),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.broken_image,
          color: kcPrimary,
        ),
      ),
    );
  }
}
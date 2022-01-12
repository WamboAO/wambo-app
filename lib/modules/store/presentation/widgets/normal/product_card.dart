import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    double? discount =
        product.discount != null ? product.discount! * 100 : null;
    double? discountPrice = product.discount != null
        ? product.price - (product.discount! * product.price)
        : null;
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: ProductImage(product: product, discount: discount),
        ),
        Flexible(
            child: ProductDetails(
                product: product,
                discount: discount,
                discountPrice: discountPrice))
      ],
    );
  }
}

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key, required this.product}) : super(key: key);
  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    double? discount =
        product.discount != null ? product.discount! * 100 : null;
    double? discountPrice = product.discount != null
        ? product.price - (product.discount! * product.price)
        : null;
    return Container(
      margin: const EdgeInsets.all(3),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 7 / 6,
            child: ProductImage(product: product, discount: discount),
          ),
          ProductDetails(
              product: product,
              discount: discount,
              discountPrice: discountPrice)
        ],
      ),
    );
  }
}

class ProductsCardLoading extends StatelessWidget {
  const ProductsCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 7 / 6,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade200,
              child: Container(
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade100,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
    required this.discount,
    required this.discountPrice,
  }) : super(key: key);

  final ProductDataEntity product;
  final double? discount;
  final double? discountPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: product.price >= 1000000
          ? AutoSizeText(
              toCurrencyString(
                      discount != null ? '$discountPrice' : '${product.price}',
                      shorteningPolicy: ShorteningPolicy.Automatic,
                      thousandSeparator: ThousandSeparator.Period) +
                  ' ${product.currency}',
              style: ktsSmallBodyText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: product.inStock == false ? kcIcon : kcIconDark),
            )
          : product.price >= 100000
              ? AutoSizeText(
                  toCurrencyString(
                          discountPrice != null
                              ? '$discountPrice'
                              : '${product.price}',
                          shorteningPolicy: ShorteningPolicy.Automatic,
                          thousandSeparator: ThousandSeparator.Period) +
                      ' ${product.currency}',
                  style: ktsSmallBodyText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: product.inStock == false ? kcIcon : kcIconDark),
                )
              : AutoSizeText(
                  toCurrencyString(
                          discountPrice != null
                              ? '$discountPrice'
                              : '${product.price}',
                          shorteningPolicy: ShorteningPolicy.NoShortening,
                          thousandSeparator: ThousandSeparator.Period) +
                      ' ${product.currency}',
                  style: ktsSmallBodyText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: product.inStock == false ? kcIcon : kcIconDark),
                ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
    required this.discount,
  }) : super(key: key);

  final ProductDataEntity product;
  final double? discount;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.thumbnail,
      imageBuilder: (context, url) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(fit: BoxFit.cover, image: url),
            ),
          ),
          if (product.inStock == true) ...[
            if (discount != null) ...[
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  color: kcSecondary,
                ),
                padding: const EdgeInsets.all(2),
                child: AutoSizeText(
                  "-$discount%",
                  style: ktsSmallBodyText.copyWith(
                      color: kcWhite, fontWeight: FontWeight.w600),
                ),
              ),
            ]
          ],
          if (product.inStock == false) ...[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: double.infinity,
                  color: Colors.black,
                  child: AutoSizeText(
                    "ESGOTADO",
                    textAlign: TextAlign.center,
                    style: ktsSmallBodyText.copyWith(
                        color: kcWhite, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ]
        ],
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        child: const Center(
          child: Icon(
            Icons.broken_image,
            color: kcPrimary,
          ),
        ),
      ),
    );
  }
}

class ProductCardAlternative extends StatelessWidget {
  const ProductCardAlternative({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    double? discount =
        product.discount != null ? product.discount! * 100 : null;
    double? discountPrice = product.discount != null
        ? product.price - (product.discount! * product.price)
        : null;
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: CachedNetworkImage(
            imageUrl: product.thumbnail,
            imageBuilder: (context, url) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(fit: BoxFit.cover, image: url),
                  ),
                ),
                if (product.inStock == false) ...[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        width: double.infinity,
                        color: Colors.black,
                        child: AutoSizeText(
                          "ESGOTADO",
                          textAlign: TextAlign.center,
                          style: ktsSmallBodyText.copyWith(
                              color: kcWhite, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
                if (product.inStock == true) ...[
                  if (discount != null)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4)),
                          color: kcSecondary,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: AutoSizeText(
                          "-$discount%",
                          style: ktsSmallBodyText.copyWith(
                              color: kcWhite, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: IconButton(
                          onPressed: () => print(""),
                          icon: Icon(
                            Icons.bookmark_rounded,
                            size: 35,
                            color: kcIcon.withOpacity(0.8),
                          )),
                    ),
                  )
                ],
              ],
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade200,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  color: kcPrimary,
                ),
              ),
            ),
          ),
        ),
        Flexible(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: AutoSizeText(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ktsSmallBodyText.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (product.price >= 1000000) ...[
                    AutoSizeText(
                      toCurrencyString(
                              discount != null
                                  ? '$discountPrice'
                                  : '${product.price}',
                              shorteningPolicy:
                                  ShorteningPolicy.RoundToMillions) +
                          ' ${product.currency}',
                      style: ktsSmallBodyText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: discount != null ? kcSecondary : kcIconDark),
                    )
                  ],
                  if (product.price < 1000000) ...[
                    AutoSizeText(
                      toCurrencyString(
                              discount != null
                                  ? '$discountPrice'
                                  : '${product.price}',
                              shorteningPolicy: ShorteningPolicy.NoShortening,
                              thousandSeparator: ThousandSeparator.Period) +
                          ' ${product.currency}',
                      style: ktsSmallBodyText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: discount != null ? kcSecondary : kcIconDark),
                    ),
                  ],
                  if (product.boughtCount >= 5)
                    AutoSizeText(
                      "(" +
                          toCurrencyString(
                            '${product.boughtCount}',
                            mantissaLength: 0,
                            shorteningPolicy: product.boughtCount >= 1000
                                ? ShorteningPolicy.Automatic
                                : ShorteningPolicy.NoShortening,
                          ) +
                          " vendas)",
                      style: ktsSmallBodyText.copyWith(
                          fontSize: 12, color: kcIcon),
                    )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}

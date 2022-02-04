import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.navigate})
      : super(key: key);
  final ProductDataEntity product;
  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigate(),
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ProductImage(product: product),
            ),
            Flexible(
                child: ProductDetails(
              product: product,
            ))
          ],
        ),
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key, required this.product, required this. navigate}) : super(key: key);
  final ProductDataEntity product;
  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> navigate(),
      child: Container(
        margin: const EdgeInsets.all(3),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 7 / 6,
              child: ProductImage(product: product),
            ),
            ProductDetails(
              product: product,
            )
          ],
        ),
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
  }) : super(key: key);

  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        child: product.price >= 1000000
            ? AutoSizeText(
                toCurrencyString(
                        product.onSale == true
                            ? '${product.salePrice}'
                            : '${product.price}',
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
                            product.onSale == true
                                ? '${product.salePrice}'
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
                            product.onSale == true
                                ? '${product.salePrice}'
                                : '${product.price}',
                            shorteningPolicy: ShorteningPolicy.NoShortening,
                            thousandSeparator: ThousandSeparator.Period) +
                        ' ${product.currency}',
                    style: ktsSmallBodyText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: product.inStock == false ? kcIcon : kcIconDark),
                  ),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: product.price >= 1000000
              ? AutoSizeText(
                  toCurrencyString(
                          product.onSale == true
                              ? '${product.salePrice}'
                              : '${product.price}',
                          shorteningPolicy: ShorteningPolicy.Automatic,
                          thousandSeparator: ThousandSeparator.Period) +
                      ' ${product.currency}',
                  style: ktsMediumBodyText.copyWith(
                      fontWeight: FontWeight.w600,
                      
                      color: product.inStock == false ? kcIcon : product.onSale == true? kcSecondary : kcIconDark),
                )
              : product.price >= 100000
                  ? AutoSizeText(
                      toCurrencyString(
                              product.onSale == true
                                  ? '${product.salePrice}'
                                  : '${product.price}',
                              shorteningPolicy: ShorteningPolicy.Automatic,
                              thousandSeparator: ThousandSeparator.Period) +
                          ' ${product.currency}',
                      style: ktsMediumBodyText.copyWith(
                          fontWeight: FontWeight.w600,
                          
                          color: product.inStock == false ? kcIcon : product.onSale == true? kcSecondary : kcIconDark),
                    )
                  : AutoSizeText(
                      toCurrencyString(
                              product.onSale == true
                                  ? '${product.salePrice}'
                                  : '${product.price}',
                              shorteningPolicy: ShorteningPolicy.NoShortening,
                              thousandSeparator: ThousandSeparator.Period) +
                          ' ${product.currency}',
                      style: ktsMediumBodyText.copyWith(
                          fontWeight: FontWeight.w600,
                          
                          color: product.inStock == false ? kcIcon : product.onSale == true? kcSecondary : kcIconDark),
                    ),
        ),
        const SizedBox(height: 4),
        if(product.onSale == true && product.inStock == true)...[
          Container(
          child: product.price >= 1000000
              ? AutoSizeText(
                  toCurrencyString(
                           '${product.price}',
                          shorteningPolicy: ShorteningPolicy.Automatic,
                          thousandSeparator: ThousandSeparator.Period) +
                      ' ${product.currency}',
                  style: ktsSmallBodyText.copyWith(
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      color:  kcIcon),
                )
              : product.price >= 100000
                  ? AutoSizeText(
                      toCurrencyString(
                              '${product.price}',
                              shorteningPolicy: ShorteningPolicy.Automatic,
                              thousandSeparator: ThousandSeparator.Period) +
                          ' ${product.currency}',
                      style: ktsSmallBodyText.copyWith(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                          color:  kcIcon),
                    )
                  : AutoSizeText(
                      toCurrencyString(
                               '${product.price}',
                              shorteningPolicy: ShorteningPolicy.NoShortening,
                              thousandSeparator: ThousandSeparator.Period) +
                          ' ${product.currency}',
                      style: ktsSmallBodyText.copyWith(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                          color:  kcIcon),
                    ),
        ),
        ],
        if(product.inStock == false)...[
          
          AutoSizeText("ESGOTADO".toUpperCase(), style: ktsMediumBodyText.copyWith(fontWeight: FontWeight.bold),)
        ]
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDataEntity product;

  @override
  Widget build(BuildContext context) {
    double? value = product.onSale == true
        ? (product.salePrice! * 100) / product.price
        : null;
    final formatter = NumberFormat('###');
    String? discount = value != null ? formatter.format(value) : null;
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
            if (product.onSale == true) ...[
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
  const ProductCardAlternative(
      {Key? key,
      required this.product,
      required this.navigate,
      })
      : super(key: key);

  final ProductDataEntity product;
  final Function  navigate;

  @override
  Widget build(BuildContext context) {
    double? value = product.onSale == true
        ? (product.salePrice! * 100) / product.price
        : null;
    final formatter = NumberFormat('###');
    String? discount = value != null ? formatter.format(value) : null;
    return GestureDetector(
      onTap: ()=> navigate(),
      child: Container(
        child: Column(
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
                      if (product.onSale == true)
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
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Container(
                      //     child: IconButton(
                      //         onPressed: () => bookmark(),
                      //         icon: Icon(
                      //           Icons.bookmark_rounded,
                      //           size: 35,
                      //           color: kcIcon.withOpacity(0.8),
                      //         )),
                      //   ),
                      // )
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
                      product.name,
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
                                  product.onSale == true
                                      ? '${product.salePrice}'
                                      : '${product.price}',
                                  shorteningPolicy:
                                      ShorteningPolicy.RoundToMillions) +
                              ' ${product.currency}',
                          style: ktsSmallBodyText.copyWith(
                              fontWeight: FontWeight.w600,
                              color: product.onSale == true
                                  ? kcSecondary
                                  : kcIconDark),
                        )
                      ],
                      if (product.price < 1000000) ...[
                        AutoSizeText(
                          toCurrencyString(
                                  product.onSale == true
                                      ? '${product.salePrice}'
                                      : '${product.price}',
                                  shorteningPolicy: ShorteningPolicy.NoShortening,
                                  thousandSeparator: ThousandSeparator.Period) +
                              ' ${product.currency}',
                          style: ktsSmallBodyText.copyWith(
                              fontWeight: FontWeight.w600,
                              color: product.onSale == true
                                  ? kcSecondary
                                  : kcIconDark),
                        ),
                      ],
                      // if (product.boughtCount >= 5)
                      //   AutoSizeText(
                      //     "(" +
                      //         toCurrencyString(
                      //           '${product.boughtCount}',
                      //           mantissaLength: 0,
                      //           shorteningPolicy: product.boughtCount >= 1000
                      //               ? ShorteningPolicy.Automatic
                      //               : ShorteningPolicy.NoShortening,
                      //         ) +
                      //         " vendas)",
                      //     style: ktsSmallBodyText.copyWith(
                      //         fontSize: 12, color: kcIcon),
                      //   )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

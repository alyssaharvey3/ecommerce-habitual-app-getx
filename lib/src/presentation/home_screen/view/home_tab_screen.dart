import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitual/src/common_widgets/common_widgets_export.dart';
import 'package:habitual/src/common_widgets/svg_asset.dart';
import 'package:habitual/src/presentation/home_screen/widgets/deals_card.dart';
import 'package:habitual/src/presentation/home_screen/widgets/my_interests_card.dart';
import 'package:habitual/src/routes/app_pages.dart';

import '../../../core/core_export.dart';
import '../widgets/home_category_card.dart';
import '../widgets/main_card.dart';

enum ScrollDirection { forward, backward }

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final _scrollController = ScrollController();

  void _scrollToTheNextItemView({
    ScrollDirection scrollDirection = ScrollDirection.forward,
  }) async {
    if (scrollDirection == ScrollDirection.forward) {
      if (_scrollController.position.pixels <
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        await _scrollController.animateTo(
          _scrollController.position.pixels + 150,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      }
    } else {
      if (_scrollController.position.pixels >
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        await _scrollController.animateTo(
          _scrollController.position.pixels - 150,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final trendingCardColors = [
    AppColors.blue300,
    AppColors.green300,
    AppColors.purple300,
    AppColors.red300,
    AppColors.yellow300,
  ];

  final trendingImages = [
    'https://res-1.cloudinary.com/grover/image/upload/v1678133137/uwe0cdxwdhfmqp2z7tlt.png',
    'https://bumpshoes.com/cdn/shop/products/main_1055x.png?v=1518846318',
    'https://assets.sunglasshut.com/is/image/LuxotticaRetail/8056597614160__STD__shad__qt.png?impolicy=SGH_bgtransparent&width=1000',
    'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_104146487/fee_786_587_png',
  ];

  final dealsImages = [
    'https://assets.bose.com/content/dam/cloudassets/Bose_DAM/Web/consumer_electronics/global/products/headphones/qc35_ii/product_silo_images/qc35_ii_black_EC_hero.png/jcr:content/renditions/cq5dam.web.1280.1280.png',
    'https://images.csmonitor.com/csm/2014/06/hobbit.png?alias=standard_900x600nc',
    'https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/171/17145/17145330_8.png',
    'https://media2.sport-bittl.com/images/product_images/original_images/27826167676a_Birkenstock_Arizona_Schuh_He_schwarz.png',
  ];

  final categoriesTitles = [
    AppTitles.categoryCard1Title,
    AppTitles.categoryCard2Title,
    AppTitles.categoryCard3Title,
    AppTitles.categoryCard4Title,
  ];
  final categoriesColors = [
    AppColors.red300,
    AppColors.purple300,
    AppColors.blue300,
    AppColors.green300,
  ];

  @override
  Widget build(BuildContext context) {
    const isLoggedIn = true;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            leading: const Padding(
              padding: EdgeInsets.only(
                left: Sizes.p24,
                top: Sizes.p16,
                bottom: Sizes.p16,
              ),
              child: SvgAsset(
                assetPath: AppAssets.appLogoBlackSmall,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: Sizes.p24,
                ),
                child: PrimaryIconButton(
                  icon: AppIcons.shoppingCartIcon,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: Sizes.p32,
            ),
            child: Column(
              children: [
                // * Just For You
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Trending',
                          style: Get.textTheme.headlineSmall,
                        ),
                      ),
                      PrimaryIconButton(
                        icon: AppIcons.iOSLeftArrowIcon,
                        onPressed: () => _scrollToTheNextItemView(
                            scrollDirection: ScrollDirection.backward),
                      ),
                      PrimaryIconButton(
                        icon: AppIcons.iOSRightArrowIcon,
                        onPressed: _scrollToTheNextItemView,
                      ),
                    ],
                  ),
                ),
                gapH16,
                SizedBox(
                  height: Sizes.deviceHeight * .48,
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p24,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: trendingImages.length,
                    separatorBuilder: (_, index) => gapW16,
                    itemBuilder: (_, index) => MainCard(
                      cardColor:
                          trendingCardColors[index % trendingCardColors.length],
                      imageUrl: trendingImages[index],
                      onPressed: () => Get.toNamed(
                        AppRoutes.productDetailsRoute,
                      ),
                    ),
                  ),
                ),
                gapH32,
                // * Deals
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p24,
                    vertical: Sizes.p16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Deals',
                          style: Get.textTheme.headlineSmall,
                        ),
                      ),
                      PrimaryTextButton(
                        buttonLabel: 'View all',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                gapH16,
                SizedBox(
                  height: Sizes.deviceHeight * .3,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p24,
                    ),
                    itemCount: dealsImages.length,
                    separatorBuilder: (_, __) => gapW16,
                    itemBuilder: (_, index) => DealsCard(
                      imageUrl: dealsImages[index],
                      onCardTap: () => Get.toNamed(
                        AppRoutes.productDetailsRoute,
                      ),
                      onLikeTap: () {},
                    ),
                  ),
                ),
                gapH32,
                // * My Interests
                const Visibility(
                  visible: isLoggedIn,
                  child: MyInterestsCard(),
                ),
                // * Cards Section
                GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    Sizes.p24,
                    Sizes.p16,
                    Sizes.p24,
                    Sizes.p4,
                  ),
                  itemCount: categoriesTitles.length,
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: Sizes.p16,
                    crossAxisSpacing: Sizes.p12,
                    childAspectRatio: 9 / 10,
                  ),
                  itemBuilder: (_, index) => HomeCategoryCard(
                    color: categoriesColors[index],
                    title: categoriesTitles[index],
                    onTap: () {
                      if (index == 3) {
                        Get.toNamed(
                          AppRoutes.categoriesRoute,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

library profile_page.dart;

import 'package:amatrider/core/domain/entities/entities.dart';
import 'package:amatrider/core/presentation/index.dart';
import 'package:amatrider/features/auth/presentation/managers/managers.dart';
import 'package:amatrider/features/auth/presentation/screens/index.dart';
import 'package:amatrider/features/home/presentation/managers/index.dart';
import 'package:amatrider/features/home/presentation/widgets/index.dart';
import 'package:amatrider/manager/locator/locator.dart';
import 'package:amatrider/utils/utils.dart';
import 'package:amatrider/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../widgets/profile_page_widgets.dart';
part '../widgets/edit_profile_bottom_sheet.dart';
part '../widgets/phone_update_bottom_sheet.dart';

/// A stateless widget to render ProfilePage.
class ProfilePage extends StatefulWidget with AutoRouteWrapper {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AdaptiveScaffold(
      adaptiveToolbar: AdaptiveToolbar(
        showCustomLeading: false,
        title: 'Profile',
        centerTitle: false,
        elevation: 0.0,
        titleStyle: App.titleStyle,
      ),
      body: BlocBuilder<AuthWatcherCubit, AuthWatcherState>(
        builder: (c, s) => SafeArea(
          child: CustomScrollView(
            clipBehavior: Clip.antiAlias,
            controller: ScrollController(),
            physics: Utils.physics,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: App.sidePadding,
                ).copyWith(top: 0.02.sw),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      IgnorePointer(
                        ignoring: s.isLoading,
                        child: _ProfileCardWidget(
                          rider: s.rider,
                          showLoader: s.isLoading,
                        ),
                      ),
                      //
                      VerticalSpace(height: 0.1.sw),
                      //
                      ..._ProfileItem.items
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.only(bottom: 0.045.sw),
                              child: ClipRRect(
                                borderRadius: Utils.cardBorderRadius,
                                child: Material(
                                  type: MaterialType.transparency,
                                  elevation: App.platform.fold(
                                    material: () => 2.0,
                                    cupertino: () => 0.0,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Utils.platform_(
                                        cupertino: App.resolveColor(
                                          Colors.white,
                                          dark: Palette.secondaryColor.shade400,
                                        ),
                                      ),
                                    ),
                                    child: AdaptiveListTile(
                                      focusColor: Colors.black,
                                      hoverColor: Colors.black,
                                      selectedTileColor: Colors.black,
                                      onTap: e.onPressed,
                                      tileColor: App.resolveColor(
                                        Colors.white,
                                        dark: Palette.secondaryColor.shade600,
                                      ),
                                      title: AdaptiveText(
                                        e.title,
                                        fontSize: 17.0.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      trailing: Icon(
                                        Theme.of(context).platform.fold(
                                              material: () =>
                                                  Icons.navigate_next_rounded,
                                              cupertino: () =>
                                                  CupertinoIcons.chevron_right,
                                            ),
                                        semanticLabel: e.title,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      //
                      VerticalSpace(height: 0.07.sw),
                      //
                      Visibility(
                        visible: s.isAuthenticated,
                        child: Hero(
                          tag: Const.profileLogoutBtnHerotag,
                          child: AppButton(
                            text: 'Logout',
                            isLoading: s.isLoading,
                            onPressed: () async {
                              await c.read<AuthWatcherCubit>().signOut();
                              // Reset current Index to 0
                              c.read<TabNavigationCubit>().reset();
                            },
                          ),
                        ),
                      ),
                      //
                      VerticalSpace(height: 0.07.sw)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileItem {
  final VoidCallback onPressed;
  final String title;

  const _ProfileItem({
    required this.title,
    required this.onPressed,
  });

  static List<_ProfileItem> get items => [
        _ProfileItem(
          title: 'Verification',
          onPressed: () => navigator.push(const AccountVerificationRoute()),
        ),
        _ProfileItem(
          title: 'Bank Account Information',
          onPressed: () => navigator.push(const EditBankDetailsRoute()),
        ),
        _ProfileItem(
          title: 'Language',
          onPressed: () {},
        ),
        _ProfileItem(
          title: 'Settings',
          onPressed: () {},
        ),
      ];
}

part of home_page.dart;

/// A stateless widget to render _SendPackageCard.
class _SendPackageCard extends StatefulWidget {
  final SendPackage package;
  final bool initialExpanded;

  const _SendPackageCard({
    Key? key,
    required this.package,
    this.initialExpanded = false,
  }) : super(key: key);

  @override
  State<_SendPackageCard> createState() => __SendPackageCardState();
}

class __SendPackageCardState extends State<_SendPackageCard> {
  ExpandableController? controller;

  void onAccept() => App.showAlertDialog(
        context: context,
        barrierColor: App.resolveColor(
          Colors.grey.shade800.withOpacity(0.55),
          dark: Colors.white54,
        ),
        builder: (_) => AdaptiveAlertdialog(
          title: 'Accept Request',
          content: 'Are you sure you '
              'want to accept this request?',
          cupertinoFirstButtonText: 'No, Go Back',
          onFirstPressed: navigator.pop,
          buttonDirection: Axis.horizontal,
          secondButtonText: 'Yes, Accept',
          secondSplashColor: Colors.black12,
          secondTextStyle: const TextStyle(color: Colors.white),
          secondBgColor: Palette.accentColor,
          onSecondPressed: () async {
            await context
                .read<RequestCubit>()
                .acceptPackageDelivery(context, widget.package);
          },
          materialFirstButton: AppOutlinedButton(
            text: 'No, Go Back',
            height: 0.09.sw,
            cupertinoHeight: 0.028.sh,
            fontSize: 15.sp,
            width: 0.3.sw,
            cupertinoWidth: 0.3.sw,
            onPressed: navigator.pop,
          ),
        ),
      );

  void onDecline() {
    App.showAlertDialog(
      context: context,
      barrierColor: App.resolveColor(
        Colors.grey.shade800.withOpacity(0.55),
        dark: Colors.white54,
      ),
      builder: (_) => AdaptiveAlertdialog(
        title: 'Warning!',
        content: "Are you sure? We'll try not show this request again.",
        cupertinoFirstButtonText: 'No, Go Back',
        onFirstPressed: navigator.pop,
        buttonDirection: Axis.horizontal,
        secondButtonText: 'Yes',
        secondSplashColor: Colors.black12,
        secondTextStyle: const TextStyle(color: Colors.white),
        secondBgColor: Palette.accentColor,
        onSecondPressed: () async {
          await context
              .read<RequestCubit>()
              .declinePackageDelivery(context, widget.package);
        },
        materialFirstButton: AppOutlinedButton(
          text: 'No, Go Back',
          height: 0.09.sw,
          cupertinoHeight: 0.028.sh,
          fontSize: 15.sp,
          width: 0.3.sw,
          cupertinoWidth: 0.3.sw,
          onPressed: navigator.pop,
        ),
      ),
    );
  }

  void onContinue() {
    context.read<RequestCubit>().setCurrentPackage(widget.package);
    navigator.navigate(PackageDeliveryAcceptedRoute(
      sendPackage: widget.package,
    ));
  }

  @override
  void initState() {
    controller = ExpandableController(initialExpanded: widget.initialExpanded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(Utils.inputBorderRadius),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: App.resolveColor(
            Colors.white,
            dark: Palette.secondaryColor,
          ),
        ),
        child: ExpandableTheme(
          data: ExpandableThemeData(
            hasIcon: false,
            tapHeaderToExpand: true,
            tapBodyToCollapse: false,
            iconColor: Palette.accentColor,
            iconPadding:
                const EdgeInsets.symmetric(vertical: 8).copyWith(right: 10),
            useInkWell: Utils.platform_(material: true, cupertino: false),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            inkWellBorderRadius: const BorderRadius.all(
              Radius.circular(Utils.inputBorderRadius),
            ),
          ),
          child: ExpandableNotifier(
            controller: controller,
            child: ScrollOnExpand(
              child: ExpandablePanel(
                header: header,
                collapsed: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1.sw,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ).copyWith(bottom: 10.0),
                    child: widget.package.status.maybeWhen(
                      active: () => _ActionButtons(
                        onAccept: onAccept,
                        onDecline: onDecline,
                      ),
                      orElse: () => AdaptiveButton(
                        text: 'Continue',
                        disabled: context
                            .select((RequestCubit el) => el.state.isLoading),
                        textColor: Colors.white,
                        backgroundColor: Palette.accentColor,
                        splashColor: Colors.white24,
                        height: 0.05.sh,
                        cupertinoHeight: 0.09.sw,
                        onPressed: onContinue,
                      ),
                    ),
                  ),
                ),
                expanded: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04.sw,
                  ).copyWith(bottom: 0.02.sw),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TimelineStatusWidget(
                        padding: EdgeInsets.zero,
                        itemHeight: (_, __) => 0.08.h,
                        statuses: [
                          TimelineStatus(
                            asset: AppAssets.timelinePinAsset,
                            assetColor: Palette.accentBlue,
                            title: 'Pick Up Location',
                            subtitle:
                                '${widget.package.pickup.address.getOrEmpty}',
                          ),
                          //
                          TimelineStatus(
                            asset: AppAssets.timelinePinAsset,
                            assetColor: Palette.accentGreen,
                            title: 'Delivery Location',
                            subtitle:
                                '${widget.package.destination.address.getOrEmpty}',
                          ),
                        ],
                      ),
                      //
                      VerticalSpace(height: 0.007.sw),
                      //
                      widget.package.status.maybeWhen(
                        active: () => _ActionButtons(
                          onAccept: onAccept,
                          onDecline: onDecline,
                        ),
                        orElse: () => AdaptiveButton(
                          text: 'Continue',
                          disabled: context
                              .select((RequestCubit el) => el.state.isLoading),
                          textColor: Colors.white,
                          backgroundColor: Palette.accentColor,
                          splashColor: Colors.white24,
                          height: 0.05.sh,
                          cupertinoHeight: 0.09.sw,
                          onPressed: onContinue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get header => Material(
        borderRadius: BorderRadius.circular(5.0),
        type: MaterialType.transparency,
        elevation: 0.0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(AppAssets.slider0,
                  width: 0.14.sw, height: 0.14.sw, fit: BoxFit.fill),
            ),
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: AdaptiveText(
                      '${widget.package.receiverFullName.getOrEmpty}',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  //
                  Flexible(
                    child: AdaptiveText(
                      '${widget.package.amount.getOrEmpty}'.asCurrency(),
                      minFontSize: 14,
                      maxFontSize: 17,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 0.015.sw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: HorizontalChipWidget(
                        widgetPadding: EdgeInsets.symmetric(vertical: 0.004.sh),
                        scrollMargin: EdgeInsets.only(right: 0.02.sw),
                        wrapped: false,
                        tags: [
                          HorizontalChip(
                            label: 'Package',
                            maxFontSize: 13,
                            labelColor: Palette.accentDarkYellow,
                            backgroundColor: Palette.pastelYellow,
                            type: HorizontalChipType.none,
                          ),
                          //
                          HorizontalChip(
                            label: '${Utils.hoursAndMins(
                              widget.package.durationToPickup,
                            )}',
                            maxFontSize: 13,
                            labelColor: Palette.accentGreen,
                            backgroundColor: Palette.pastelGreen,
                            type: HorizontalChipType.none,
                          ),
                        ],
                      ),
                    ),
                    //
                    widget.package.paymentMethod?.maybeWhen(
                          deliveryWithCard: () => Flexible(
                            flex: 2,
                            child: AdaptiveText(
                              '${widget.package.paymentMethod?.formatted}',
                              minFontSize: 12,
                              maxLines: 1,
                              softWrap: true,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ),
                          deliveryWithCash: () => Flexible(
                            flex: 2,
                            child: AdaptiveText(
                              '${widget.package.paymentMethod?.formatted}',
                              minFontSize: 12,
                              maxLines: 1,
                              softWrap: true,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ),
                          orElse: () => const Icon(
                            Icons.check_circle,
                            color: Palette.accentGreen,
                          ),
                        ) ??
                        Utils.nothing,
                  ],
                ),
              ),
            ),
            dense: false,
            horizontalTitleGap: 8.0,
            minVerticalPadding: 8.0,
            contentPadding: EdgeInsets.symmetric(
              vertical: 0.01.sw,
              horizontal: 0.03.sw,
            ),
          ),
        ),
      );
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  const _ActionButtons({
    Key? key,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppOutlinedButton(
          text: 'Decline',
          disabled: c.select((RequestCubit el) => el.state.isLoading),
          textColor: Palette.accentColor,
          height: 0.05.sh,
          cupertinoHeight: 0.09.sw,
          width: 0.3.sw,
          cupertinoWidth: 0.3.sw,
          onPressed: onDecline,
        ),
        //
        AdaptiveButton(
          text: 'Accept',
          disabled: c.select((RequestCubit el) => el.state.isLoading),
          textColor: Colors.white,
          backgroundColor: Palette.accentColor,
          splashColor: Colors.white24,
          height: 0.05.sh,
          cupertinoHeight: 0.09.sw,
          width: 0.3.sw,
          cupertinoWidth: 0.3.sw,
          onPressed: onAccept,
        ),
      ],
    );
  }
}

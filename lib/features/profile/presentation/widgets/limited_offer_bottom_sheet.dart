import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/theme/app_colors.dart';
import 'package:dating_app/core/utils/widgets/button.dart';
import 'package:flutter/material.dart';

Future<void> showLimitedOfferBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => const _LimitedOfferContent(),
  );
}

class _LimitedOfferContent extends StatelessWidget {
  const _LimitedOfferContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          colors: [AppColors.primary, AppColors.background],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).limitedOffer,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).limitedOfferDescription,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 20),
          // Bonus ikonları
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Alacağınız Bonuslar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BonusIcon(
                      title: S.of(context).premiumAccount,
                      icon: Icons.star,
                    ),
                    _BonusIcon(
                      title: S.of(context).moreMatches,
                      icon: Icons.favorite,
                    ),
                    _BonusIcon(
                      title: S.of(context).boost,
                      icon: Icons.arrow_upward,
                    ),
                    _BonusIcon(
                      title: S.of(context).moreLikes,
                      icon: Icons.thumb_up,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 8),
          const Text(
            'Kilidi açmak için bir jeton paketi seçin',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          // Jeton kartları
          Row(
            children: const [
              Expanded(
                child: _TokenCard(
                  discount: "+10%",
                  old: "200",
                  newAmount: "330",
                  price: "₺99,99",
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 4.0,
                    colors: [Color(0xff6F060B), AppColors.primary],
                  ),
                  topColor: Color(0xff6F060B),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _TokenCard(
                  discount: "+70%",
                  old: "2.000",
                  newAmount: "3.375",
                  price: "₺799,99",
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 2.0,
                    colors: [Color(0xff5949E6), AppColors.primary],
                  ),
                  topColor: Color(0xff5949E6),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _TokenCard(
                  discount: "+35%",
                  old: "1.000",
                  newAmount: "1.350",
                  price: "₺399,99",
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 4.0,
                    colors: [Color(0xff6F060B), AppColors.primary],
                  ),
                  topColor: Color(0xff6F060B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Jetonları Gör Butonu
          AppButton(text: S.of(context).limitedOfferButton, onPressed: () {}),
        ],
      ),
    );
  }
}

class _BonusIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const _BonusIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 24,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _TokenCard extends StatelessWidget {
  final String discount;
  final String old;
  final String newAmount;
  final String price;
  final Gradient? gradient;
  final Color? topColor;

  const _TokenCard({
    required this.discount,
    required this.old,
    required this.newAmount,
    required this.price,
    this.gradient,
    this.topColor = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white30, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Text(
                old,
                style: const TextStyle(
                  color: Colors.white38,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                newAmount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(price, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: topColor,
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              discount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

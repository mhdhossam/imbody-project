import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/pages/premium/premium_plans_widget/premium_plans_widget_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumPlansView extends StatelessWidget {
  static final List<Map<String, dynamic>> plans = [
    {
      "title": "Weekly",
      "price": 9.99,
      "features": [
        'access to all of Fitgenie for 1 week',
        'Unlimited access to all features.',
      ],
      "no_features": [
        'access to all of Fitgenie for 1 week',
        'Unlimited access to all features.',
      ],

    },
    {
      "title": "Monthly",
      "price": 29.99,
      "features": [
        'Access to all of Fitgenie\'s features.',
        'Unlimited access to all features.',
      ],
      "no_features": [
        'access to all of Fitgenie for 1 week',
        'Unlimited access to all features.',
      ],
    },
    {
      "title": "Yearly",
      "price": 299.99,
      "features": [
        'Access to all of Fitgenie\'s features.',
        'Unlimited access to all features.',
      ],
      "no_features": [
        'access to all of Fitgenie for 1 week',
        'Unlimited access to all features.',
      ],
    },
    {
      "title": "Lifetime",
      "price": 999.99,
      "features": [
        'Access to all of Fitgenie\'s features.',
        'Unlimited access to all features.',
      ],
      "no_features": [
        'access to all of Fitgenie for 1 week',
        'Unlimited access to all features.',
      ],
    },
  ];
  static const String routeName = '/premium-plans';

  const PremiumPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Premium Plans',
              style: theme.textTheme.headlineLarge,
            ),
            const Icon(
              Icons.workspace_premium_rounded,
              color: Colors.amber,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 30,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Get access to premium features'),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 120),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: plans.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 25,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return FadeInLeft(
                duration: const Duration(milliseconds: 700),
                delay: Duration(milliseconds: index+1 * 200),
                child: PlanContainer(
                  title: plans[index]['title'],
                  price: '${plans[index]['price']}week',
                  descriptionListPlan: plans[index]['features']?? [
                    'Access to all of Fitgenie\'s features.',
                    'Unlimited access to all features.',
                  ],
                  nonFeatureListPlan: plans[index]['no_features'] ?? [
                    'access to all of Fitgenie for 1 week',
                    'Unlimited access to all features.',
                  ],
                  callbackAction: () {},
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class PlanContainer extends StatelessWidget {
  final String title;
  final String price;
  final List<String> descriptionListPlan;
  final List? nonFeatureListPlan;
  final Function callbackAction;

  const PlanContainer({
    super.key,
    required this.title,
    required this.price,
    required this.descriptionListPlan,
    this.nonFeatureListPlan,
    required this.callbackAction ,
  });
  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: screenHeight * 0.33,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 5,
            width: screenWidth * 0.15,
            margin: const EdgeInsets.symmetric( vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
            )
          ),
          Text(title,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.normal)),
          Text(price,
              style: const TextStyle(fontSize: 21, color: Colors.amber)),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: descriptionListPlan.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(descriptionListPlan[index],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15)),
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  ],
                );
              }),
          nonFeatureListPlan == null
              ? const SizedBox()
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nonFeatureListPlan!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nonFeatureListPlan![index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                        const Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        )
                      ],
                    );
                  }),
          const SizedBox(
            height: 10,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                callbackAction();
              },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text('Get Started')),
            ],
          )
        ],
      ),
    );
  }
}

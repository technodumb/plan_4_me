import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plan_4_me/model/plan_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF040313),
        appBar: AppBar(
          backgroundColor: const Color(0xFF040313),
          // backgroundColor: ,
          // leading: ,
          automaticallyImplyLeading: false,
          title: const Text('Plan4Me'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              splashRadius: 20,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Progress'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.3,

                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              bottomLeft: Radius.circular(13),
                            ),
                          ),
                          // child: ,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF191919),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF595959),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            // style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Color(0x7FFFFFFF)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            // textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0x7FFFFFFF),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: [
                          PlanBoxButton(
                            height: 100,
                            planModel: PlanModel(
                              isHighPriority: true,
                              planName: 'Trip to munnar',
                              planDescription:
                                  '3 day trip to munnar with friends',
                              planDate: '12/12/2023',
                              planTime: '12:00 PM',
                              planID: '1234567890',
                              subPlans: [
                                PlanModel(
                                  planID: '123',
                                  planName: 'Botanical Garden',
                                  planDescription:
                                      'visit botanical garden at night',
                                  planDate: '12/12/2023',
                                  planTime: '8:00 PM',
                                  // subPlans: ,
                                  isHighPriority: true,
                                ),
                                PlanModel(
                                  planID: '234',
                                  planName: 'Mountain Hiking',
                                  planDescription:
                                      'Hike the mountain early morning',
                                  planDate: '13/12/2023',
                                  planTime: '6:00 AM',
                                  // subPlans: ,
                                  isHighPriority: true,
                                ),
                              ],
                              // time: '12:00',
                            ),
                          ),
                          // PlanBoxButton(
                          //   height: 300,
                          // ),
                          // PlanBoxButton(
                          //   isHighPriority: true,
                          //   height: 300,
                          // ),
                          // PlanBoxButton(
                          //   isHighPriority: true,
                          //   height: 300,
                          // ),

                          // Container(
                          //   margin: const EdgeInsets.all(8),
                          //   height: 200,
                          //   width: width * 0.4,
                          //   decoration: BoxDecoration(
                          //     // color: Colors.green,
                          //     gradient: const LinearGradient(
                          //         begin: Alignment.topCenter,
                          //         end: Alignment.bottomCenter,
                          //         colors: [Color(0xB4AE0000), Color(0x28FF0000)]),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          // ),
                          // Container(
                          //   margin: const EdgeInsets.all(8),
                          //   decoration: BoxDecoration(
                          //   height: 200,
                          //   width: width * 0.4,
                          //     // color: Colors.green,
                          //     gradient: const LinearGradient(
                          //         begin: Alignment.topCenter,
                          //         end: Alignment.bottomCenter,
                          //         colors: [Color(0xFFF0C62D), Color(0x2CF0C62D)]),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFD9D9D9),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    // context.read<AddPlanProvider>().titleController.text =
                    //     'hellooo';
                    Navigator.of(context).pushNamed('/add_plan');
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanBoxButton extends StatelessWidget {
  final double height;
  final PlanModel planModel;
  // final bool isHighPriority;
  const PlanBoxButton({
    super.key,
    required this.height,
    required this.planModel,
    // this.isHighPriority = false,
  });

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: Container(
          // height: height,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.green,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: planModel.isHighPriority
                  ? [const Color(0xB4AE0000), const Color(0x28FF0000)]
                  : [const Color(0xFFF0C62D), const Color(0x2CF0C62D)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  Center(
                    child: Text(
                      planModel.planName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        planModel.planDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        planModel.planTime,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ] +
                planModel.subPlans
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.planName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/puzzle_controller.dart';

class PuzzleView extends StatelessWidget {
  const PuzzleView({super.key});

  @override
  Widget build(BuildContext context) {
    final PuzzleController controller =
        Get.put(PuzzleController()); // Controller'ni yaratish yoki topish

    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        title: const Text('Puzzle'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.greenAccent,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Center(
                      child: Obx(() => Text(
                            'Time: ${controller.elapsedTime} s',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
                Container(
                  color: Colors.greenAccent,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Center(
                      child: Obx(() => Text(
                            'Step: ${controller.moveCount}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Obx(() => GridView.builder(
                      itemCount: controller.tiles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.gridSize,
                          // Bu yerda controller.gridSize ishlatilmoqda
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.moveTile(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: controller.tiles[index] == 16
                                  ? Colors.transparent
                                  : Colors.greenAccent[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              controller.tiles[index] == 16
                                  ? ''
                                  : controller.tiles[index].toString(),
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 24),
                ),
                onPressed: controller.gameEnded.value
                    ? null
                    : () => controller.resetGame(),
                child: const Text('Start'),
              ),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}

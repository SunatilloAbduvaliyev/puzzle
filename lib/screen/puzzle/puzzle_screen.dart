import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/puzzle_controller.dart';

class PuzzleView extends StatelessWidget {
  const PuzzleView({super.key});

  @override
  Widget build(BuildContext context) {
    final PuzzleController controller = Get.put(PuzzleController());  // Controller'ni yaratish yoki topish

    return Scaffold(
      appBar: AppBar(
        title: const Text('15 Puzzle'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: (){
            controller.shuffleTiles();
          }, icon: Icon(Icons.shuffle)),
        ],
      ),
      body: Column(
          children: [
          const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(() => Text(
              'Vaqt: ${controller.elapsedTime} s',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Obx(() => Text(
              'Harakatlar: ${controller.moveCount}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
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
                  crossAxisCount: controller.gridSize, // Bu yerda controller.gridSize ishlatilmoqda
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.moveTile(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: controller.tiles[index] == 16 ? Colors.transparent : Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      controller.tiles[index] ==16 ? '' : controller.tiles[index].toString(),
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
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
        child: Obx(() => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(fontSize: 24),
            ),
            onPressed: controller.gameEnded.value ? null : () => controller.resetGame(),
            child: const Text('Oyinni boshlash'),
            )),
        ),
        ],
      ),
    );
  }
}

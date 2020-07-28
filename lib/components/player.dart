import 'dart:ui';

import 'package:flutter_swarm_game/game_controller.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    //Definindo o tamanho e o posicionamento do player
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2,
      gameController.screenSize.height / 2 - size / 2,
      size,
      size,
    );
  }

  void render(Canvas c) {
    //Definindo a cor e pintar o player na tela
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t) {
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      gameController.initialize();
    }
  }
}

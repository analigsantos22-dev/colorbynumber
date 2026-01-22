if (instance_exists(Obj_game_manager)) {
    if (Obj_game_manager.is_finished == true) {
        room_restart();
    }
}
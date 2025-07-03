namespace targets {
    struct Alien {
            int x_coordinate, y_coordinate, health{3};

            Alien(int new_x, int new_y) {
                x_coordinate = new_x;
                y_coordinate = new_y;
                health = 3;
            }
            int get_health() {
                return health;
            }
            bool hit() {
                health -= 1;
                return true;
            }
            bool is_alive() {
                return health > 0;
            }
            bool teleport(int new_x, int new_y) {
                x_coordinate = new_x;
                y_coordinate = new_y;
                
                return true;
            }
            bool collision_detection(Alien other) {
                return other.x_coordinate == x_coordinate && other.y_coordinate == y_coordinate;
            }
    };
}
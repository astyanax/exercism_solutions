#include "robot_simulator.h"

#include "robot_simulator.h"

void robot_turn_right(robot_status_t *robot);
void robot_turn_left(robot_status_t *robot);
void robot_advance(robot_status_t *robot);

robot_status_t robot_create(robot_direction_t direction, int x, int y) {
  return (robot_status_t){direction, (robot_position_t){x, y}};
}

void robot_turn_right(robot_status_t *robot) {
  robot->direction = (robot->direction + 1) % DIRECTION_MAX;
}

void robot_turn_left(robot_status_t *robot) {
  robot->direction =
      robot->direction ? robot->direction - 1 : DIRECTION_MAX - 1;
}

void robot_advance(robot_status_t *robot) {
  switch (robot->direction) {
  case DIRECTION_NORTH:
    robot->position.y++;
    break;
  case DIRECTION_EAST:
    robot->position.x++;
    break;
  case DIRECTION_SOUTH:
    robot->position.y--;
    break;
  default:
    robot->position.x--;
  }
}

void robot_move(robot_status_t *robot, const char *commands) {
  for (unsigned i = 0; commands[i] != '\0'; i++) {
    switch (commands[i]) {
    case 'R':
      robot_turn_right(robot);
      break;
    case 'L':
      robot_turn_left(robot);
      break;
    case 'A':
      robot_advance(robot);
      break;
    }
  }
}
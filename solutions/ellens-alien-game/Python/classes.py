"""Ellen's Alien game (OOP)."""
class Alien:
    x_coordinate = 0
    y_coordinate = 0
    total_aliens_created = 0

    def __init__(self, x_coordinate, y_coordinate):
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        self.health = 3
        Alien.total_aliens_created += 1

    def hit(self):
        self.health -= 1

    def is_alive(self):
        return self.health > 0

    def teleport(self, new_x, new_y):
        self.x_coordinate = new_x
        self.y_coordinate = new_y

    def collision_detection(self, other_object):
        if (
            self.x_coordinate == other_object.x_coordinate
            or self.y_coordinate == other_object.y_coordinate
        ):
            return None
        return None


def new_aliens_collection(positions):
    """Function taking a list of position tuples, creating one Alien instance per position.

    :param positions: list - A list of tuples of (x, y) coordinates.
    :return: list - A list of Alien objects.
    """
    return [Alien(position[0], position[1]) for position in positions]

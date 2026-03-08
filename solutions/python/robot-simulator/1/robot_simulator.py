# Globals for the bearings
# Change the values as you see fit
EAST = 1
NORTH = 2
WEST = 3
SOUTH = 4


class Robot(object):
    def __init__(self, bearing=NORTH, x=0, y=0):
        self.coordinates = (x,y)
        self.bearing = bearing

    def advance(self):
        if self.bearing == EAST:
            self.coordinates = (self.coordinates[0] + 1, self.coordinates[1])
        if self.bearing == WEST:
            self.coordinates = (self.coordinates[0] - 1, self.coordinates[1])
        if self.bearing == NORTH:
            self.coordinates = (self.coordinates[0], self.coordinates[1] + 1)
        if self.bearing == SOUTH:
            self.coordinates = (self.coordinates[0], self.coordinates[1] - 1)

    def turn_left(self):
        if self.bearing == SOUTH:
            self.bearing = EAST
        else:
            self.bearing += 1

    def turn_right(self):
        if self.bearing == EAST:
            self.bearing = SOUTH
        else:
            self.bearing -= 1

    def simulate(self, commands):
        for command in commands:
            if command == 'R':
                self.turn_right()
            elif command == 'L':
                self.turn_left()
            elif command == 'A':
                self.advance()
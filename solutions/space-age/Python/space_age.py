EARTH_SECONDS = 60 * 60 * 24 * 365.25
PLANET_RATIOS = {
    'mercury': 0.2408467,
    'venus'  : 0.61519726,
    'earth'  : 1.0,
    'mars'   : 1.8808158,
    'jupiter': 11.862615,
    'saturn' : 29.447498,
    'uranus' : 84.016846,
    'neptune': 164.79132
}

class SpaceAge(object):

    def __init__(self, seconds: int):
        self.seconds = seconds

    @property
    def years(self):
        return self.seconds / EARTH_SECONDS

    def on_venus(self):
        return round(self.years / PLANET_RATIOS["venus"], 2)

    def on_earth(self):
        return round(self.years / PLANET_RATIOS["earth"], 2)

    def on_mercury(self):
        return round(self.years / PLANET_RATIOS["mercury"], 2)

    def on_mars(self):
        return round(self.years / PLANET_RATIOS["mars"], 2)

    def on_jupiter(self):
        return round(self.years / PLANET_RATIOS["jupiter"], 2)

    def on_saturn(self):
        return round(self.years / PLANET_RATIOS["saturn"], 2)

    def on_uranus(self):
        return round(self.years / PLANET_RATIOS["uranus"], 2)

    def on_neptune(self):
        return round(self.years / PLANET_RATIOS["neptune"], 2)
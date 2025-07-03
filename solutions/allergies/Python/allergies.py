class Allergies:
    allergens = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
    
    def __init__(self, score):
        self.score = score
        self.allergies = [x for i, x in enumerate(self.allergens) if score == score | 1 << i]

    def allergic_to(self, item):
        return item in self.allergies

    @property
    def lst(self):
        return [name for name in self.allergens if self.allergic_to(name)]

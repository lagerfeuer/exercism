class Allergies(object):

    def __init__(self, score):
        self.score = score
        self.allergies = [ 'eggs', 'peanuts', 'shellfish', 'strawberries',
                'tomatoes', 'chocolate', 'pollen', 'cats' ]

    def is_allergic_to(self, item):
        if not item in self.allergies:
            return False
        idx = self.allergies.index(item)
        return (self.score & (1 << idx)) != 0


    @property
    def lst(self):
        allergy_list = []
        for allergy in self.allergies:
            if self.is_allergic_to(allergy):
                allergy_list.append(allergy)
        return allergy_list
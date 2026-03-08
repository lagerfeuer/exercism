from collections import defaultdict
class School(object):
    def __init__(self):
        self.entries = defaultdict(int)

    def add_student(self, name, grade):
        self.entries[name] = grade

    def roster(self):
        return [name for name in
                sorted(self.entries.keys(),
                       key=lambda e: (self.entries[e], e))]

    def grade(self, grade_number):
        return sorted([key for key in self.entries.keys()
                       if self.entries[key] == grade_number])


from collections import namedtuple

Entry = namedtuple('Entry', ['student', 'grade'])

class School(object):
    def __init__(self):
        self.entries = []

    def add_student(self, name, grade):
        self.entries.append(Entry(student=name, grade=grade))

    def roster(self):
        return [x for (x, y) in
                sorted(self.entries, key=lambda e: (e.grade, e.student))]

    def grade(self, grade_number):
        return sorted([entry.student for entry in self.entries
                       if entry.grade == grade_number])


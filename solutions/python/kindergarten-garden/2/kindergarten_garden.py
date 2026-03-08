class Garden(object):
    _students = [
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Eve",
        "Fred",
        "Ginny",
        "Harriet",
        "Ileana",
        "Joseph",
        "Kincaid",
        "Larry",
    ]

    def __init__(self, diagram, students=_students):
        _plants = {
            plant[0]: plant for plant in ["Clover", "Grass", "Radishes", "Violets"]
        }
        self.students = sorted(students)
        rows = diagram.split("\n")
        self.students_plants = {}
        for student in self.students:
            self.students_plants[student] = []
            idx = self.students.index(student) * 2
            for row in rows:
                self.students_plants[student] += row[idx:idx+2]
            self.students_plants[student] = [
                _plants[p] for p in self.students_plants[student]
            ]

    def plants(self, student):
        return self.students_plants[student]

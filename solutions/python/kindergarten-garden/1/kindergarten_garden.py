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
        self._plants = {
            plant[0]: plant for plant in ["Clover", "Grass", "Radishes", "Violets"]
        }
        self.rows = diagram.split("\n")
        self.students = sorted(students)

    def plants(self, student):
        idx = self.students.index(student) * 2
        plants = []
        for row in self.rows:
            plants += row[idx : idx + 2]
        return [self._plants[plant] for plant in plants]

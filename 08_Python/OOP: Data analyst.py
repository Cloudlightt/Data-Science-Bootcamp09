## OOP
class da():
    def __init__(self, name, position, skill, company, old_experience, old_position):
        self.name = name
        self.position = position
        self.skill = skill
        self.company = company
        self.old_experience = old_experience
        self.old_position = old_position

    def greeting(self):
        print(f"Hello everyone! my name is {self.name}!")

    def work(self):
        print(f"I work as a {self.position} at {self.company}")

    def ability(self):
        print(f"I'm passionate about using data to solve problems and find insights with foundatios {self.skill} !")

    def old(self):
        print(f"I have {self.old_experience} of work experience as {self.old_position}")

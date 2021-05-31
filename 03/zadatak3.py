import sys
import os


def load_students(path):
    students = {}
    with open(path, "r", encoding='utf8') as f:
        for line in f:
            if not line:  # skip blank lines
                continue

            student = line.split(" ")
            if len(student) != 3:
                raise RuntimeError("Student entry invalid!")

            # make entry in map for student
            students[student[0].strip()] = {'last_name': student[1].strip(), 'first_name': student[2].strip()}

    return students


def load_points(students, directory, path):
    info = path[0:-4].split("_")  # remove .txt

    with open(directory+"/"+path, "r", encoding='utf8') as file:
        for line in file:
            if not line:  # skip blank lines
                continue

            student = line.strip().split(" ")
            if len(student) != 2:
                raise RuntimeError("Lab entry invalid!")
            if student[0].strip() not in students:
                raise RuntimeError("Student with this JMBAG does not exist!")

            s = students[student[0].strip()]
            if info[1] in s:
                raise RuntimeError("Student already has points for this lab!")

            s[info[1]] = student[1].strip()


def main():
    if len(sys.argv) != 2:
        raise RuntimeError("Invalid number of arguments!")

    students = load_students(sys.argv[1] + "/studenti.txt")

    for file in os.listdir(sys.argv[1]):
        if file.startswith("Lab"):
            load_points(students, sys.argv[1], file)

    print("JMBAG     \tPrezime, Ime" + " "*20 + "L1\t\tL2\t\tL3")
    for [key, value] in students.items():
        print("{}\t{:30s}\t{}\t\t{}\t\t{}".format(key, value['last_name']+", "+value['first_name'], 
                                                  value.get('01', '-'), value.get('02', '-'), value.get('03', '-')))


if __name__ == "__main__":
    main()

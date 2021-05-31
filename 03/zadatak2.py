import math
import sys


def main():
    if len(sys.argv) != 2:
        raise RuntimeError("Invalid number of arguments!")

    print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")

    count = 1
    with open(sys.argv[1], "r", encoding='utf8') as file:
        while True:
            line = file.readline().strip()
            if not line:
                break

            numbers = [float(x) for x in line.split(" ")]
            numbers.sort()

            values = []
            for i in range(1, 10):
                index = math.floor(i / 10 * (len(numbers)-1))
                values.append(str(numbers[index]))

            print("{:03d}#".format(count) + "#".join(values))
            count += 1


if __name__ == "__main__":
    main()

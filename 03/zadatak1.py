import sys


def load_matrix(file):
    matrix = {}
    header = file.readline().strip()
    if not header:  # check if header exists
        raise RuntimeError("Header does not exist!")

    header = header.split(" ")
    if len(header) != 2:  # header must contain two values
        raise RuntimeError("Header must contain number of rows and columns!")

    matrix["size"] = int(header[0]), int(header[1])

    while True:
        line = file.readline().strip()
        if not line:  # check if line is empty
            break

        line = line.split(" ")
        if len(line) != 3:  # check if line contains enough values
            raise RuntimeError("Each matrix entry must contain three values, two indices and the value")

        matrix[int(line[0]), int(line[1])] = float(line[2])

    return matrix


def print_matrix(matrix):
    for i in range(matrix.get('size', (0, 0))[0]):
        for j in range(matrix.get('size', (0, 0))[1]):
            print("{:6.2f}".format(matrix.get((i, j), 0)), end=" ")
        print()


def save_result(path, matrix):
    with open(path, "w", encoding='utf8') as file:
        size = matrix.get('size', (0, 0))
        file.write("{} {}\n".format(size[0], size[1]))

        for i in range(size[0]):
            for j in range(size[1]):
                value = matrix.get((i, j), 0)
                if value != 0:
                    file.write("{} {} {:.2f}\n".format(i, j, matrix.get((i, j))))


def multiply_matrices(a, b):
    size_a = a.get('size', (0, 0))
    size_b = b.get('size', (0, 0))

    if size_a[1] != size_b[0]:
        raise RuntimeError("Incompatible matrices!")

    matrix = {'size': (size_a[0], size_b[1])}
    for i in range(size_a[0]):
        for j in range(size_b[1]):
            res = 0
            for x in range(size_a[1]):
                res += a.get((i, x), 0) * b.get((x, j), 0)

            matrix[i, j] = res

    return matrix


def main():
    if len(sys.argv) != 3:
        print("Invalid number of command line arguments! Two arguments are required.")
        print("First argument is path to file containing matrices.")
        print("Second argument is path to save the results to.")
        exit(1)

    with open(sys.argv[1], "r", encoding='utf8') as file:
        matrix_a = load_matrix(file)
        matrix_b = load_matrix(file)

    print("A:")
    print_matrix(matrix_a)
    print("\nB:")
    print_matrix(matrix_b)

    matrix_res = multiply_matrices(matrix_a, matrix_b)
    print("\nA*B:")
    print_matrix(matrix_res)
    save_result(sys.argv[2], matrix_res)


if __name__ == "__main__":
    main()

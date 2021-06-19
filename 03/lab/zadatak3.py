import sys


def load():
    path = sys.argv[1]
    mapa = {}
    with open(path, 'r', encoding='utf-8') as file:
        for line in file:
            if not line:  # skip empty lines
                continue
            line = line.strip()
            if not line:
                continue  # skip blank lines

            parts = line.split()
            ip = parts[0]
            size = parts[9]

            if size != '-':
                size = int(size)
            else:
                size = 0

            second = ip.index('.', 4)
            prefix = ip[:second]

            v = mapa.get(prefix, 0)
            mapa[prefix] = v + size

    return mapa


def print_result(mapa):
    print("-"*30)
    print("  IP adrese   |  Br. pristupa")
    print("-"*30)

    entorke = [(x[0], x[1]) for x in mapa.items()]
    sortirano = sorted(entorke, key=lambda t: t[1], reverse=True)

    for a in sortirano:
        print(" {:>7s}.*.*   {:>12d}".format(a[0], a[1]))

    print("-"*30)


def main():
    if len(sys.argv) != 2:
        raise RuntimeError("Invalid number of arguments! Only one argument has to be given!")

    mapa = load()
    print_result(mapa)


if __name__ == "__main__":
    main()

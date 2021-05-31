import urllib.request
import sys
import re


def main():
    if len(sys.argv) != 2:
        raise RuntimeError("Invalid number of arguments!")

    url = sys.argv[1]

    web_page = urllib.request.urlopen(url)
    mystr = web_page.read().decode('utf8').strip()
    print(mystr)

    links = re.findall('href="[^"]*"', mystr)
    print("Links: ", links)

    hosts = re.findall("[a-z][a-z0-9+\-.]*://([a-z0-9\-._~%]+|\[[a-f0-9:.]+\]|\[v[a-f0-9][a-z0-9\-._~%!$&'()*+,;=:]+\])", " ".join(links))
    hosts = list(set(hosts))  # list of unique hosts
    print("Hosts: ", hosts)

    print("Number of occurrences per host:")
    for host in hosts:
        count = len(re.findall(host, mystr))
        print("\t{}: {}".format(host, count))


    emails = re.findall('^(\w|\.|\_|\-)+[@](\w|\_|\-|\.)+[.]\w{2,3}$', mystr)
    print("Emails: ", emails)

    pictures = re.findall('<img[^>]*>', mystr)
    print("Pictures: ", pictures)


if __name__ == "__main__":
    main()

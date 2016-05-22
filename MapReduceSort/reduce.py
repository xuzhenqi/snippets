import sys


def sort(infile, outfile):
    f = open(infile)
    heights = []
    for l in f.readlines():
        l = l.strip().split()
        heights.append((l[0], float(l[1])))
    f.close()
    heights = sorted(heights, key=lambda h: h[1])
    f = open(outfile, 'w')
    for h in heights:
        f.write("%s %f\n" % (h[0], h[1]))
    f.close()

if __name__ == '__main__':
    infile = sys.argv[1]
    outfile = sys.argv[2]
    sort(infile, outfile)

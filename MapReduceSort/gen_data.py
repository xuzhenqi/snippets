import sys
import random


def gen_data(num, outfile):
    min_height = 50.
    max_height = 250.
    f = open(outfile, 'w')
    for i in range(num):
        f.write("%d %f\n" % (i, random.uniform(min_height, max_height)))
        if i % 10000 == 0:
            print "processing (%d/%d) nums" % (i, num)
    f.close()

if __name__ == '__main__':
    num = int(sys.argv[1])
    outfile = sys.argv[2]
    gen_data(num, outfile)

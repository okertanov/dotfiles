import sys, os

if len(sys.argv) > 1:
    topdir = sys.argv[1]
else:
    topdir = '.'

def every_file(topdir, extensions):
    filelist = []
    def step(ext, dirname, names):
        ext = map(lambda x:x.lower(), ext)
        for name in names:
            if len(filter(lambda e:name.lower().endswith(e), ext)):
                png = os.path.join(dirname, name)
                filelist.append(png)
    os.path.walk(topdir, step, extensions)
    return filelist

def find_in_file(haystack, needle):
    try:
        with open(haystack) as data:
            return any(needlet in line for line in data)
    except:
        pass

def find_in_files(haystacks, needle):
    for haystack in haystacks:
        if find_in_file(haystack, needle):
            return True
    return False

pngs = every_file(topdir, ['.png', '.jpg'])
files = every_file(topdir, ['.xib', '.m', '.h', '.cs'])

for png in pngs:
    if not find_in_files(files, os.path.basename(png)):
        print 'Not found: ', png

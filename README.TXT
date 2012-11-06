Bad news: this project was developed in linux (i could not find mac yet)
It was tested in fedora 14.

Required packages are: gcc-objc and gnustep-* packages.

BUILD:
run 'make' to build binary file main.exe (it is not a windows binary)
There should be lot of wornings, but the binary is built as a result.

RUN:
run 'make run' to execute it wiz correct TZ value and see the output.

Files description:
main.m : Program itself
cell.m/cell.h: initial cell class with hammingDistance method.
nitrobase.m/nitrobase.h: nitrobases are parts of which DNA consists.  A,T,G,C are nitrobases.
mutate.h/mutate.m: extentions for cell and nitrobase classes, provides mutate method.
shuffle.m/shuffle.h: extention for NSMutableArray, used to generate random indexes for mutate method.

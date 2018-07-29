Z80 (UNIX Fork)
===============

~~~
______________  ___   _________                     __                                     ________  
\____    /\   \/  /  /   _____/_____   ____   _____/  |________ __ __  _____       .__     \_____  \ 
  /     /  \     /   \_____  \\____ \_/ __ \_/ ___\   __\_  __ \  |  \/     \    __|  |___   _(__  < 
 /     /_  /     \   /        \  |_> >  ___/\  \___|  |  |  | \/  |  /  Y Y  \  /__    __/  /       \
/_______ \/___/\  \ /_______  /   __/ \___  >\___  >__|  |__|  |____/|__|_|  /     |__|    /______  /
        \/      \_/         \/|__|        \/     \/                        \/                     \/ 
~~~

This repository contains various code snippets, examples, and tutorials for Z80 assembly language.

Code in this repository is mainly written for ZX Spectrum machines. For information on how to 
install Z80 assembler and Spectrum emulators, please refer to INSTALL file.

Manifest
--------

    * tutorials/     Tutorials on how to program Z80 on Spectrum.
    * challenges/    Interesting problems/code challenges.
    * examples/      Z80 code examples.
    * utilities/     Some cool utilities like memory manager.

Credits
-------

The code under tutorials and challenges is created by Adrian Brown (adrian@apbcomputerservices.co.uk). His 
aim is to make it easy to follow the tutorials and the challenges. This fork makes his work usable on UNIX.
The repository contains code by John Young (polomint77), Adrian, and others.

How to Compile Code
-------------------

You can use the make file to compile any code example you want:

    $ make DIR=tutorials/part1/example3

Then use make emu to run the emulator:

    $ make DIR=tutorials/part1/example3 emu

Please note that you can skip the first command, as "make emu" makes sure that all binaries are compiled 
and updated before running the emulator. Binary files are generated under build/tutorials/part1/example3 
subtree.

Have fun!

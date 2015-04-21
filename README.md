This program reads a list of names from a file and prints a round-robin pairing schedule.
The name of the input file is specified as a command-line argument.

e.g.

    ruby roundrobin.rb input

Where "input" is a plain text file formatted like this:

    Ringo
    John
    Paul
    George

With one name per line.

The output will be in two sections. The first section gives an overall schedule of all the pairs for each round. The second section
gives the schedule from an individuals perspective, showing who the individual will be paired up with for each round.
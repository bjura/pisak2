#*Polish Integrative System of Alternative Communication*

PISAK is a program for people with severe impairments of muscle control that allows them to operate basic computer functionalities through binary (0-1) input.


# INSTALL

...on Linux the required dependencies can be installed by running:

sudo apt-get install git python3-pip python3-pyqt5 python3-pyqt5.qtmultimedia python3-pyqt5.qtquick qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin

...on Windows the prerequisite is the python package manager (pip) and Git program to be installed in the system. When it is satisfied, run:

pip3 install PyQt5

Then, on both systems, to download and install PISAK:

git clone https://github.com/bjura/pisak2.git

cd pisak2

pip3 install -e .


# HOW TO RUN

## SPELLER

Speller is an application that allows users to write their own text, it provides virtual keyboard with various char sets and word prediction.

In order to run speller application, navigate to the main PISAK directory (where this file is located) and type in the command line the following:

python3 scripts/main.py apps/speller/Speller.qml

## SYMBOLER

Application for communication with the use of different kinds of symbols or pictograms (like Bliss, Sclera etc) - any arbitrary set of labeled pictures can be used to compose a visual message.

To run symboler:

python3 scripts/main.py apps/symboler/Symboler.qml

## ... and others

There are drafts or basic classes for other apllications in the 'apps' folder but work on them is still in progress. However their GUIs can be launched in a similar fashion to the above ones with a similar naming convention, for example: apps/moviePlayer/MoviePlayer.qml


# CREDITS

<div>Some of the icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>

Kelson Sans font from http://fontfabric.com/kelson-sans


Work has been done as a project for the *Google Summer of Code 2016*

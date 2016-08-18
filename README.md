#*Polish Integrative System of Alternative Communication*

PISAK is a program for people with severe impairments of muscle control that allows them to operate basic computer functionalities through binary (0-1) input.


# INSTALL

PISAK is the python3 program so having python in version equal to/higher than 3.5 installed in the system is the fundamental prerequisite. Further installation instructions depend on the system.

...on Linux the required dependencies can be installed by running:

sudo apt-get install git python3-pip python3-pyqt5 python3-pyqt5.qtmultimedia python3-pyqt5.qtquick qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin

...on Windows the prerequisite is the python package manager (pip) and Git program to be installed in the system. When it is satisfied, run:

pip3 install PyQt5

Then, on both systems, to download and install PISAK:

git clone https://github.com/bjura/pisak2.git

cd pisak2

pip3 install -e .

...and then it should work (almost 100% sure at least on Ubuntu 16.04, which is, by the way, recommended).


## RELEASE

Release v1.0, also as a debian package, can be downloaded from here https://github.com/bjura/pisak2/releases/tag/v1.0


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


# ARCHITECTURE AND FURTHER DEVELOPMENT

Repository tree consists of four main subfolders: 'scripts' that currently contains main python script for running the whole program, 'doc' that contains configuration file and script that can generate HTML-formatted documentation of the project, 'apps' that contains subdirectories with different applications implemented using PISAK infrastructure and 'pisak' that contains the core PISAK library.

PISAK is almost all about GUI and in order to create a modern, dynamic user experience it uses Qt-based QML framework. PISAK defines its custom visual components, each in a single QML file. General purpose widgets or base classes are stored and sorted according to a category they belong to in various subfolders in the 'pisak'. 'pisak' includes also other ingredients that can be used to construct an infrastructure of any custom application. There is 'res' that contains various general resources, like icons, sounds etc. 'scanning' contains implementation of the scanning system, that is kind of a middle layer and the primary way of user interaction with the program. Basically it highlights visual elements on the screen with a constant time interval, allowing user to select what he or she wants using only some binary input device (like single mouse button, manual switch etc - in current version it detects spacebar strokes). In 'js' there are various JavaScript utils, currently only a custom version of the lodash library. In 'style' there are different style themes, constructed as JavaScript-powered files.

Each application in 'apps' consists mainly of the main file named just as the application folder but starting with an upper-case letter and QML files that define custom components, GUI and also non-GUI ones, specific for the given application. Any custom component always inherits from some base component from 'pisak'.

As mentioned above in the *how to run* section, some of the applications need further work to be done to get them look and work as they should. Some components are already prepared and they only need to be put together and given some finishing touches. Among other general features that either requires some improvements or are yet to be implemented one can list, for example, translations or other input devices handling, including some free-choice based ones like eyetracking.


# CREDITS

<div>Some of the icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>

Kelson Sans font from http://fontfabric.com/kelson-sans


Work has been done as a project for the *Google Summer of Code 2016*

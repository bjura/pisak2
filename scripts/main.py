#!/usr/bin/env python3


def run():
    import sys
    import os.path

    import pisak
    from pisak.application import Application

    from PyQt5.QtWidgets import QApplication

    # to be able to close the app from terminal with
    # ctr+c we have to do the following:
    import signal
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    # ------------------------------------------

    def usage():
        """
        Prints how to use this script.
        """
        print('Can be supplied with a path to some QML script containing a GUI definition.')

    gui = sys.argv[1] if (len(sys.argv) == 2 and os.path.isfile(sys.argv[1])) else \
        os.path.join(pisak.PATH, 'main.qml')
    app = Application(gui)
    app.run()


if __name__ == '__main__':
    run()

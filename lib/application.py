import sys

from PyQt5.QtCore import QSettings
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine

from . import dirs


class Application:

    ORGANIZATION = 'PISAK'
    NAME = 'PISAK'

    SETTINGS = dirs.SETTINGS

    def __init__(self, gui):
        self._app = QApplication(sys.argv)
        self._app.setOrganizationName(self.ORGANIZATION)
        self._app.setApplicationName(self.NAME)

        self._engine = QQmlApplicationEngine(gui)
        settings = QSettings(self.SETTINGS, QSettings.IniFormat)
        self._engine.rootContext().setContextProperty("globalSettings", settings)

    def run(self):
        sys.exit(self._app.exec_())

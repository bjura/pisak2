import sys
import os
import shutil

from PyQt5.QtCore import QSettings, QObject, pyqtProperty, QStandardPaths
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine

from .resources import Resources
from .settings import Settings
from .res import getRes


class _ApplicationContext(QObject):

    def __init__(self, parent=None):
        super().__init__(parent)
        self._resources = Resources()
        self._settings = Settings()

    @pyqtProperty(QObject, constant=True)
    def settings(self):
        return self._settings

    @pyqtProperty(QObject, constant=True)
    def resources(self):
        return self._resources


class Application:

    organization = 'pisak'

    name = 'pisak'

    def __init__(self, gui):
        self._setupEnv()
        self._app = QApplication(sys.argv)
        self._app.setOrganizationName(self.organization)
        self._app.setApplicationName(self.name)

        self._registerTypes()

        self._context = _ApplicationContext()

        self._engine = QQmlApplicationEngine()
        self._engine.rootContext().setContextProperty('pisak', self._context)
        self._engine.load(gui)

    def run(self):
        sys.exit(self._app.exec_())

    def _registerTypes(self):
        from .prediction import predictor
        predictor.registerTypes()

    def _setupEnv(self):
        self._installFonts()

    def _installFonts(self):
        fontDirs = getRes('fonts')
        systemFontsDir = QStandardPaths.writableLocation(QStandardPaths.FontsLocation)
        if not os.path.exists(systemFontsDir):
            platform = sys.platform
            if not (platform.startswith('linux') or platform.startswith('win')):
                return
            try:
                os.mkdir(systemFontsDir)
            except OSError as err:
                print(err)
                return
        for fontName in os.listdir(fontDirs):
            font = os.path.join(fontDirs, fontName)
            for fontFileName in os.listdir(font):
                fontFile = os.path.join(font, fontFileName)
                targetFile = os.path.join(systemFontsDir, fontFileName)
                if not os.path.exists(targetFile):
                    try:
                        shutil.copy2(fontFile, targetFile)
                    except OSError as err:
                        print(err)

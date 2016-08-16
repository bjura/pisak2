import os.path

from PyQt5.QtCore import QObject, QStandardPaths, QDir, pyqtSlot, pyqtProperty

from .res import getRes


class Resources(QObject):

    appDataDir = QStandardPaths.writableLocation(QStandardPaths.AppDataLocation)

    soundFileExt = '.wav'

    iconFileExt  = '.svg'

    homeAppDir = os.path.join(QStandardPaths.standardLocations(QStandardPaths.HomeLocation)[0], '.pisak')

    @pyqtSlot(str, result=str)
    def getSoundPath(self, soundName):
        soundFile = soundName + self.soundFileExt
        path = os.path.join(self.appDataDir, soundFile)
        if not os.path.exists(path):
            path = getRes(os.path.join('sounds', soundFile))
        return path

    @pyqtSlot(str, result=str)
    def getIconPath(self, iconName):
        iconFile = iconName + self.iconFileExt
        return getRes(os.path.join('icons', iconFile))

    @pyqtSlot(str, result=str)
    def getResource(self, item):
        return getRes(item)

    @pyqtProperty(str, constant=True)
    def symbolsFolder(self):
        return getRes('symbols')

    @pyqtProperty(str, constant=True)
    def moviesDir(self):
        return QStandardPaths.standardLocations(QStandardPaths.MoviesLocation)[0]

    @pyqtProperty(str, constant=True)
    def musicDir(self):
        return QStandardPaths.standardLocations(QStandardPaths.MusicLocation)[0]

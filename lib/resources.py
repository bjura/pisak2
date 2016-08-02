import os.path

from PyQt5.QtCore import QObject, QStandardPaths, QDir, pyqtSlot, pyqtProperty


class Resources(QObject):

    resDir = os.path.abspath('res')

    appDataDir = QStandardPaths.writableLocation(QStandardPaths.AppDataLocation)

    soundFileExt = '.wav'

    iconFileExt  = '.svg'

    @pyqtSlot(str, result=str)
    def getSoundPath(self, soundName):
        soundFile = soundName + self.soundFileExt
        path = os.path.join(self.appDataDir, soundFile)
        if not os.path.exists(path):
            path = os.path.join(self.resDir, 'sounds', soundFile)
        return path

    @pyqtSlot(str, result=str)
    def getIconPath(self, iconName):
        iconFile = iconName + self.iconFileExt
        return os.path.join(self.resDir, 'icons', iconFile)

    @pyqtProperty(str, constant=True)
    def symbolsFolder(self):
        return os.path.join(QStandardPaths.standardLocations(QStandardPaths.AppDataLocation)[0],
                            'symbols')

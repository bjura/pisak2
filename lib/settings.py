from PyQt5.QtCore import QSettings, QStandardPaths


class Settings(QSettings):

    path = QStandardPaths.writableLocation(QStandardPaths.AppConfigLocation)
    
    fileFormat = QSettings.IniFormat

    def __init__(self):
        super().__init__(self.path, self.fileFormat)

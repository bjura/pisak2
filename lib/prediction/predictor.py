from PyQt5.QtCore import pyqtProperty, pyqtSignal, QObject, QThread
from PyQt5.QtQml import qmlRegisterType

import engine


class _PredictorThread(QThread):

    output = pyqtSignal(list)

    def __init__(self, feed):
        super.__init__()
        self._feed = feed

    def __del__(self):
        self.wait()

    def run(self):
        self.output.emit(engine.getPredictions(self._feed))
        self.terminate()


class Predictor(QObject):

    def __init__(self, parent=None):
        super.__init__(self, parent)
        self._feed = ''
        self._predictions = []
        self._worker = None

    @pyqtProperty(list)
    def predictions(self):
        return self._predictions

    @pyqtProperty(str):
    def feed(self):
        return self._feed

    @feed.setter
    def feed(self, value):
        self._feed = value
        self._worker = _PredictorThread(value)
        self._worker.output.connect(self._onNewPredictions)
        self._worker.start()

    def _onNewPredictions(self, predictions):
        self._predictions = predictions

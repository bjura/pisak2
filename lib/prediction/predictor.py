import re

from PyQt5.QtCore import pyqtProperty, pyqtSignal, pyqtSlot, QObject, QThread
from PyQt5.QtQml import qmlRegisterType

from .engine import getPredictions


class _PredictorThread(QThread):

    output = pyqtSignal(str)

    def __init__(self, feed):
        super().__init__()
        self._feed = feed

    def __del__(self):
        self.wait()

    def run(self):
        self.output.emit(','.join(getPredictions(self._feed)))


class Predictor(QObject):

    predictionsChanged = pyqtSignal(str)

    defaultContent = 'tak,nie,cześć,przepraszam,gdzie,lubię,ja,ty'

    lastContextSrc = '''
        \s*  # greedy leading whitespace
        ([A-Zążźćśłóęń]*\s*[A-Zążźćśłóęń]*\s*[A-Zążźćśłóęń]*\s*)  # a series of none to three words
        \s*  # greedy trailing whitespace
        $  # end of text
    '''
    lastContext = re.compile(lastContextSrc, re.VERBOSE|re.IGNORECASE)

    exceptionChars = '''1 2 3 4 5 6 7 8 9 0 . , ; ? ! : ' " - = + _ ( ) [ ] < > / \ | & @ % *'''.split()

    automaticSpace = True

    def __init__(self, parent=None):
        super().__init__(parent)
        self._feed = ''
        self._worker = None
        self.predictions = self.defaultContent

    @pyqtSlot(str, str, result=str)
    def applyPrediction(self, text, supplied):
        if self.automaticSpace:
                supplied += ' '
        if text:
            if text[-1] in self.exceptionChars:
                newText = text + ' ' + supplied
            elif text[-1] == ' ':
                newText = text + supplied
            else:
                strippedText = text.rstrip(' ')
                startPos = max(strippedText.rfind(' '),
                                strippedText.rfind('\n')) + 1
                newText = text[ : startPos] + supplied
        else:
            newText = supplied
        return newText

    @pyqtProperty(str)
    def predictions(self):
        return self._predictions

    @predictions.setter
    def predictions(self, value):
        self._predictions = value
        self.predictionsChanged.emit(value)

    @pyqtProperty(str)
    def feed(self):
        return self._feed

    @feed.setter
    def feed(self, value):
        self._feed = value
        self._doPrediction(value)

    def _onNewPredictions(self, predictions):
        self.predictions = predictions

    def _getPredictionContext(self, text):
        context = self.lastContext.search(text)
        if context:
            return context.group(1)

    def _doPrediction(self, text):
        if self._worker is not None:
            self._worker.output.disconnect(self._onNewPredictions)
            self._worker = None

        context = self._getPredictionContext(text)
        if len(text) == 0 or not context:
            self._onNewPredictions(self.defaultContent)
        else:
            self._worker = _PredictorThread(context)
            self._worker.output.connect(self._onNewPredictions)
            self._worker.start()


def registerTypes():
    qmlRegisterType(Predictor, 'Pisak', 1, 0, 'PisakPredictor')

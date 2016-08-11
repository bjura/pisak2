"""A setuptools based setup module.
"""
import os
import urllib.request
from setuptools import setup, find_packages

# ---- Prediction database download ----
loc_file = os.path.join('res', 'n_grams.sqlite')

if not os.path.isfile(loc_file):
    def dlProgress(count, blockSize, totalSize):
        percent = str(int(100*count*blockSize / totalSize))
        print("\r Downloading " + rem_file + "... {}%".format(percent))

    rem_file = 'http://download.pisak.org/n_grams.sqlite'
    urllib.request.urlretrieve(rem_file, loc_file, reporthook=dlProgress)
# -------------------------------------

setup(
    name='pisak',
    description='Polish Integrating System of Alternative Communication',
    version='1.0',
    author='Bartosz Jura',
    author_email='barbartekjura@gmail.com',
    install_requires=[
        'pressagio',
        # 'PyQt5'
    ],
    packages=find_packages(exclude=['doc']),
    include_package_data=True,
    exclude_package_data={'': ['.gitignore', '.ci.yml'],
                            },
    scripts=['main.py'],
    entry_points={
              'gui_scripts': [
                  'pisak = main:run'
              ]
        }
)

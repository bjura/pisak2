"""A setuptools based setup module.

See:
https://packaging.python.org/en/latest/distributing.html
"""
import os
import urllib.request
from setuptools import setup, find_packages

rem_file = 'http://download.pisak.org/n_grams.sqlite'
loc_file = os.path.join('res', 'n_grams.sqlite')

def dlProgress(count, blockSize, totalSize):
      percent = str(int(100*count*blockSize/totalSize))
      print("\r Downloading " + rem_file + "... {}%".format(percent))

urllib.request.urlretrieve(rem_file, loc_file, reporthook=dlProgress)

setup(
    name='pisak',
    description='Polish Integrating System of Alternative Communication',
    version='1.0',
    author='Bartosz Jura',
    author_email='barbartekjura@gmail.com',
    install_requires=[
        'PyQt5',
        'pressagio'
    ],
    packages=find_packages(exclude=['doc']),
    include_package_data=True,
    exclude_package_data={'': ['.gitignore'],
                            },
    scripts=['pisak.py']
)

#   -*- coding: utf-8 -*-
from pybuilder.core import Author, use_plugin, init

use_plugin("python.core")
use_plugin("python.unittest")
use_plugin("python.flake8")
use_plugin("python.distutils")
use_plugin('python.install_dependencies')

name = "bookstore"
authors = [
    Author('Mahen Gandhi', 'mahengandhi19@gmail.com'),
    Author('Ayan Kashyap', 'ayankashyap8@gmail.com'),
    Author('Yugandhar Desai', 'yugandhar.d.desai@gmail.com')
]
license = 'MIT License'
default_task = ['install_dependencies', 'analyze', 'publish']
version = '0.1'


@init
def set_properties(project):
    project.depends_on('flask')

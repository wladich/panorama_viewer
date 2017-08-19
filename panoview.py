# coding: utf-8
from bottle import route, run, template, static_file
import sys
import os

workdir = None

def list_pano_files():
    for fname in os.listdir(workdir):
        if os.path.isfile(os.path.join(workdir, fname)) and os.path.splitext(fname)[1].lower() == '.jpg':
            yield fname

@route('/')
def index():
    filenames = sorted(list_pano_files())
    return template('index', files=filenames)

def get_project_dir():
    return os.path.abspath(os.path.dirname(__file__))


@route('/pannellum.htm')
def panellum():
    return static_file('pannellum.htm', os.path.join(get_project_dir(), 'views'))

@route('/panos/<filename>')
def pano_file(filename):
    print filename
    return static_file(filename, workdir)

if len(sys.argv) > 1:
    workdir = sys.argv[1]
else:
    workdir = '.'


run(host='localhost', port=8080, debug=True, reloader=True)
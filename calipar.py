from flask import Flask
from flask import request
from flask import abort
from subprocess import Popen
from subprocess import PIPE

app = Flask(__name__)

@app.route("/general")
def general():
  url = request.args.get('url', None)
  param = request.args.get('param', None)
  if url is None or param is None:
    abort(404)
  #mediainfo --Inform="Video;%DisplayAspectRatio%" foo.mkv
  args=('mediainfo', '--Inform=General;%' + param + '%', url)
  proc = Popen(args, stdout = PIPE)
  proc.wait()
  return proc.stdout.read().decode('UTF-8').strip()

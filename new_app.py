from flask import Flask

app = Flask("bb_hardware")
app.config.from_object('settings')

import views
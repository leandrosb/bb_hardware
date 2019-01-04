from flask import Flask

def create_app(config_env_var='FLASK_CONFIG'):
    app = Flask(__name__)
    app.config.from_envvar(config_env_var, silent=False)
    return app
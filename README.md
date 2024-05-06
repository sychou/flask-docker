# Flask Docker Skeleton

This is a simple skeleton for a Flask app that can be run in a Docker container
or deployed to fly.io. I'll be adding Docker Swarm soon as well.

## Usage

To run the app:

```sh
docker build -t flask-docker .
docker run -p 80:80 flask-docker
```

To mount the local directory so that you don't have to keep building. When you
make changes to the code, the server will automatically reload. This should
only be used for development.

```sh
docker build -t flask-docker .
docker run -p 80:80 -v $(pwd):/app flask-docker
```

To run locally:

```sh
flask run reload
# or
gunicorn app:app
```

If you want to have a local venv (if nothing else, for the IDE to be able to
detect dependent imports):

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

To deploy to fly:

```sh
# Be sure to build the latest docker
docker build -t flask-docker .

# To deploy
fly deploy

# To open url
fly apps open

# To check status
fly status
```

To delete the instance:

```sh
fly apps list
fly apps destroy [app-name]
```

## TODO

- Use gunicorn instead of flask's built-in server

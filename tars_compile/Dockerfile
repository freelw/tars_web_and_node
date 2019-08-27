FROM freelw/tars_web_develop:latest

RUN apt-get install make
RUN export NVM_DIR="/root/.nvm" \
        && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
	&& nvm install v8.10.0 \
	&& npm i -g @tars/deploy


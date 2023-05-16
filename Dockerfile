FROM ruby:3.1.0

WORKDIR /usr/src/app

COPY . .

# I copied this from https://medium.com/@alieckaja/how-to-start-your-rails-app-in-a-docker-container-9f9ce29ff6d6
# trying to get yarn & node.js to get webpacker working 
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn


RUN bundle install


# I copied this from https://medium.com/@alieckaja/how-to-start-your-rails-app-in-a-docker-container-9f9ce29ff6d6
# trying to get yarn & node.js to get webpacker working 
RUN yarn install
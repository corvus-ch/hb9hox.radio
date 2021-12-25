FROM jekyll/jekyll:4

ADD Gemfile* /srv/jekyll/

RUN bundle install

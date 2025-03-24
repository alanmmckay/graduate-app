FROM amckay2/ruby-2.6.6:manjaro-rbenv

RUN rm /etc/pacman.conf

RUN cp /etc/pacman.conf.pacnew /etc/pacman.conf

RUN pacman -Syu libyaml --noconfirm #To allow parsing of Gemfile

RUN pacman -Syu base-devel --noconfirm #To install racc, natively

RUN pacman -Syu nodejs --noconfirm #To allow rake db operations

COPY source/ /home/gradapp/app

WORKDIR /home/gradapp/app

RUN bundle install --without production

RUN rake db:migrate

EXPOSE 3000

CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0", "-p", "3000"]

#docker run -p 3000:3000 graduate-app

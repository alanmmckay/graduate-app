# Ruby on Rails - Graduate Application Portal

Development Team: Zachary Althof, Max Barten, Cole Garton, Alan McKay, Thomas Pawlowski

A Ruby on Rails web-app for a graduate application portal. This portal allows individuals to apply for graduate school, relations to these individuals to submit recommendation letters, and faculty to review and accept applicants.

## How to use the web-app

The `source` subfolder of the root of this repository contains the source code for the Ruby on Rails app. The `Gemfile` describes the components required to run the app within the Rails environment, where running `bundle install` within the subfolder will install the required dependencies assuming
Ruby version 2.6.6 is in place along `bundle` and both their respective dependencies.

The root of this repository also contains a Dockerfile which allows one to run a containerized version of the app. This Dockerfile allows one to view the project's dependencies outside the context of the Rails environment. What's notable here is the sourcing of `amckay2/ruby-2.6.6:manjaro-rbenv` hosted on DockerHub via the [amckay2/ruby-2.6.6](https://hub.docker.com/r/amckay2/ruby-2.6.6) repository. This image uses the arch-based Manjaro to setup the rails environment using `rbenv`.

To build this image and run the container, clone this repo and change directory to the root of the repository. Run `docker build -t graduate-app .` and then run `docker run -p 3000:3000 graduate-app` which allows one to view the web-app in their web browser by visiting `http://localhost:3000`. Default login credentials are located within `source/db/seeds.rb`. Take note of the faculty information which is as follows:

- `email: facultytestselt2022@gmail.com; password: password1234;`
- `email: facultytest2selt2022@test.com; password: password1234;`

## Feature tour of the web-app

\-WIP: will be completed by 03/25/25. Check back after this date.

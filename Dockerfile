# this same shows how we can extend/change an existing official image from Docker Hub

FROM nginx:latest
# highly recommend you always pin versions for anything beyond dev/learn

WORKDIR /usr/share/nginx/html
# change working directory to root of nginx webhost
# using WORKDIR is prefered to using 'RUN cd /some/path'
#Install GIT
#RUN apt-get update && apt-get install -y git
#RUN apt-get update && apt-get install -y curl
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg
#RUN apt-key add -echo "deb https://dl.yarnpkg.com/debian/ stable main"
#RUN tee /etc/apt/sources.list.d/yarn.list

#RUN apt-get update && apt-get install -y node && apt-get install -y yarn

#RUN yarn

COPY ./dist ./

#Grab the latest commit from the master branch
#RUN git clone https://github.com/althe3rd/UW-Vue-Proj.git && rm -rf index.html && cp -R UW-Vue-Proj/dist/. ./
#RUN ls -la /*

#COPY ./UW-Vue-Proj ./
# I don't have to specify EXPOSE or CMD because they're in my FROM

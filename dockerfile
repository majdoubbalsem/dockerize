FROM node:14
workdir Devops
RUN apt-get update
COPY . .
RUN npm install
CMD ["node","app.js"]
Expose 3005

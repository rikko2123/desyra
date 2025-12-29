FROM node:22-alpine

WORKDIR /front_end_desyra

COPY package*.json .

RUN npm install 

EXPOSE 5173 

CMD ["npm", "run", "dev", "--host", "0.0.0.0"]


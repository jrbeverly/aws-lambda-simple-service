FROM node:12

COPY server/ /workspace
COPY app/ /app
WORKDIR /workspace/
RUN npm i

EXPOSE 3000
CMD npm run start
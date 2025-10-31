#From node:22-alpine
#WORKDIR /app
#COPY . .
#RUN npm install
#EXPOSE 5173
#ENTRYPOINT ["npm", "run", "dev", "--", "--host"]

# --- build stage ---
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# If your build needs an API URL at build time, keep ARG/ENV. Else remove them.
ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL
RUN npm run build

# --- runtime stage ---
FROM nginx:1.27-alpine
RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80



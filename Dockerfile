# Step1: Build Phase. as <phase-name>
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Step2: Deploy Phase
FROM nginx
# COPY from above phase these folder :to: current this path
COPY --from=builder /app/build /usr/share/nginx/html
FROM node:latest

# Set working directory
WORKDIR /root/bot

# Install necessary packages
RUN apt-get update && \
  apt-get install -y \
  python3 \
  python-is-python3 \
  coreutils \
  dos2unix \
  zip \
  tesseract-ocr \
  imagemagick \
  tree \
  webp \
  unzip \
  curl \
  wget \
  libsox-fmt-all \
  sox \
  neofetch \
  build-essential \
  libcairo2-dev \
  libpango1.0-dev \
  libjpeg-dev \
  libgif-dev \
  librsvg2-dev \
  ffmpeg \
  figlet \
  toilet \
  chromium \
  net-tools \
  golang-go \
  nmap \
  screen 

# Install global npm packages
RUN npm install -g npm pnpm pm2 nodemon ts-node

# Copy application code
COPY . .

# Install application dependencies
RUN pnpm install

# Expose the port the app runs on
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306

# Start the application
CMD ["pm2-runtime", "start", "index.js"]

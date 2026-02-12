FROM jenkins/jenkins:lts
USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io curl ca-certificates gnupg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Node.js 18 + npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Firebase CLI globally
RUN npm install -g firebase-tools

# (Optional but helpful) add jenkins to docker group
RUN groupadd -f docker && usermod -aG docker jenkins

USER jenkins

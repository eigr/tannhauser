FROM ubuntu:22.04
RUN apt-get update && apt-get install -y git gcc make python3
WORKDIR /tannhauser
COPY . .
CMD ["scripts/build.sh"]
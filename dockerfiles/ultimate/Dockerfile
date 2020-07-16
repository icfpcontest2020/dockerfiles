FROM icfpcontest2020/ultimate:latest

WORKDIR /source

COPY . .

# build.sh might generate `run.sh`
RUN /bin/bash /source/build.sh

# Use /bin/bash to avoid issues with +x
ENTRYPOINT ["/bin/bash", "/source/run.sh"]

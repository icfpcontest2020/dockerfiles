FROM icfpcontest2020/factor

WORKDIR /solution
COPY . .
RUN gchmod +x ./build.sh
RUN gchmod +x ./run.sh
RUN ./build.sh
ENTRYPOINT ["./run.sh"]

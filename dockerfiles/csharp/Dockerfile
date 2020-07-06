FROM icfpcontest2020/csharp

WORKDIR /solution
COPY . .
RUN ./build.sh
ENTRYPOINT ["./run.sh"]
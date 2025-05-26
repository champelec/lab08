## Laboratory work VIII

Данная лабораторная работа посвещена изучению систем автоматизации развёртывания и управления приложениями на примере **Docker**

```sh
$ open https://docs.docker.com/get-started/
```

## Tasks

- [ ] 1. Создать публичный репозиторий с названием **lab08** на сервисе **GitHub**
- [ ] 2. Ознакомиться со ссылками учебного материала
- [ ] 3. Выполнить инструкцию учебного материала
- [ ] 4. Составить отчет и отправить ссылку личным сообщением в **Slack**

## Tutorial

```sh
$ export GITHUB_USERNAME=<имя_пользователя>
```

```
$ cd ${GITHUB_USERNAME}/workspace
$ pushd .
$ source scripts/activate
```

```sh
$ git clone https://github.com/${GITHUB_USERNAME}/lab07 lab08
$ cd lab08
$ git submodule update --init
$ git remote remove origin
$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab08
```

```sh
$ cat > Dockerfile <<EOF
FROM ubuntu:18.04
EOF
```

```sh
$ cat >> Dockerfile <<EOF

RUN apt update
RUN apt install -yy gcc g++ cmake
EOF
```

```sh
$ cat >> Dockerfile <<EOF

COPY . print/
WORKDIR print
EOF
```

```sh
$ cat >> Dockerfile <<EOF

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
EOF
```

```sh
$ cat >> Dockerfile <<EOF

ENV LOG_PATH /home/logs/log.txt
EOF
```

```sh
$ cat >> Dockerfile <<EOF

VOLUME /home/logs
EOF
```

```sh
$ cat >> Dockerfile <<EOF

WORKDIR _install/bin
EOF
```

```sh
$ cat >> Dockerfile <<EOF

ENTRYPOINT ./demo
EOF
```

```sh
$ docker build -t logger .
```

```sh
$ docker images
```

```sh
$ mkdir logs
$ docker run -it -v "$(pwd)/logs/:/home/logs/" logger
text1
text2
text3
<C-D>
```

```sh
$ docker inspect logger
```

```sh
$ cat logs/log.txt
```

```sh
$ gsed -i 's/lab07/lab08/g' README.md
```

```sh
$ vim .travis.yml
/lang<CR>o
services:
- docker<ESC>
jVGdo
script:
- docker build -t logger .<ESC>
:wq
```

```sh
$ git add Dockerfile
$ git add .travis.yml
$ git commit -m"adding Dockerfile"
$ git push origin master
```

```sh
$ travis login --auto
$ travis enable
```

## Report

```sh
$ popd
$ export LAB_NUMBER=08
$ git clone https://github.com/tp-labs/lab${LAB_NUMBER} tasks/lab${LAB_NUMBER}
$ mkdir reports/lab${LAB_NUMBER}
$ cp tasks/lab${LAB_NUMBER}/README.md reports/lab${LAB_NUMBER}/REPORT.md
$ cd reports/lab${LAB_NUMBER}
$ edit REPORT.md
$ gist REPORT.md
```

##Homework
```
$ sudo docker build -t logger .
[+] Building 49.7s (14/14) FINISHED                      docker:default
 => [internal] load build definition from Dockerfile               0.0s
 => => transferring dockerfile: 424B                               0.0s 
 => [internal] load metadata for docker.io/library/ubuntu:18.04    2.0s 
 => [internal] load .dockerignore                                  0.0s
 => => transferring context: 2B                                    0.0s 
 => [1/9] FROM docker.io/library/ubuntu:18.04@sha256:152dc042452  11.9s 
 => => resolve docker.io/library/ubuntu:18.04@sha256:152dc042452c  0.0s
 => => sha256:152dc042452c496007f07ca9127571cb9c2 1.33kB / 1.33kB  0.0s 
 => => sha256:f97a5103cca28097326814718e711c9c41b5485 424B / 424B  0.0s 
 => => sha256:d1a528908992e9b5bcff8329a22de174900 2.31kB / 2.31kB  0.0s 
 => => sha256:064a9bb4736de1b2446f528e4eb37335 22.71MB / 22.71MB  11.0s 
 => => extracting sha256:064a9bb4736de1b2446f528e4eb37335378392cf  0.8s
 => [internal] load build context                                  0.0s 
 => => transferring context: 2.99MB                                0.0s 
 => [2/9] RUN apt update                                           9.5s 
 => [3/9] RUN apt  install -yy gcc g++ cmake                      24.5s 
 => [4/9] COPY . /solver_application                               0.0s 
 => [5/9] WORKDIR /solver_application                              0.0s 
 => [6/9] RUN cmake -H. -B_build -DDCMAKE_BUILD_TYPE=Release -DCM  0.5s 
 => [7/9] RUN cmake --build _build                                 0.4s 
 => [8/9] RUN cmake --build _build --target install                0.2s 
 => [9/9] WORKDIR /solver_application/_build/                      0.1s 
 => exporting to image                                             0.4s 
 => => exporting layers                                            0.4s 
 => => writing image sha256:dcc0dde9272a208faa841ca3367c80832928f  0.0s 
 => => naming to docker.io/library/logger                          0.0s 
```
## Links

- [Book](https://www.dockerbook.com)
- [Instructions](https://docs.docker.com/engine/reference/builder/)

```
Copyright (c) 2015-2021 The ISC Authors
```

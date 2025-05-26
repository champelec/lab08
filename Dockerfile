FROM ubuntu:18.04

# Установка зависимостей
RUN apt update && apt install -y \
    gcc g++ cmake make

# Копируем исходники
COPY . /solver_application
WORKDIR /solver_application

# Генерация CMake-проектов и сборка
RUN cmake -S. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install && \
    cmake --build _build && \
    cmake --install _build

# Переменные и тома
ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

# Рабочая директория и запуск
WORKDIR /solver_application/_build
RUN chmod +x equation
ENTRYPOINT ["./equation"]


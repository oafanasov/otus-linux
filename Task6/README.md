## Сборка пакета rpm:
1.История установки пакетов:  
#yum history

1a.Проверка наличия пакета в ядре:  
#rpm -ql nginx

2.Подготовка директории для сборки:  
#rpmdev-setuptree

2a.Проверка директории:  
#tree -d -L 1 ~/rpmbuild

3.Установка исходников сорса:  
#yumdownloader --source nginx

4.Распаковка файлов пакета:  
#rpm -ihv <...>.src.rpm

5.Сборка пакета rpm:  
#rpmbuild -ba rpmbuild/SPECS/nginx.spec

6.Установка зависимостей:  
#yum-builddep nginx -y

7.Пересобираем пакет:  
#rpmbuild -ba rpmbuild/SPECS/nginx.spec

8.Проверка:  
#tree -L 3 rpmbuild/

9.Установка пакета:  
#rpm -i <...>


## Установка репозитория
1.Переход в директорию html (либо httpd, либо nginx):  
#cd /var/www/html

2.Создание репозитория:   
#createrepo .

## Сборка и запуск пакета через Docker
1.Создание Dockerfile:  

FROM ubuntu:18.04  
LABEL key="afanassov@yandex.ru"  

RUN apt-get clean && apt-get update && apt-get install -y nginx  

EXPOSE 80  

2.Создание Docker image:  
#sudo docker build -t oafanasov/task6:1.0 /home/vagrant

3.Запись в репозиторий DockerHub (либо создать свой):  
#sudo docker push afanasov/task6

4.Запуск контейнера:  
#sudo docker run -it afanasov/task6:1.0 [bash]


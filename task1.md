## **Задание 1 (пошаговый отчёт).**


#*скачал архив нового ядра*  
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.76.tar.xz

#*распаковал* 
tar -xvf linux-4.19.76.tar.xz -C /usr/src

#*установил инструменты для компиляции*  
yum groupinstall "Development Tools"

#*задал конфигурацию*  
make oldconfig

#*собрал ядро*  
make

#*установил модули*  
make modules_install



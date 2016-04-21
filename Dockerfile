###################################################################
# Dockerfile
#
# Software:         FASTX-Toolkit
# Versión del software: 0.0.14
# Descripción:      Este dockerfile sirve para instalar FASTX-toolkit a partir de una imagen de biodocker
# Sitio Web:        http://hannonlab.cshl.edu/fastx_toolkit/index.html
# Build Cmd:        docker build -t biodckr/fastxtools:0.0.14 .
# Run Cmd:          docker run -it biodckr/fastxtools /bin/bash
##################################################################
# Establecer la imagen de biodocker como base
FROM biodckr/biodocker

################## INICIO DE LA INSTALACIÓN ######################

# Cambiar el usuario a "root"
USER root

#Crea las variables ambientales necesarias para libgtextutils-0.7 y fastx_toolkit-0.0.14
ENV ZIP=libgtextutils-0.7.tar.gz
ENV URL="https://github.com/agordon/libgtextutils/releases/download/0.7/"
ENV FOLDER=libgtextutils-0.7
ENV DST=/home/
ENV ZIP2=fastx_toolkit-0.0.14.tar.bz2
ENV URL2="https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/"
ENV FOLDER2=fastx_toolkit-0.0.14
ENV DST2=/home/

#Descarga y compila libgtextutils-0.7 y fastx_toolkit-0.0.14
RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar -xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf $DST/$FOLDER && \
  wget $URL2/$ZIP2 -O $DST2/$ZIP2 && \
  tar -xvf $DST2/$ZIP2 -C $DST2 && \
  rm $DST2/$ZIP2 && \
  cd $DST2/$FOLDER2 && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf $DST2/$FOLDER2

#Cambiar usuario a biodocker
USER biodocker

#####################FIN DE LA INSTALACIÓN###############################
MAINTAINER Gustavo Ibrahim Giles Pérez <tavoibrahim@gmail.com>

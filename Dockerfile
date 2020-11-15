# ARG BASE_CONTAINER=jupyter/all-spark-notebook
ARG BASE_CONTAINER=dream2globe/my-spark-env
FROM $BASE_CONTAINER

USER root

WORKDIR /usr/local

# ENV HADOOP_VERSION=3.2.0
# ENV METASTORE_VERSION=3.0.0

# ENV HADOOP_HOME=/usr/local/hadoop-${HADOOP_VERSION}
# ENV HIVE_HOME=/usr/local/apache-hive-metastore-${METASTORE_VERSION}-bin

# RUN curl -L https://www-us.apache.org/dist/hive/hive-standalone-metastore-${METASTORE_VERSION}/hive-standalone-metastore-${METASTORE_VERSION}-bin.tar.gz | tar zxf - && \
#     curl -L https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar zxf - && \
#     curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.20.tar.gz | tar zxf - && \
#     cp mysql-connector-java-8.0.20/mysql-connector-java-8.0.20.jar ${HIVE_HOME}/lib/ && \
#     cp mysql-connector-java-8.0.20/mysql-connector-java-8.0.20.jar /usr/local/spark/jars/. && \
#     rm -rf  mysql-connector-java-8.0.20

# RUN pip --no-cache-dir install \
# 	numpy \
# 	pandas \
# 	scikit-learn \
# 	xgboost \
# 	lightgbm \
# 	requests \
# 	seaborn 

# RUN echo 'c.NotebookApp.password="sha1:285c458cbb60:ac50e00375f1be469440b7487b0ebf13fd447af3"' >> ~/.jupyter/jupyter_notebook_config.py

# RUN cp /usr/local/spark/conf/spark-defaults.conf.template /usr/local/spark/conf/spark-defaults.conf \
# 	&& echo 'spark.driver.extraJavaOptions="-Dio.netty.tryReflectionSetAccessible=true"' >> /usr/local/spark/conf/spark-defaults.conf \
# 	&& echo 'spark.executor.extraJavaOptions="-Dio.netty.tryReflectionSetAccessible=true"' >> /usr/local/spark/conf/spark-defaults.conf

COPY conf/metastore-site.xml /usr/local/spark/conf
COPY conf/metastore-site.xml ${HIVE_HOME}/conf
COPY scripts/entrypoint.sh /entrypoint.sh

RUN chown root:root -R ${HIVE_HOME} && \
    chown root:root /entrypoint.sh && chmod +x /entrypoint.sh


EXPOSE 8888 4040 4041 4042 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]

from pyspark.sql import SparkSession

spark_session = SparkSession.builder.enableHiveSupport().getOrCreate

PATH = 'date/'
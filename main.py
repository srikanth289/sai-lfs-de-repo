from constants import PATH
from problem_two.generate_csv import Person

if __name__ == '__main__':
    write_raw_csv = Person.generate_csv(5)
    write_raw_csv.repartition(1).write.format('com.databricks.spark.csv').mode('overwrite').save(PATH + "persons_raw", header=True)



DROP TABLE IF EXISTS skin_cancer_stats;

CREATE TABLE skin_cancer_stats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  year INTEGER NOT NULL,
  data_type TEXT NOT NULL,
  count INTEGER NOT NULL,
  age_standardised_rate_2001_asp REAL NOT NULL,
  icd10_codes TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1982, 'Actual', 3538, 26.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1983, 'Actual', 3799, 28.1, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1984, 'Actual', 4044, 29.6, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1985, 'Actual', 4512, 32.1, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1986, 'Actual', 4709, 32.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1987, 'Actual', 5562, 37.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1988, 'Actual', 6019, 40.2, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1989, 'Actual', 5726, 37.4, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1990, 'Actual', 5838, 37.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1991, 'Actual', 5967, 37.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1992, 'Actual', 6566, 40.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1993, 'Actual', 6770, 41.3, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1994, 'Actual', 6950, 41.6, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1995, 'Actual', 7474, 43.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1996, 'Actual', 7839, 45.2, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1997, 'Actual', 8447, 47.6, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1998, 'Actual', 8000, 44.3, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (1999, 'Actual', 8397, 45.5, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2000, 'Actual', 8716, 46.2, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2001, 'Actual', 8997, 46.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2002, 'Actual', 9855, 50.1, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2003, 'Actual', 9604, 47.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2004, 'Actual', 9876, 48.2, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2005, 'Actual', 10828, 51.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2006, 'Actual', 10432, 49.0, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2007, 'Actual', 10440, 47.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2008, 'Actual', 11136, 49.6, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2009, 'Actual', 11312, 49.3, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2010, 'Actual', 11513, 48.9, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2011, 'Actual', 11645, 48.1, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2012, 'Actual', 12239, 49.5, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2013, 'Actual', 12873, 50.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2014, 'Actual', 13204, 51.0, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2015, 'Actual', 13725, 51.9, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2016, 'Actual', 14537, 53.7, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2017, 'Actual', 14962, 54.0, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2018, 'Actual', 15135, 53.4, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2019, 'Actual', 15628, 53.8, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2020, 'Projections', 16508, 55.2, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2021, 'Projections', 17053, 55.9, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2022, 'Projections', 17640, 56.6, 'C43');
INSERT INTO skin_cancer_stats (year, data_type, count, age_standardised_rate_2001_asp, icd10_codes) VALUES (2023, 'Projections', 18257, 57.3, 'C43');
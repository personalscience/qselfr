## code to prepare sample datasets goes here

sample_keto_data <- readr::read_csv(system.file("extdata",
                                                package = "qselfr",
                                                "KetoMojoSample.csv"),
                                    col_types=cols(
                                      source = col_character(),
                                      type = col_character(),
                                      value = col_double(),
                                      unit = col_character(),
                                      date = col_character(),
                                      time = col_time(format = ""),
                                      timeZone = col_character(),
                                      gki = col_logical(),
                                      hematocrit = col_logical(),
                                      hemoglobin = col_logical(),
                                      tags = col_character(),
                                      notes = col_character(),
                                      readingSampleType = col_character()
                                    ))
usethis::use_data(sample_keto_data, overwrite = TRUE)

autosleep_sample <- readr::read_csv(system.file("extdata",
                                                package = "qselfr",
                                                "Autosleep 2020.csv"),
                                    col_types = cols(
                                      ISO8601 = col_datetime(format = ""),
                                      fromDate = col_character(),
                                      toDate = col_character(),
                                      bedtime = col_datetime(format = ""),
                                      waketime = col_datetime(format = ""),
                                      inBed = col_time(format = ""),
                                      awake = col_time(format = ""),
                                      fellAsleepIn = col_time(format = ""),
                                      sessions = col_double(),
                                      asleep = col_time(format = ""),
                                      asleepAvg7 = col_time(format = ""),
                                      efficiency = col_double(),
                                      efficiencyAvg7 = col_double(),
                                      quality = col_time(format = ""),
                                      qualityAvg7 = col_time(format = ""),
                                      deep = col_time(format = ""),
                                      deepAvg7 = col_time(format = ""),
                                      sleepBPM = col_double(),
                                      sleepBPMAvg7 = col_double(),
                                      dayBPM = col_double(),
                                      dayBPMAvg7 = col_double(),
                                      wakingBPM = col_double(),
                                      wakingBPMAvg7 = col_double(),
                                      hrv = col_double(),
                                      hrvAvg7 = col_double(),
                                      SpO2Avg = col_logical(),
                                      SpO2Min = col_logical(),
                                      SpO2Max = col_logical(),
                                      tags = col_character(),
                                      notes = col_character()
                                    ))


usethis::use_data(autosleep_sample, overwrite = TRUE)

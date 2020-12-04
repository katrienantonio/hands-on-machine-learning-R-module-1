
## Workshop Hands-on Machine Learning in R, 2020 - 2021

by Katrien Antonio and Roel Henckaerts

Course materials for the *Hands-on Machine Learning in R* course
(December 2020 - February 2021) in collaboration with Actuarieel
Instituut.

📆 Module 1 on December 10 and 17, 2020, Module 2 on Jan 14 and 21, 2021
and Module 3 on Jan 28 and Feb 4, 2021 <br> 🕑 From 9.30 am to 12.30 pm
or from 1.30 pm to 4.30 pm <br> 📍 online, organized by Actuarieel
Instituut

Course materials will be posted in the week before the workshop. You are
now on the landing page for **Module 1: ML foundations and regression
models**.

## Prework

<p align="justify">

The workshop requires a basic understanding of R. A good starting level
is the material covered in the
[werkt-U-al-met-R?](https://github.com/katrienantonio/werkt-U-al-met-R)
repo on Katrien’s GitHub.

</p>

Familiarity with statistical or machine learning methods is *not*
required. The workshop gradually builds up these concepts, with an
emphasis on hands-on demonstrations and exercises.

The R and RStudio software should be up and running before coming to the
workshop. Please visit the **Software requirements** posted below.

## Overview

<p text-align="justify">

This workshop introduces the *essential concepts of building machine
learning models with R*. Throughout the workshop you will gain insights
in the foundations of machine learning methods, including *resampling
methods*, *data preprocessing steps* and the *tuning of parameters*. You
will cover a variety of *statistical and machine learning methods*,
ranging from GLMs, over tree-based machine learning methods to neural
networks. You will acquire insights in the foundations of these methods,
learn how to set-up the model building process, and focus on building a
good understanding of the resulting model output and predictions.

</p>

<p align="justify">

Leaving this workshop, you should have a firm grasp of the working
principles of a variety of machine learning methods and be able to
explore their use in practical settings. Moreover, you should have
acquired the fundamental insights to explore some other methods on your
own.

</p>

## Schedule and Course Material

The schedule will gradually be completed over the next days. The
detailed schedule is subject to small changes.

|  Module  |  Session  | Duration                | Description                                              | Lecture material                                                                                                 | R script | R solutions |
| :------: | :-------: | ----------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | -------- | ----------- |
| Prework  |           | your own pace           | check the Prework and Software Requirements instructions |                                                                                                                  |          |             |
| Prework  |           | day before the workshop | download the course material from the GitHub repo        |                                                                                                                  |          |             |
| Module 1 | Session 1 | 13.30 - 13.40           | Statistical and machine learning                         | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#knowing)     |          |             |
|          |           | 13.40 - 13.50           | Model accuracy and loss functions                        | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#accuracy)    |          |             |
|          |           | 13.50 - 14.00           | Overfitting and bias-variance trade off                  | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#overfit)     |          |             |
|          |           | 14.00 - 14.30           | Data splitting and resampling methods                    | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#resampling)  |          |             |
|          |           | 14.40 - 14.50           | (cont.)                                                  |                                                                                                                  |          |             |
|          |           | 14.50 - 15.30           | Parameter tuning                                         | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#tuning)      |          |             |
|          |           | 15.40 - 16.30           | Target and feature engineering                           | [sheets](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_part1.html#engineering) |          |             |
| Module 1 | Session 2 |                         |                                                          |                                                                                                                  |          |             |

##### Module 1: Machine learning foundations, regression methods

In two sessions we cover:

  - statistical and machine learning: a tour
  - machine learning foundations, including resampling with `caret` and
    `rsample`
  - feature pre-processing steps, including setting up a blue-print with
    `recipes`
  - regression models, including regularization: `lm()`, `glm()`,
    `mgcv()`, `glmnet()`

Download lecture sheets in
[pdf](https://katrienantonio.github.io/hands-on-machine-learning-R-module-1/sheets/ML_module1.pdf).

## After the workshop: want to more know?

An excellent collection of tutorials, books, workshops, events is
available via

<http://www.actuarialdatascience.org>

## Software Requirements

You have **two options** to join the coding exercises covered during the
workshop. Either you join the RStudio cloud workspace dedicated to the
workshop, and then you’ll run R in the cloud, from your browser. Or you
use your local installation of R and RStudio. The first option is very
easy and accessible. Make sure one of these options works smoothly
before coming to the workshop. A technical test session will be
organized to get you started in case of problems or doubts.

### RStudio Cloud

If you prefer not to work with a local installation of R (and the
necessary packages), you can join our workspace on RStudio Cloud. This
should be a **very accessible set-up** for working with R in the cloud
for the less experienced user\!

<https://rstudio.cloud/spaces/109060/join?access_code=s3jVNlJn6J8SlZpSXmwvBsCMUC3XicxoFv5kCbCO>

Here are the steps you should take (before the workshop):

  - visit the above link
  - log in by creating an account for RStudio or by using your Google or
    GitHub login credentials
  - join the space
  - at the top of your screen you see ‘Projects’, click ‘Projects’
  - with the ‘copy’ button (on the right) you can make your own version
    of the ‘Module 1 - Foundations of ML and regression’ project; in
    this copy you can work on the exercises, add comments etc.
  - you should now be able to visit the ‘Module 1’ project and see the
    ‘scripts’ and ‘data’ folders on the right. Open and run the
    ‘installation-instructions.R’ script from the scripts folder, to
    see if everything works fine.

We will have everything set up for you in the correct way. You only have
to login and open your copy of the project\!

### Local installation

Please bring a laptop with a recent version of R and RStudio installed.
You can visit the folder ‘prework’ on the GitHub repo to find
installation instructions for both. Make sure you can connect your
laptop to the internet (or download the course material one day before
the start of the workshop). You will need:

  - R (at least 3.5.2 <https://cloud.r-project.org/bin/windows/base/>)
  - RStudio
    (<https://www.rstudio.com/products/rstudio/download/#download>)

In the `prework` folder you will find a step-by-step guide to installing
R and RStudio (though a bit outdated).

Please **run the below script** in your R session to install the
required packages (for Module 1, more packages will be added later).

Make sure to **download the course material** (including scripts and
data sets) from the GitHub repo one day before the workshop. Use the
green button Code \> Download ZIP on the GitHub repo website. As a final
step, after downloading, unpack the ZIP folder and make sure you can
easily access the material (in particular scripts and data sets).

``` r
packages <- c("tidyverse", "here", "rstudioapi", "MASS", "AmesHousing",  "caret", "rsample", "purrr", "recipes", "broom", "mgcv", "glmnet", "gridExtra")

new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

if(sum(!(packages %in% installed.packages()[, "Package"]))) {
  stop(paste('The following required packages are not installed:\n', 
             paste(packages[which(!(packages %in% installed.packages()[, "Package"]))], collapse = ', ')));
} else {
  message("Everything is set up correctly. You are ready to go.")
}
```

These instructions can also be downloaded as .R script from the
`scripts` folder. Open this script in RStudio (via File \> Open file),
select the code and press the Run button top right in the script window.

## Instructors

<img src="img/Katrien.jpg" width="110"/>

<p align="justify">

[Katrien Antonio](https://katrienantonio.github.io/) is professor in
insurance data science at KU Leuven and associate professor at
University of Amsterdam. She teaches courses on data science for
insurance, life and non-life insurance mathematics and loss models.
Research-wise Katrien puts focus on pricing, reserving and fraud
analytics, as well as mortality dynamics.

</p>

<p align="justify">

*Roel Henckaerts* is a PhD student in insurance data science at KU
Leuven. Roel holds the degrees of MSc in Mathematical Engineering, MSc
in Insurance Studies and Financial and Actuarial Engineering (KU
Leuven). Before starting the PhD program he worked as an intern with AIG
(London office) and KBC. Roel is PhD fellow of the Research Foundation -
Flanders (FWO, PhD fellowship strategic basic research).

</p>

Happy learning\!

-----

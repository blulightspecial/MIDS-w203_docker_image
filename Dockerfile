## kmartcontainers/w203:v0.3

# Pull the base image from rocker
FROM rocker/verse:4.0.3
# Add libraries for w203 class
# See: https://www.rocker-project.org/use/extending/
RUN touch installR_man.txt installR_help.txt
RUN man install2.r > installR_man.txt
RUN install2.r --help > installR_help.txt
RUN install2.r sandwich stargazer car gridExtra lmtest revealjs  wooldridge
# Copy the math review into the folder
COPY MathReview_v10.Rmd /home/rstudio/
# Add a (wierd) library so that the math review knits
RUN install2.r plotrix
# Actually knit it (force it to install necessary tex stuff)
RUN Rscript -e "rmarkdown::render('/home/rstudio/MathReview_v10.Rmd')"
# Still needed to install "ulem" and "grfext" (latex) when I knitted rmarkdown basics
# Just knit a bunch more.....
COPY ./KM-OH-Notes /home/rstudio/KM-OH-Notes
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/RMarkdown_Basics.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/RStudioInDocker.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk03.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk04.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk05.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk06.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk07.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk08.Rmd')"
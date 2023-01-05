## kmartcontainers/w203:v0.6 
## Added janitor naniar skimr markdown ggthemes \
	# flexdashboard plotly ggplotly reactable \
	# bootstrap bootswatch
## Captures significant update to tidyverse/stringr
## Captures minor update to rstudio server

# Pull the base image from rocker
FROM rocker/verse:4.2.2
# Add emacs editor
RUN apt-get -y update && apt-get -y install emacs
# Add libraries for w203 class
# See: https://www.rocker-project.org/use/extending/
RUN install2.r sandwich stargazer car gridExtra lmtest \
revealjs  wooldridge GGally PerformanceAnalytics patchwork \
moments ggthemes fec16 corrplot plotrix lfe Hmisc gapminder \
plotly cowplot reshape2 styler lintr janitor naniar skimr \
markdown ggthemes flexdashboard plotly ggplotly reactable \
bootstrap bootswatch
# Copy the math review and some notes into the folder
COPY MathReview_v10.Rmd /home/rstudio/
COPY ./KM-OH-Notes /home/rstudio/KM-OH-Notes
# Actually knit it (force it to install necessary tex stuff)
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/RMarkdown_Basics.Rmd')"
# Just knit a bunch more.....
RUN Rscript -e "rmarkdown::render('/home/rstudio/MathReview_v10.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/RStudioInDocker.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk03.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk04.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk05.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk06.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk07.Rmd')"
RUN Rscript -e "rmarkdown::render('/home/rstudio/KM-OH-Notes/KM-OH-Wk08.Rmd')"
# Chuck out the files. I don't need them anymore.
RUN rm -r -f /home/rstudio/KM-OH-Notes /home/rstudio/MathReview_v10.*

FROM rocker/shiny-verse:latest 

RUN apt-get update && apt-get install -y \ 
    sudo \ 
    pandoc \ 
    pandoc-citeproc \ 
    libcurl4-gnutls-dev \ 
    libcairo2-dev \ 
    libxt-dev \ 
    libssl-dev \ 
    libssh2-1-dev 
    
# Install R packages that are required
# TODO: add further package if you need!
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyWidgets', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tosca', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('LDAvis', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('servr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('NLP', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tm', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidytext', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('writexl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidytext', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('xfun', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('syuzhet', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('sentimentr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringi', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Unicode', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('utf8', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lexRankr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('text2vec', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('udpipe', repos='http://cran.rstudio.com/')"

# Copy configuration files into the Docker image
COPY ./R /srv/shiny-server/R 

# Make the ShinyApp available at port 80
EXPOSE 3838 

# Copy further configuration files into the Docker image
RUN sudo chown -R shiny:shiny /srv/shiny-server 

CMD ["/usr/bin/shiny-server.sh"]
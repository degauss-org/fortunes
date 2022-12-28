FROM --platform=$BUILDPLATFORM rocker/r-ver:4.1.2

ENV degauss_name="fortunes"
ENV degauss_version="0.1.3"
ENV degauss_description="random quotes"
ENV degauss_argument="number of quotes to print [default: 1]"

# add labels based on environment variables too
LABEL "org.degauss.name"="${degauss_name}"
LABEL "org.degauss.version"="${degauss_version}"
LABEL "org.degauss.description"="${degauss_description}"
LABEL "org.degauss.argument"="${degauss_argument}"

RUN R --quiet -e "install.packages('remotes', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"

RUN R --quiet -e "remotes::install_github('rstudio/renv@0.14.0')"

WORKDIR /app

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends \
    libgit2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    && apt-get clean

COPY renv.lock .

RUN R --quiet -e "renv::restore(repos = c(CRAN = 'https://cran.rstudio.com'))"

# COPY geomarker_data.rds .
COPY entrypoint.R .

WORKDIR /tmp

ENTRYPOINT ["/app/entrypoint.R"]

ARG TARGETPLATFORM
RUN compile --target=$TARGETPLATFORM -o /out/mybinary

FROM rocker/r-ver:4.1.2
COPY --from=build /out/mybinary /bin


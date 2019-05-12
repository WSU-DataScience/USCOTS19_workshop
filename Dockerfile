FROM jupyter/datascience-notebook:ae5f7e104dd5

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

USER $NB_UID

# Additional python library
RUN pip install --no-cache-dir pyensae qgrid librosa

USER ${NB_USER}

FROM python:3.9

ENV INTERACTIVE_HTML_BOM_NO_DISPLAY=
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install libgtk-3-dev
RUN pip install -U jsonschema
RUN pip install -U wxpython
RUN git clone https://github.com/openscopeproject/InteractiveHtmlBom.git /opt/IHB
RUN ln -s /opt/IHB/InteractiveHtmlBom/generate_interactive_bom.py /usr/local/bin/generate_interactive_bom
RUN rm /usr/bin/python3
RUN ln -s /usr/local/bin/python /usr/bin/python3

CMD generate_interactive_bom -h
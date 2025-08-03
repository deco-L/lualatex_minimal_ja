FROM archlinux:latest

RUN pacman -Syu --noconfirm wget perl fontconfig make ghostscript base-devel \
  && pacman -Scc --noconfirm

WORKDIR /tmp
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN mkdir texlive_installer \
  && tar -xzf install-tl-unx.tar.gz -C texlive_installer --strip-components=1 \
  && cd texlive_installer \
  && echo "selected_scheme scheme-small" > texlive.profile \
  && echo "tlpdbopt_install_docfiles 0" >> texlive.profile \
  && echo "tlpdbopt_install_srcfiles 0" >> texlive.profile \
  && ./install-tl -profile texlive.profile \
  && cd / && rm -rf /tmp/install-tl*

ENV PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

RUN tlmgr install collection-langjapanese latexmk wrapfig tcolorbox here

COPY ./compile.sh /usr/bin/compile
RUN chmod +x /usr/bin/compile
WORKDIR /work
ENTRYPOINT ["compile"]


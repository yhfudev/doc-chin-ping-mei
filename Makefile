# use latex's option -jobname to control the compiling of multiple language text.
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

PREFIX_TYPE=type

#TYPE=en zh tw
#en: 纯英文支持，包括支持中文字符
#zhmd:　中文现代横排（注释在底部）
#zhmdv:　中文现代竖排（注释在旁边）
#zhgz: 中文割注横排
#zhgzv: 中文割注竖排

#TYPE=zhgz zhmd zhgzv zhmdv
TYPE=zhmd zhgzv
#TYPE=zhmd
#TYPE=zhgzv
SRC_PREFIX=jpm-cihua jpm-xiuxiang
#SRC_PREFIX=jpm-cihua
#SRC_PREFIX=jpm-xiuxiang

LTARGS= \def\usecjk{1} \def\pagewidth{145mm} \def\pageheight{210mm} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait}
SOURCE=tmp0.tex
TARGET=tmp0.pdf

define SRC_FROM_PREFIX
	$(addsuffix .tex, $(foreach file, $(SRC_PREFIX), $(basename $(notdir $(file)))))
endef
SOURCES=$(SRC_FROM_PREFIX)

#define OBJ_FROM_SRC
	#$(addsuffix .o, $(foreach file, $(SOURCES), $(basename $(notdir $(file)))))
#endef
#OBJECTS=$(OBJ_FROM_SRC)

define OUTPREFIX_FROM_SRC
	$(foreach suffix, $(TYPE), $(addsuffix .$(suffix), $(foreach file, $(SOURCES), $(basename $(notdir $(file))))))
endef
OUTPREFIXS=$(OUTPREFIX_FROM_SRC)

define PDF_FROM_PREFIX
	$(addsuffix .pdf, $(foreach file, $(OUTPREFIXS), $(notdir $(file))))
endef
OUTPDFS=$(PDF_FROM_PREFIX)

define LATEXTMP_FROM_PREFIX
	$(foreach suffix, log out aux, $(addsuffix .$(suffix), $(foreach file, $(SOURCES), $(basename $(notdir $(file))))))
endef
LATEXTMP=$(LATEXTMP_FROM_PREFIX)


DEFAULT: $(OUTPDFS)
#	@echo OUTPDFS=$(OUTPDFS)

$(OUTPDFS): $(OUTPREFIXS)

$(OUTPREFIXS): $(SOURCES)
	$(MAKE) SOURCE=$(shell echo $@ | awk -F. '{print $$1 }').tex LTARGS="$(LTARGS)" TARGET=$@.pdf $@.pdf

clean:
	@rm -f $(OUTPREFIXS) $(TARGET) $(OUTPDFS) $(LATEXTMP) $(PREFIX_TYPE)-*

JOBNAME=$(PREFIX_TYPE)-$(shell echo $(shell basename $(TARGET)) | awk -F. '{print $$1 }')
$(TARGET): $(SOURCE)
	@touch $@
	xelatex -jobname $(JOBNAME) "$(LTARGS) \input{$(SOURCE)}"
	xelatex -jobname $(JOBNAME) "$(LTARGS) \input{$(SOURCE)}"
	#bibtex $(JOBNAME)
	#xelatex -jobname $(JOBNAME) "$(LTARGS) \input{$(SOURCE)}"
	#xelatex -jobname $(JOBNAME) "$(LTARGS) \input{$(SOURCE)}"
	mv $(JOBNAME).pdf $@
	@echo ""

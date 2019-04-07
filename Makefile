# @Author: wulff
# @Date:   2016-11-18T05:43:12+01:00
# @Last modified by:   wulff
# @Last modified time: 2019-04-07T17:12:05+02:00



LIB = paper/lib/

#- Path for tex files
TEX = tex

#- Path for eps files
EPS= eps

#- Path for pdf files
PDF = pdf

OUT = output

DVIEPS = paper/bin/doeps

.PHONY: eps delivery

texpdf:
	-mkdir ${OUT}
	cd ${LIB}; ${MAKE} DOC=paper
	cp ${LIB}/paper.pdf ${OUT}

clean:
	cd ${LIB}; ${MAKE} clean
	cd eps; ${MAKE} clean

eps:
	cd eps; ${MAKE} all

latex:
	cd ${LIB}; ${MAKE} latex DOC=paper

texpdfgray:
	cd ${LIB}; ${MAKE} gray DOC=paper

all: eps texpdf texpdfone  latexone texpdfgray texpdfonegray

texpdfone:
	cd ${LIB}; ${MAKE} DOC=paper_onecolumn
	cp ${LIB}/paper_onecolumn.pdf ${OUT}

latexone:
	cd ${LIB}; ${MAKE} latex DOC=paper_onecolumn

texpdfonegray:
	cd ${LIB}; ${MAKE} gray DOC=paper_onecolumn

DATE = $(shell date +%Y-%m-%d)

DELI= delivery/${DATE}

delivery:
	-mkdir ${DELI}
	-rm -rf ${DELI}
	-rm delivery/${DATE}.zip
	cd ${LIB};../bin/delivery paper_onecolumn.tex ../${DELI}
	cd ${LIB};	../bin/delivery paper.tex ../${DELI}
	mv ${DELI}/paper_onecolumn.tex ${DELI}/FINAL_VERSION.tex
	mv ${DELI}/paper.tex ${DELI}/FINAL_VERSION_TWOCOLUMN.tex
	cd ${DELI}; make
	cd ${DELI}; make DOC=FINAL_VERSION_TWOCOLUMN
	cd ${DELI}; make clean
	cd delivery; zip -r ${DATE}.zip ${DATE}

install:
	cp -rf paper/tex/ tex/
	-mkdir pdf
	cp -f paper/pdf/wulff.pdf pdf
	-mkdir eps
	cp -f paper/eps/wulff.eps eps/
	cp -f paper/eps/Makefile_workdir eps/Makefile
	cp -f paper/Makefile_workdir Makefile

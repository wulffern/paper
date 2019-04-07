# @Author: wulff
# @Date:   2016-11-18T07:54:00+01:00
# @Last modified by:   wulff
# @Last modified time: 2019-04-07T16:32:44+02:00



######################################################################
##        Copyright (c) 2016 Carsten Wulff Software, Norway
## ###################################################################
## Created       : wulff at 2016-11-18
## ###################################################################
##   This program is free software: you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation, either version 3 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program.  If not, see <http://www.gnu.org/licenses/>.
######################################################################


DOEPS = ../paper/bin/doeps

one:
	${DOEPS} 	${FILE}

all:
	$(foreach f, ${FIG}, ${DOEPS} ${f};)

clean:
	-rm *.bbl
	-rm *.aux
	-rm *.log
	-rm *.blg

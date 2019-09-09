filename=iWe-long
makerunning=Make-running
# thank you rubber?
#bibtex:
	#pdflatex ${filename}.tex
	#bibtex ${filename}||true
	#pdflatex ${filename}.tex
	#pdflatex ${filename}.tex

all: pdf read

pdf:
	#pdflatex ${filename}.tex
	touch ${makerunning}
	./docker/do_build.sh rubber -df ${filename}
	rm -f ${makerunning}
	rm -f *.deleteme

read:
	evince ${filename}.pdf &> /dev/null &

read-part2:
	evince ${filename}-part2.pdf &> /dev/null &

aspell:
	for file in $$(ls *.tex); do \
		aspell --lang=en-US -t -c $$file; \
	done

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,brf,deleteme,gnt,ldl,lms,lrk,lse,ltk,lwp,mw,toc}
	rm -f *.aux

unlock:
	rm -f ${makerunning}

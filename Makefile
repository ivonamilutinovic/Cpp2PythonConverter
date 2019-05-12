prevodilac: parser.tab.o lex.yy.o
	g++ -Wall -o $@ $^

lex.yy.o: lex.yy.c parser.tab.hpp
	g++ -Wno-sign-compare -Wall -c -o $@ $<

lex.yy.c: lexer.lex
	flex $<

parser.tab.o: parser.tab.cpp
	g++ -Wall -c -o $@ $<

parser.tab.cpp parser.tab.hpp: parser.ypp
	bison -d -v $<


.PHONY: clean
clean:
	rm -f parser.output parser.tab.* *.o *~ lex.yy.c prevodilac
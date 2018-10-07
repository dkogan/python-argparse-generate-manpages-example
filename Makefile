VERSION  := 0.1
DIST_MAN := frobnicate.1

all: $(DIST_MAN)
.PHONY: all

$(DIST_MAN): %.1: %.pod
	pod2man --center="frobnicator: tool to do stuff" --name=FROBNICATOR --release="frobnicator $(VERSION)" --section=1 $< $@

%.pod: %
	./make-pod.pl $< > $@
	cat footer.pod >> $@

clean:
	rm -rf $(DIST_MAN) $(patsubst %.1,%.pod,$(DIST_MAN))
.PHONY: clean

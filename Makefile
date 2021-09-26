
RM       = rm -v
REQS    != find . -name \*-requirements.txt
SRC     != find topacciodice  -name \*.py
VENV     = . .venv/bin/activate &&
empty   :=
STEMS   := $(addprefix .,$(notdir $(REQS)))
DOTREQS := $(subst -requirements.txt,$(empty),$(STEMS))


.SUFIXXES:
.SUFFIXES: .py

.PHONY: build test run deploy stop devenv

default:

all: build test run deploy
all: $(SRC)
all: .requirements

devenv: .venv .requirements

.clean:
	-$(RM) .requirements
	-$(RM) $(DOTREQS)

.venv:
	python3 -m venv .venv
	python3 -m pip install --upgrade pip wheel

.requirements: .venv $(DOTREQS)

$(DOTREQS): .%: %-requirements.txt
	$(VENV) pip install -r $<
	touch $@

%:


#  d(-_-;)bm  hlo.mx 1632471510
#  vim:  ts=4 sw=0 tw=80 noet :

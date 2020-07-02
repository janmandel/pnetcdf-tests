SFC = ifort
DM_FC = mpif90 -f90=$(SFC)
FC = $(DM_FC)
FCOPTIM = -O2

SRCS = $(wildcard *.f90)
PRGS = $(patsubst %.f90,%,$(SRCS))

all: $(PRGS) 

$(PRGS) : $(SRCS) utils.o
	$(FC) $(FCOPTIM) -o $@ $@.f90 utils.o -I$(PNETCDF_INCDIR) -L$(PNETCDF_LIBDIR) -lpnetcdf 

utils.o : utils.F90
	$(FC) $(FCOPTIM) -c utils.F90 

clean: 
	rm $(PRGS) utils.o

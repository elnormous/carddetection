EXECUTABLE=carddetection
CXXFLAGS=-c -Wall

.PHONY: all
CXXFLAGS+=-O2
all: $(EXECUTABLE)

.PHONY: debug
debug: CXXFLAGS+=-DDEBUG -g
debug: $(EXECUTABLE)

$(EXECUTABLE):
	$(CXX) $(CXXFLAGS) `pkg-config opencv --cflags` main.cpp -o main.o
	$(CXX) $(LDFLAGS) `pkg-config opencv --libs` main.o -o $(EXECUTABLE)

.PHONY: clean
clean:
	rm -f $(EXECUTABLE) *.o

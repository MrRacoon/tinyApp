NAME        = tinyApp

CLIENT_DIR  = client
TARGET      = $(CLIENT_DIR)/Main.elm

SERVER_DIR  = server
SERVER_FILE = $(SERVER_DIR)/index.js

PKG_DIR     = pkg
TAR_FILE    = $(PKG_DIR)/$(NAME).tar.bz
MD5_FILE    = $(PKG_DIR)/$(NAME).md5

NODE_MODULES = ./node_modules
ELM_STUFF    = elm-stuff

ELM = elm-make

.phony: all build clean tar client server dev

################################################################################

all: build

build: clean app.js

clean:
	-rm -rf app.js

deps:
	npm install
	$(ELM) --yes

tar: build
	mkdir -p $(PKG_DIR)
	tar -cvjf $(TAR_FILE) $(DIST_DIR)
	md5sum $(TAR_FILE) >> $(MD5_FILE)

################################################################################

app.js:
	$(ELM) $(TARGET) --yes --output=app.js

################################################################################

run-client: build
	node_modules/.bin/http-server -p 8080 ./

run-server:
	node $(SERVER_FILE)

dev: build client server

################################################################################

ci: build

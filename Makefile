SRC_DIR = src
TEST_DIR = test 
BUILD_DIR = build

PREFIX = .
DIST_DIR = ${PREFIX}/dist 

JS_ENGINE ?= `which node nodejs 2>/dev/null`
COMPILER = ${JS_ENGINE} ${BUILD_DIR}/post-compile.js

BASE_FILES = ${SRC_DIR}/itunes-store.js\
	${SRC_DIR}/config.js\
	${SRC_DIR}/common.js\
	${SRC_DIR}/search.js\
	${SRC_DIR}/lookup.js\
	${SRC_DIR}/ranking.js

MODULES = ${SRC_DIR}/intro.js\
	${BASE_FILES}\
	${SRC_DIR}/outro.js

DIST_FILE = ${DIST_DIR}/itunes-store.js
DIST_MIN_FILE = ${DIST_DIR}/itunes-store.min.js



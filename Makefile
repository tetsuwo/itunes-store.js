SRC_DIR   = src
TEST_DIR  = test 
BUILD_DIR = build

PREFIX        = .
DIST_DIR      = ${PREFIX}/dist
DIST_FILE     = ${DIST_DIR}/itunes-store.js
DIST_MIN_FILE = ${DIST_DIR}/itunes-store.min.js

JAVA_BIN ?= `which java 2>/dev/null`
COMPILER  = ${JAVA_BIN} -jar ${BUILD_DIR}/closure-compiler/compiler.jar

BASE_FILES = ${SRC_DIR}/config.js\
	${SRC_DIR}/common.js\
	${SRC_DIR}/search.js\
	${SRC_DIR}/lookup.js\
	${SRC_DIR}/ranking.js

MODULES = ${SRC_DIR}/intro.js\
	${BASE_FILES}\
	${SRC_DIR}/outro.js

# -- commands --

all: clean ${DIST_DIR} uncompressed minified 
	@@echo "Completed."

uncompressed: 
	@@echo "Building" ${DIST_FILE} "..."
	@@cat ${MODULES} > ${DIST_FILE}
	@@echo "Uncompressed codes built."

minified: 
	@@echo "Building" ${DIST_MIN_FILE} "..."
	@@cat ${BASE_FILES} > ${DIST_MIN_FILE}.tmp
	@@${COMPILER} --js ${DIST_MIN_FILE}.tmp --js_output_file ${DIST_MIN_FILE}.dev
	@@cat ${SRC_DIR}/intro.js ${DIST_MIN_FILE}.dev ${SRC_DIR}/outro.js > ${DIST_MIN_FILE};
	@@rm -rf ${DIST_MIN_FILE}.tmp
	@@rm -rf ${DIST_MIN_FILE}.dev
	@@echo "Minified codes built."

${DIST_DIR}:
	@@echo "Making" ${DIST_DIR}
	@@mkdir -p ${DIST_DIR}
	@@echo "Made" ${DIST_DIR}

dump:
	@@echo "SRC_DIR" ${SRC_DIR}
	@@echo "TEST_DIR" ${TEST_DIR}
	@@echo "BUILD_DIR" ${BUILD_DIR}
	@@echo "PREFIX" ${PREFIX}
	@@echo "DIST_DIR" ${DIST_DIR}
	@@echo "JAVA_BIN" ${JAVA_BIN}
	@@echo "COMPILER" ${COMPILER}
	@@echo "BASE_FILES" ${BASE_FILES}
	@@echo "MODULES" ${MODULES}
	@@echo "DIST_FILE" ${DIST_FILE}
	@@echo "DIST_MIN_FILE" ${DIST_MIN_FILE}

clean:
	@@echo "Cleaning..."
	@@echo "Removing Distribution directory:" ${DIST_DIR}
	@@rm -rf ${DIST_DIR}
	@@echo "Cleaned."

.PHONY: all uncompressed minified dump clean

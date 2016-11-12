npm:
	$(info ************  npm install  ************)
	cd client && \
	npm install

bower:
	$(info ************  bower install  ************)
	cd client && \
	bower install

run:
	$(info ************  gulp watch  ************)
	cd client && \
	gulp watch

clean:
	$(info ************  Remove binaries, packages, components files. ************)
	rm -rf ./client/bower_components
	rm -rf ./client/node_modules
	rm -rf ./npm-debug.log

full:
	make npm
	make bower
	make run

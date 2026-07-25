# Ministry of Fixing Civilisation — dev tasks
# The UTF-8 locale exports avoid a Ruby US-ASCII read error on some shells,
# so you never have to remember to prefix commands with LANG=... again.
export LANG := en_US.UTF-8
export LC_ALL := en_US.UTF-8

.DEFAULT_GOAL := help
.PHONY: help serve build clean install

help: ## Show this help
	@echo "Ministry of Fixing Civilisation — tasks:"
	@echo "  make serve    local preview at http://127.0.0.1:4000"
	@echo "  make build    build the static site into _site/"
	@echo "  make clean    remove build output"
	@echo "  make install  install Ruby gems (first-time setup)"

install: ## Install Ruby gems
	bundle install

serve: ## Local preview (rebuilds on save)
	bundle exec jekyll serve --port 4000 --host 127.0.0.1

build: ## One-off build into _site/
	bundle exec jekyll build

clean: ## Remove build output and caches
	rm -rf _site .jekyll-cache .sass-cache

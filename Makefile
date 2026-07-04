# Config
APP_NAME := cricket
CMD := ./cmd/server


HOST := 0.0.0.0
PORT := 1323

# Targets
.PHONY: run
run:
	go run $(CMD) --host=$(HOST) --port=$(PORT) --static-dir=static

.PHONY: build
build:
	go build -o bin/$(APP_NAME) $(CMD)

.PHONY: clean
clean:
	rm -rf bin/
	rm -rf tmp/

.PHONY: fmt
fmt:
	templ fmt .
	go fmt ./...

.PHONY: templ
templ:
	templ generate

.PHONY: sqlc
sqlc:
	sqlc generate

.PHONY: generate
generate: templ sqlc

BIN_DIR=bin
TMP_DIR=tmp

all: clean build

clean:
	rm -rf $(BIN_DIR) $(TMP_DIR)

build:
	mkdir $(BIN_DIR)
	crystal build --release --no-debug judge.cr -o $(BIN_DIR)/judge
	crystal build --release --no-debug main.cr -o $(BIN_DIR)/crystal

test:
	mkdir $(TMP_DIR)
	crystal generate_test_data.cr > $(TMP_DIR)/test_data.in
	$(BIN_DIR)/crystal < $(TMP_DIR)/test_data.in > $(TMP_DIR)/crystal.out
	@bin/judge $(TMP_DIR)/test_data.in $(TMP_DIR)/crystal.out
	ruby main.rb < $(TMP_DIR)/test_data.in > $(TMP_DIR)/ruby.out
	@bin/judge $(TMP_DIR)/test_data.in $(TMP_DIR)/ruby.out

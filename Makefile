.PHONY: install lint test train notebook clean help

help:
	@echo "CoMM-BIP — available commands:"
	@echo "  make install    Install all dependencies"
	@echo "  make lint       Lint source code"
	@echo "  make test       Run unit tests"
	@echo "  make train      Train the model (default config)"
	@echo "  make notebook   Execute main analysis notebook"
	@echo "  make clean      Remove cache and executed notebooks"

install:
	pip install -r requirements.txt

lint:
	flake8 src/ --max-line-length=127 --count --statistics

test:
	pytest src/tests/ -v --tb=short

train:
	python src/train.py --data_dir ./data

notebook:
	jupyter nbconvert --to notebook --execute plant_coMM_model.ipynb \
		--output plant_coMM_model_executed.ipynb

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null; true
	find . -name "*.pyc" -delete 2>/dev/null; true
	find . -name ".DS_Store" -delete 2>/dev/null; true
	find . -name "*_executed.ipynb" -delete 2>/dev/null; true
	find . -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null; true

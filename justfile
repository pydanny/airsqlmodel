# List all available just commands
list:
    just -l

# Check for lint and format violations
lint: 
    uv run ruff format --check .
    uv run ruff check .

# Fix lint and format violations
qa:
    uv run ruff format .
    uv run ruff check . --fix

# Run the tests
test:
    uv run pytest tests/

# Run the tests with pdb on failure
pdb:
	@echo "Running with arg: $(filter-out $@,$(MAKECMDGOALS))"
	pytest --pdb --maxfail=10 --pdbcls=IPython.terminal.debugger:TerminalPdb $(filter-out $@,$(MAKECMDGOALS))    
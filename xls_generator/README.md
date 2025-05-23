# XLS Generator

This project is designed to generate XLSX files (Excel format).

## Dependencies

The main dependency for this project is `openpyxl`. All required Python packages are listed in `requirements.txt`.

To install the dependencies, run:
```bash
pip install -r requirements.txt
```

## Usage

To use the XLS generator in your own Python script:

1.  Import the `generate_xls` function:
    ```python
    from xls_generator.src.generator import generate_xls
    ```
2.  Prepare your data as a list of lists, where each inner list represents a row and contains the cell values in order. The `generate_xls` function handles the header row automatically. You only need to provide the data rows.
    ```python
    data_to_write = [
        ["QCell 480", "QCell 480", 120.00, 120.00, 0.00, "panel", "Qcell", "Produkt", 0.12, "Standard", 0.207, "12-year", "25-year", "25-year", 0.48, 92, 170],
        # ... more rows
    ]
    ```
3.  Call the function with your desired output filename and the data:
    ```python
    generate_xls("my_excel_file.xlsx", data_to_write)
    print("Generated my_excel_file.xlsx")
    ```

### Running the Example

The `generator.py` script also contains a built-in example. To run it, navigate to the project's root directory and execute:
```bash
python xls_generator/src/generator.py
```
This will generate an `output.xlsx` file in the project root with sample data.

## Running Tests

To run the automated tests, navigate to the project's root directory and execute:
```bash
python -m unittest xls_generator.tests.test_generator
```
Alternatively, you can run:
```bash
python xls_generator/tests/test_generator.py
```

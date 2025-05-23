import openpyxl

def generate_xls(filename: str, data_rows: list):
    """
    Generates an XLS file with the given data.

    Args:
        filename: The path to the output XLS file.
        data_rows: A list of lists, where each inner list represents a row of cell values.
    """
    workbook = openpyxl.Workbook()
    worksheet = workbook.active

    header_row = [
        "Name", "Product code", "Net price", "Gross price", "VAT", "Main category",
        "Producer", "Product type", "Price per Watt", "Class", "Efficiency",
        "Product Warranty", "Production Warranty", "Labor Warranty", "Power panel [kW]",
        "Width panel [cm]", "Height panel [cm]"
    ]
    worksheet.append(header_row)

    for row_data in data_rows:
        # No explicit type conversion here, relying on input data being correct
        # openpyxl will handle Python int/float as numbers.
        worksheet.append(row_data)

    workbook.save(filename)

if __name__ == "__main__":
    sample_data = [
        [
            "QCell 480",  # Name
            "QCell 480",  # Product code
            120.00,       # Net price
            120.00,       # Gross price
            0.00,         # VAT
            "panel",      # Main category
            "Qcell",      # Producer
            "Produkt",    # Product type
            0.12,         # Price per Watt (numeric)
            "Standard",   # Class
            0.207,        # Efficiency (numeric, e.g., 20.7% as 0.207)
            "12-year",    # Product Warranty
            "25-year",    # Production Warranty
            "25-year",    # Labor Warranty
            0.48,         # Power panel [kW] (numeric)
            92,           # Width panel [cm] (numeric)
            170           # Height panel [cm] (numeric)
        ],
        [
            "REC 370",
            "REC 370",
            125.00,
            125.00,
            0.00,
            "panel",
            "REC",
            "Produkt",
            0.15, # Price per Watt (numeric, e.g. $0,15 -> 0.15)
            "Standard",
            0.209, # Efficiency (numeric, e.g. 20.9% -> 0.209)
            "12-year",
            "25-year",
            "25-year",
            0.37,
            92,
            170
        ]
    ]
    generate_xls("output.xlsx", sample_data)
    print("Generated output.xlsx with sample data.")

import unittest
import os
import sys
import openpyxl

# Add the parent directory (xls_generator) to sys.path to allow importing from src
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.generator import generate_xls

class TestGenerateXLS(unittest.TestCase):

    def test_generate_xls_output(self):
        test_filename = "test_output_actual.xlsx"
        self.addCleanup(os.remove, test_filename)

        test_data = [
            [
                "TestProd 1", "TP001", 100.0, 123.0, 23.0, "catA", "ProdX", "Type1",
                0.25, "Premium", 0.195, "10-year", "20-year", "20-year",
                0.40, 100, 160
            ]
        ]

        expected_headers = [
            "Name", "Product code", "Net price", "Gross price", "VAT", "Main category",
            "Producer", "Product type", "Price per Watt", "Class", "Efficiency",
            "Product Warranty", "Production Warranty", "Labor Warranty", "Power panel [kW]",
            "Width panel [cm]", "Height panel [cm]"
        ]

        generate_xls(test_filename, test_data)

        workbook = openpyxl.load_workbook(test_filename)
        worksheet = workbook.active

        # Read and assert header row
        actual_headers = [cell.value for cell in worksheet[1]]
        self.assertEqual(actual_headers, expected_headers)

        # Read and assert data row
        # Data starts from the second row (index 2 in openpyxl)
        actual_data_row = [cell.value for cell in worksheet[2]]
        self.assertEqual(actual_data_row, test_data[0])
        
        # Explicitly check numeric types for a few cells to be sure
        self.assertIsInstance(actual_data_row[2], (int, float)) # Net price
        self.assertEqual(actual_data_row[2], 100.0)
        self.assertIsInstance(actual_data_row[8], (int, float)) # Price per Watt
        self.assertEqual(actual_data_row[8], 0.25) 
        self.assertIsInstance(actual_data_row[14], (int, float)) # Power panel [kW]
        self.assertEqual(actual_data_row[14], 0.40)
        self.assertIsInstance(actual_data_row[15], (int, float)) # Width panel [cm]
        self.assertEqual(actual_data_row[15], 100)


        workbook.close() # Ensure workbook is closed

if __name__ == '__main__':
    # To run tests from this file directly, you might need to be in the 'xls_generator/tests' directory
    # or adjust sys.path further if running from the root of the project.
    # For simplicity, this assumes the test runner will handle PYTHONPATH or CWD correctly.
    # If running `python test_generator.py` from `xls_generator/tests/`
    # the `sys.path.insert` above should work.
    unittest.main()

# Python scripting.


Renaming files from one format to the other:
Input format of files eg.: 28Jun2023.pdf

```python
import os
import re
from datetime import datetime

def rename_files_in_directory(directory_path):
    # This regex will match the day, month, and year from filenames like 28Jun2023.pdf
    date_pattern = re.compile(r'(\d{1,2})([A-Za-z]{3})(\d{4})')

    # This dictionary will be used to convert month abbreviations to month numbers
    month_conversion = {
        'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 'May': '05', 'Jun': '06',
        'Jul': '07', 'Aug': '08', 'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
    }

    for filename in os.listdir(directory_path):
        match = date_pattern.search(filename)
        if match:
            day = match.group(1).zfill(2)  # Ensure day is always two digits
            month = month_conversion.get(match.group(2))
            year = match.group(3)

            # Create the new filename
            new_name = f"{year}{month}{day}-{filename}"

            # Get the full paths
            old_path = os.path.join(directory_path, filename)
            new_path = os.path.join(directory_path, new_name)

            # Rename the file
            os.rename(old_path, new_path)
            print(f"Renamed {filename} to {new_name}")

if __name__ == '__main__':
    directory_path = input("Please enter the directory path where the files are located: ")
    rename_files_in_directory(directory_path)
```


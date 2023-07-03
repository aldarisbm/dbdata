import os
import xml.etree.ElementTree as ET
from typing import List
from load_xml import PostgresConnection


def main():
    with PostgresConnection() as pg:
        for row in analyze_xml_files():
            if row.tag == "row":
                columns = []
                values = []
                for attr_name, attr_value in row.attrib.items():
                    columns.append(attr_name)
                    values.append(attr_value)

                columns = [column.lower() for column in columns]
                values = [value.replace("'", "''") for value in values]
                values = [f"'{value}'" for value in values]
                pg.load_row_into_table("votes", columns, values)

def analyze_xml_files():
    dir_path = 'parenting.meta.stackexchange.com'
    file_names = get_files_in_dir(dir_path)
    for file in file_names:
        if file == "Votes.xml":
            return xml_analyze(f'{dir_path}/{file}')

def get_files_in_dir(dir_path: str) -> List[str]:
    files = []
    for filename in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, filename)):
            files.append(filename)
    return files


def xml_analyze(xml_file: str):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    return root.iter()


if __name__ == "__main__":
    main()

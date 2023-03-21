import argparse
import os
import shutil
import subprocess
from pathlib import Path
import configparser

def find_lua_files(path):
    return list(path.glob('**/*.lua'))

def find_yaml_file(lua_file):
    """finds matching conda environment file"""

    yaml_file = lua_file.with_suffix('.yaml')
    if yaml_file.exists():
        return yaml_file

    yaml_file = lua_file.with_suffix('.yml')
    if yaml_file.exists():
        return yaml_file
    
    return None

def create_conda_env(yaml_path):
    process = subprocess.run(['conda', 'env', 'create', '-f', str(yaml_path)])
    return process.returncode

def copy_lua_files(src_lua_files, src_path, dst_path):
    for src_file in src_lua_files:
        dst_file = dst_path / src_file.relative_to(src_path)
        dst_file.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src_file, dst_file)

def get_destination_from_config():
    config = configparser.ConfigParser()
    config.read('.hpcenvs')
    return config.get('general', 'destination', fallback=None)

def main():
    parser = argparse.ArgumentParser(
        description='Find module files, create conda envs, and copy them.')
    parser.add_argument('src', type=str, help='source directory')
    parser.add_argument('--dst', type=str, default=None, 
        help='destination directory (optional)')
    parser.add_argument('--readall', action='store_true', 
        help='set umask to 0022 for the duration of the program')
    args = parser.parse_args()

    config = read_config()
    dst_path = args.dst or config.get('general', 'destination', fallback=None)
    readall = args.readall or config.getboolean('general', 'readall', 
            fallback=False)

    if dst_path is None:
        raise ValueError("Module destination directory not provided")

    if readall:
        original_umask = os.umask(0o022)

    src_path = Path(args.src).resolve()
    dst_path = Path(dst_path).resolve()

    lua_files = find_lua_files(src_path)

    for lua_file in lua_files:
        yaml_file = find_yaml_file(lua_file)
        if yaml_file:
            return_code = create_conda_env(yaml_file)
            if return_code:
                print(f"Failed to create conda environment for {yaml_file}.",
                      f"Skipping copying of {lua_file}.")
                continue
            copy_lua_files([lua_file], src_path, dst_path)

    if readall:
        os.umask(original_umask)

if __name__ == "__main__":
    main()


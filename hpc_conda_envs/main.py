import argparse
import os
import shutil
import subprocess
from pathlib import Path
import configparser

def find_lua_files(path):
    return list(path.glob('**/*.lua'))

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
    parser = argparse.ArgumentParser(description='Find .lua files, create conda envs, and copy them.')
    parser.add_argument('src', type=str, help='source directory')
    parser.add_argument('--dst', type=str, default=None, help='destination directory (optional)')
    parser.add_argument('--readall', action='store_true', help='set umask to 0022 for the duration of the program')
    args = parser.parse_args()

    if args.readall:
        original_umask = os.umask(0o022)

    src_path = Path(args.src).resolve()

    if args.dst is None:
        dst_path = get_destination_from_config()
        if dst_path is None:
            raise ValueError("Destination directory not provided and not found in .hpcenvs config file")
        dst_path = Path(dst_path).resolve()
    else:
        dst_path = Path(args.dst).resolve()

    lua_files = find_lua_files(src_path)

    for lua_file in lua_files:
        yaml_file = lua_file.with_suffix('.yaml')
        if yaml_file.exists():
            return_code = create_conda_env(yaml_file)
            if return_code == 0:
                copy_lua_files([lua_file], src_path, dst_path)
            else:
                print(f"Failed to create conda environment for {yaml_file}. Skipping copying of {lua_file}.")

    if args.readall:
        os.umask(original_umask)

if __name__ == "__main__":
    main()

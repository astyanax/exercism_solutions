def grep(pattern: str, flags: str, files: str):
    filenames_only = "-l" in flags
    multifiles     = len(files) > 1
    line_number    = "-n" in flags
    entire_line    = "-x" in flags
    negative_match = "-v" in flags
    ignore_case    = "-i" in flags

    newline = '\n'
    result = []

    for filename in files:
        with open(filename, "rt") as file:
            for linenum, line in enumerate(file, start=1):
                checked_line = line
                if ignore_case:
                    checked_line = line.lower()
                    pattern = pattern.lower()
                    
                if entire_line:
                    match = pattern == checked_line.rstrip("\n")
                else:
                    match = pattern in checked_line

                if bool(match) ^ negative_match: 
                    result.append(
                        f'{filename if multifiles or filenames_only else ""}'
                        f'{":" if multifiles and not filenames_only else ""}'
                        f'{linenum if line_number and not filenames_only else ""}'
                        f'{":" if line_number and not filenames_only else ""}'
                        f'{line if not filenames_only else newline}'
                    )
                    if filenames_only:
                        break

    return "".join(result)

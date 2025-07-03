def transpose(lines):
    rows = [row.replace(' ', '-') for row in lines.splitlines()]
    rows = [row.ljust(len(max(rows, key=len))) for row in rows]
    rows = [''.join(row) for row in zip(*rows)]
    rows = [row.rstrip().replace('-', ' ') for row in rows]
    return '\n'.join(rows)
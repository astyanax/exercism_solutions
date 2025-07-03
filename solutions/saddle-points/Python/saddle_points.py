def saddle_points(matrix):
    if any(len(row) != len(matrix[0]) for row in matrix):
        raise ValueError('irregular matrix')
    
    row_maxs = list(map(max, matrix))
    col_mins = list(map(min, list(zip(*matrix))))

    points = []
    for r, rm in enumerate(row_maxs):
        for c, cm in enumerate(col_mins):
            if rm == cm:
                points.append({'row': r+1, 'column': c+1})
    return points
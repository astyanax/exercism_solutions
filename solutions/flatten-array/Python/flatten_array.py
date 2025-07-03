def flatten(iterable):
    if not isinstance(iterable, (list, tuple)):
        return [iterable]
    return [elem for sublist in iterable for elem in flatten(sublist) if elem is not None]
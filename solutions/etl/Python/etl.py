def transform(legacy_data):
    return {d.lower(): n for n in legacy_data for d in legacy_data[n]}

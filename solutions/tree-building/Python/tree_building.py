"""Tree Building."""
from operator import attrgetter

class Record:
    def __init__(self, record_id, parent_id):
        self.record_id = record_id
        self.parent_id = parent_id
    
    def __repr__(self):
        return f"(ID: {record_id}, parent ID: {parent_id})"


class Node:
    def __init__(self, node_id):
        self.node_id = node_id
        self.children = []


def BuildTree(records: list):

    if not records:
        return None
    
    #records.sort(key=lambda x: x.record_id)
    records.sort(key=attrgetter('record_id'))

    if records[-1].record_id != len(records) - 1:
        raise ValueError('Record id is invalid or out of order.')
    if records[0].record_id != 0:
        raise ValueError('invalid')
    
    tree = []
    for record in records:
        if record.record_id == record.parent_id != 0:
            raise ValueError("Only root should have equal record and parent id.")
        if record.record_id < record.parent_id:
            raise ValueError("Node record_id should be smaller than it's parent_id.") # Typo in test case

        node = Node(record.record_id)
        tree.append(node)
        if record.record_id > 0:
            tree[record.parent_id].children.append(node)
        
    return tree[0]
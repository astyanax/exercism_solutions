#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list {

std::size_t List::size() const {
    return current_size;
}

void List::push(int entry) {
    auto t = new Element{entry};
    t->next = head;
    head = t;
    ++current_size;
}

int List::pop() {
    if (head == nullptr)
        throw std::runtime_error("Cannot pop from empty list.");
    auto element = head;
    head = head->next;
    int data = element->data;
    delete element;
    current_size--;
    return data;
}

void List::reverse() {
    Element* t = nullptr;
    while (head != nullptr) {
        auto temp = t;
        t = head;
        head = head->next;
        t->next = temp;
    }
    head = t;
}

List::~List() {
    while (head != nullptr) {
        Element* next = head->next;
        delete head;
        head = next;
    }
}

}
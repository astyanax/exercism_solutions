#include "list_ops.h"
#include <stdlib.h>
#include <string.h>

list_t* new_list(size_t length, list_element_t elements[]) {
  list_t* l = malloc(sizeof(list_t) + length * sizeof(list_element_t));
  l->length = length;
  memcpy((void *)l->elements, (const void *)elements, length * sizeof(list_element_t));
  return l;
}

list_t* append_list(list_t *left, list_t *right) {
  if (!left || !right) return NULL;
  int length = left->length + right->length;
  list_t* new = malloc(sizeof(list_t) + sizeof(list_element_t) * length);
  new->length = length;
  memcpy(new->elements, left->elements, left->length * sizeof(list_element_t));
  memcpy(new->elements + left->length, right->elements, right->length * sizeof(list_element_t));
  return new;
}

void delete_list(list_t *list) {
  if (!list) return;
  free(list);
}

list_t* filter_list(list_t *list, bool (*filter)(list_element_t)) {
  if (!list) return NULL;
  list_element_t* Elements = NULL;
  size_t NumAllocatedElements = 0;
  list_element_t* ListElements_p = list->elements;
  for (; list->length > 0; ListElements_p++, list->length--)
    if (filter(*ListElements_p)) {
      Elements = (list_element_t *)realloc( Elements, ++NumAllocatedElements * sizeof(list_element_t));
      Elements[NumAllocatedElements - 1] = *ListElements_p;
    }

  return new_list(NumAllocatedElements, Elements);
}

size_t length_list(list_t *list) {
  if (!list) return 0;
  return list->length;
}

list_t *map_list(list_t *list, list_element_t (*map)(list_element_t)) {
  if (!list) return NULL;
  list_t *l = new_list(list->length, list->elements);
  for (l->length = 0; l->length != list->length; l->length++)
    l->elements[l->length] = map(list->elements[l->length]);
  return l;
}

list_element_t foldl_list(list_t *list, list_element_t initial, list_element_t (*foldl)(list_element_t, list_element_t)) {
  if (!list) return -1;
  list_element_t acc = initial;
  for (size_t idx = 0; idx < list->length; idx++)
    acc = foldl(list->elements[idx], (idx == 0) ? initial : acc);
  return acc;
}

list_element_t foldr_list(list_t *list, list_element_t initial, list_element_t (*foldr)(list_element_t, list_element_t)) {
  list_t *l = reverse_list(list);
  return foldl_list(l, initial, foldr);
}

list_t *reverse_list(list_t *list) {
  if (!list) return NULL;
  list_t *l = malloc(sizeof(list_t) + list->length * sizeof(list_element_t));
  for (l->length = 0; l->length < list->length; l->length++)
    l->elements[l->length] = list->elements[list->length - l->length - 1];
  return l;
}
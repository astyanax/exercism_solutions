#include "linked_list.h"

struct list_node {
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list {
   struct list_node *first, *last;
};

struct list *list_create(void) {
   struct list *list = calloc(1, sizeof(struct list));
   return list;
}

size_t list_count(const struct list *list) {
   struct list_node *node = list->first;
   if (!node) return 0;
   size_t i = 1;
   while ((node = node->next)) i++;
   return i;
}

void list_push(struct list *list, ll_data_t item_data) {
   struct list_node *node = malloc(sizeof(struct list_node));
   node->data = item_data;
   node->next = NULL;
   node->prev = list->last;
   if (list->last) list->last->next = node;
   list->last = node;
   if (!list->first) list->first = node;
}

ll_data_t list_pop(struct list *list) {
   struct list_node *node = list->last;
   if (!node) return 0;
   list->last = node->prev;
   if (list->last) list->last->next = NULL;
   else list->first = NULL;
   ll_data_t data = node->data;
   free(node);
   return data;
}

void list_unshift(struct list *list, ll_data_t item_data) {
   struct list_node *node = malloc(sizeof(struct list_node));
   node->data = item_data;
   node->prev = NULL;
   node->next = list->first;
   if (list->first) list->first->prev = node;
   list->first = node;
   if (!list->last) list->last = node;
}

ll_data_t list_shift(struct list *list) {
   struct list_node *node = list->first;
   if (!node) return 0;
   list->first = node->next;
   if (list->first) list->first->prev = NULL;
   else list->last = NULL;
   ll_data_t data = node->data;
   free(node);
   return data;
}

void list_delete(struct list *list, ll_data_t data) {
   struct list_node *node = list->first;
   if (!node) return;
   do {
      if (node->data == data) {
         if (list->first == node) list->first = node->next;
         if (list->last == node) list->last = node->prev;
         if (node->prev) node->prev->next = node->next;
         if (node->next) node->next->prev = node->prev;
         free(node);
         return;
      }
   } while ((node = node->next));
}

void list_destroy(struct list *list) {
   struct list_node *node = list->first;
   while (node) {
      struct list_node *del = node;
      node = node->next;
      free(del);
   }
   free(list);
}
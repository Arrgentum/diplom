#ifndef RANGE_H_   /* Include guard */
#define RAHGE_H_

#include <unistd.h> 
#include <malloc.h>
#include <stdlib.h>
#include <stdio.h>
#include "data.h"

struct range{
	unsigned int begin;
	unsigned int end;
	unsigned int max;
	struct range *left;
	struct range *right;
	unsigned char height;
	char key;
};


struct range* small_left_rotation(struct range* head);

struct range* small_right_rotation(struct range* head);

struct range* big_left_rotation(struct range* head);

struct range* big_right_rotation(struct range* head);

void balanced_range_tree(struct range **head);

void add_in_range_tree(struct range **head, struct range *new_elem);

void insert_in_range_tree(struct range **head, struct data elem);

int find_in_range_tree(struct range *head, int number, char *key);

int search_in_range_tree(struct range *head, struct data info);

void delete_elem(struct range **head, struct range **new_elem);

void del_from_range_tree(struct range** head, struct range *elem);

void delete_from_range_tree(struct range** head, struct data elem);


#endif // RANGE_H_
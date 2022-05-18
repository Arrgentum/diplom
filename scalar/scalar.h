#ifndef SCALAR_H_   /* Include guard */
#define SCALAR_H_

#include <unistd.h> 
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <malloc.h>
#include "data.h"

struct scalar{
	struct scalar *left;
	struct scalar *right;
	unsigned char number;
	char key;
	char length;
};


void delete_scalar_tree(struct scalar **root);

void recourse_print_scalar_tree(struct scalar *tmp, int number, char length);

void print_scalar_tree(struct scalar *root);

struct scalar* create_scalar_top(unsigned char number, char key, char length);

struct scalar* build_scalar_top(struct data info, struct scalar *add_ver);

struct scalar* remake_scalar_tree(struct scalar *tmp);

unsigned char length_prefix_in_scalar_tree(struct scalar *tmp, struct data info, char *flag);

void break_top_scalar_tree(struct scalar **tmp, struct data info, char length, char bit);

void add_in_scalar_tree(struct scalar **head, struct data info);

void insert_in_scalar_tree(struct scalar **head, struct data info);

char search_in_scalar_tree(struct scalar *head, struct data info);

void del_from_scalar_tree(struct scalar **head, struct data info);

void delete_from_scalar_tree(struct scalar **head, struct data info);



#endif // SCALAR_H_
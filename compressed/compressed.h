#ifndef COMPRESSED_H_   /* Include guard */
#define COMPRESSED_H_


#include <unistd.h> 
#include <malloc.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "data.h"


struct compressed{
	struct compressed *left;
	struct compressed *right;
	unsigned int number;
	char key;
	char length;
};


void delete_compressed_tree(struct compressed **root);

void recourse_print_compressed_tree(struct compressed *tmp, int number, char length);

void print_tree(struct compressed *root);

struct compressed* create_compressed_top(unsigned int number, char key, char length);

struct compressed* build_top(struct data info, struct compressed *add_ver);

struct compressed* remake(struct compressed *tmp);

unsigned char length_prefix(struct compressed *tmp, struct data info, char *flag);

void break_top(struct compressed **tmp, struct data info, char length, char bit);

void add_in_compressed_tree(struct compressed **head, struct data info);

void insert_in_compressed_tree(struct compressed **head, struct data info);

char search_in_compressed_tree(struct compressed *head, struct data info);

void del_from_compressed_tree(struct compressed **head, struct data info);

void delete_from_compressed_tree(struct compressed **head, struct data info);



#endif // COMPRESSED_H_
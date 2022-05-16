#include <stdlib.h>
#include "compressed.h"



int find_numer_node(struct compressed *root){
	if (root){
		int left = 0, right = 0;
		if(root->left)
			left = find_numer_node(root->left);
		if (root->right)
			right = find_numer_node(root->right);
		return left + right + 1;
	} else {
		return 0;
	}

}


//удаления дерева 
void delete_tree(struct compressed **root)
{
	if(*root != NULL){
		delete_tree(&(*root)->left);
		delete_tree(&(*root)->right);
		free(*root);
	}
}


//функция выводит все значния дерева левым обходом
void recourse_print_compressed_tree(struct compressed *tmp, int number, char length)
{
	if(tmp){
		printf("node_number = %d , length = %d\n", tmp->number, tmp->length);
		number = number << tmp->length;
		number += tmp->number;
		length += tmp->length;
		if(tmp->key >= 0){
			printf("ip = %u, mask = %d, key =  %d\n", number << (32-length), length,tmp->key);
		}
		if(tmp->left){
			printf("left\n");
			recourse_print_compressed_tree(tmp->left, number, length);
		}
		if(tmp->right){
			printf("right\n");
			recourse_print_compressed_tree(tmp->right, number, length);
		}
	} 
}


void print_tree(struct compressed *root)
{
	printf("//////  start__print__tree_  ///////\n\n");
	recourse_print_compressed_tree(root, 0, 0);
	printf("//////  end__print__tree_  ///////\n\n\n");
}


//функция возвращает построенную вершину с заданными критериями
struct compressed* create_top(unsigned int number, char key, char length)
{
	struct compressed *new_top = malloc(sizeof(struct compressed));
	new_top->length = length;
	new_top->number = number;
	new_top->key = key;
	new_top->left = NULL;
	new_top->right = NULL;
	return new_top;
}

//функция строит череду из вершин
struct compressed* build_top(struct data info, struct compressed *add_ver)
{
	if(info.length + info.mask == 32)
		return NULL;
	unsigned int number = (info.length == 32) ? info.number : info.number & ((1 << info.length)-1);
	number = number >> (32 - info.mask);
	struct compressed *tmp = create_top(number, info.key, info.length + info.mask - 32);
	if(add_ver != NULL){
		tmp->left = add_ver->left;
		tmp->right = add_ver->right;
	}
	return tmp;
}


//функция переделывает вершину
struct compressed* remake(struct compressed *tmp)
{
	unsigned int number = 0;
	char key = -1 , length = 0;
	struct compressed* ver;
	while(tmp){
		number = number << tmp->length;
		number += tmp->number;
		length += tmp->length;
		ver = tmp;
		if(tmp->left && tmp->right)
			break;
		if(tmp->key != -1){
			key = tmp->key;
			break;
		}
		if(tmp->left)
			tmp = tmp->left;
		else
			tmp = tmp->right;
		free(ver);
	}
	struct data info = {number, key, length, 32};
	ver =  build_top(info, tmp);
	if(tmp)
		free(tmp);
	return ver;
}


//функция выводит длинну префикса и возвращает предыдущий бит 
unsigned char length_prefix(struct compressed *tmp, struct data info, char *flag)
{
	char shift, car, i = tmp->length;
	unsigned int number_search = info.number, number_node = tmp->number;
	if (info.length > tmp->length){
		number_search = number_search >> (info.length - tmp->length - 1);
		car = number_search & 1;
		number_search = number_search >> 1;
	}
	shift = 32 - info.length + tmp->length - info.mask;
	number_search = (info.length == 32) ? number_search : number_search & ((1 << tmp->length)-1);
	if(info.mask != 32 && shift > 0 ){
		number_search = number_search >> shift;
		number_node = number_node >> shift;
		i-=shift;
	}
	while(number_node != number_search){
		car = number_search & 1;
		number_search = number_search >> 1;
		number_node = number_node >> 1;
		i--;
	}
	*flag = car;
	return i;
}


//функция разбивает вершину и добавляемую вершину на 3 вершины - общую (родительскую) и 2 дочерних
void break_top(struct compressed **tmp, struct data info, char length, char bit)
{
	struct compressed *number_node = NULL, *any_node = NULL, *top_node = NULL; 
	unsigned int prefix = (*tmp)->number >> ((*tmp)->length - length);
	(*tmp)->number = (prefix << ((*tmp)->length - length)) ^ (*tmp)->number;
	(*tmp)->length -= length;
	if(info.length + info.mask != 32){
		top_node = create_top(prefix, -1, length);
		number_node = build_top(info, NULL);
	} else
		top_node = create_top(prefix, info.key, length);
	any_node = remake(*tmp);
	if (bit){
		top_node->left = any_node;
		top_node->right = number_node;
	} else {
		top_node->right = any_node;
		top_node->left = number_node;
	}
	*tmp = top_node;
}


//ищет места для добавления вершины в дерево
void add_in_compressed_tree(struct compressed **head, struct data info)
{
	char bit;
	if(!(*head)){
		*head = build_top(info, NULL);
		return;
	}
	unsigned char length = length_prefix(*head, info, &bit);
	info.length -= length;
	if(length == (*head)->length){
		if(32 - info.length == info.mask)
			(*head)->key = info.key;
		else if(bit)
			add_in_compressed_tree(&((*head)->right), info);
		else
			add_in_compressed_tree(&((*head)->left), info);
	} else {
		break_top(head, info, length, bit);
	}
}


//вставляет вершину в дерево
void insert_in_compressed_tree(struct compressed **head, struct data info)
{
	if ( info.mask >> 31 & 1){
		add_in_compressed_tree(&((*head)->right), info);
	} else {
		add_in_compressed_tree(&((*head)->left), info);
	}
}


//поиск элемента, возвращает 1, если нашел с длиной маски 32
char search_in_compressed_tree(struct compressed *head, struct data info)
{
	struct compressed *tmp;
	char bit, key = -1;
	if(info.number >> 31 & 1)
		tmp = head->right;
	else
		tmp = head->left;
	while(tmp){
		unsigned char length = length_prefix(tmp, info, &bit);
		if(length == tmp->length){ 
			info.length -= length;
			if(tmp->key != -1)
				key = tmp->key;
			if(bit)
				tmp = tmp->right;
			else
				tmp = tmp->left;
		} else 
			break;
	}
	return key;
}


//поиск элемента для удаления и удаление
void del_from_compressed_tree(struct compressed **head, struct data info)
{
	struct compressed *tmp = *head, *parent = *head, *grand = *head;
	char flag_parent, flag_grand, bit;
	while(tmp){
		unsigned char length = length_prefix(tmp, info, &bit);
		if(length != tmp->length)
			return;
		info.length -= length;
		if(info.mask == 32 - info.length)
			break;
		if(tmp->left && tmp->right){
			grand = parent;
			parent = tmp;
			flag_grand = flag_parent;
			flag_parent = bit;
		}
		if(tmp == *head)
			flag_parent = bit;
		if(bit)
			tmp = tmp->right;
		else
			tmp = tmp->left;
	}
	if(tmp->left || tmp->right){
		tmp->key = -1;
		*head = remake(parent);
		return;
	} else if(flag_parent) {
		delete_tree(&(parent->right));
		parent->right = NULL;
	} else {
		delete_tree(&(parent->left));
		parent->left = NULL;
	}
	if (tmp == parent)
		delete_tree(head);
	else if(parent == *head)
		*head = remake(*head);
	else if(flag_grand)
		grand->right = remake(grand->right);
	else
		grand->left = remake(grand->left);
}


void delete_from_compressed_tree(struct compressed **head, struct data info)
{
	if(info.number >> 31 & 1)
		del_from_compressed_tree(&((*head)->right), info);
	else
		del_from_compressed_tree(&((*head)->left), info);
}


static void display_mallinfo2(void)
{
   struct mallinfo mi;

   mi = mallinfo();

   printf("Total non-mmapped bytes (arena):       %lu\n", mi.arena);
   printf("# of free chunks (ordblks):            %lu\n", mi.ordblks);
   printf("# of free fastbin blocks (smblks):     %lu\n", mi.smblks);
   printf("# of mapped regions (hblks):           %lu\n", mi.hblks);
   printf("Bytes in mapped regions (hblkhd):      %lu\n", mi.hblkhd);
   printf("Max. total allocated space (usmblks):  %lu\n", mi.usmblks);
   printf("Free bytes held in fastbins (fsmblks): %lu\n", mi.fsmblks);
   printf("Total allocated space (uordblks):      %lu\n", mi.uordblks);
   printf("Total free space (fordblks):           %lu\n", mi.fordblks);
   printf("Topmost releasable block (keepcost):   %lu\n", mi.keepcost);
}


int main()
{
	unsigned int max_key = 0, mask_length = 32, delta = 1, line_number = 0;
	printf("Input line number\n");
	scanf("%d",&line_number);
	printf("Input max key\n");
	scanf("%d", &max_key);
	printf("Input mask length\n");
	scanf("%d", &mask_length);
	if (mask_length > 32){
		printf("wrong mask\n");
		return 0;
	}
	unsigned int min = 0, max = (1 << (32 - mask_length)) - 1;
	struct compressed *root = create_top(0,-1,0);
	struct data info = {0, 0, 32, 32};
	if (max - min > line_number)
		delta = ( max - min ) / line_number;
	else 
		line_number = max - min;

	for(int i = 0; i < line_number; i++){
		info.key = i % max_key;
		info.mask = 32 - rand() % (32 - mask_length);
		insert_in_compressed_tree(&root, info);
		info.number += delta;
	}
	return 0;
}
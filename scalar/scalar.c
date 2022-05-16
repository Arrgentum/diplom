#include <stdlib.h>
#include "scalar.h"



int find_numer_node(struct scalar *root){
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
void delete_tree(struct scalar **root)
{
	if(*root != NULL){
		delete_tree(&(*root)->left);
		delete_tree(&(*root)->right);
		free(*root);
	}
}

//функция выводит все значния дерева левым обходом
void recourse_print_tree(struct scalar *tmp, int number, char length)
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
			recourse_print_tree(tmp->left, number, length);
		}
		if(tmp->right){
			printf("right\n");
			recourse_print_tree(tmp->right, number, length);
		}
	} 
}

void print_tree(struct scalar *root)
{
	printf("//////  start__print__tree_  ///////\n\n");
	recourse_print_tree(root, 0, 0);
	printf("//////  end__print__tree_  ///////\n\n\n");
}




//функция возвращает построенную вершину с заданными критериями
struct scalar* create_top(unsigned char number, char key, char length)
{
	struct scalar *new_top = malloc(sizeof(struct scalar));
	new_top->length = length;
	new_top->number = number;
	new_top->key = key;
	new_top->left = NULL;
	new_top->right = NULL;
	return new_top;
}

//функция строит череду из вершин
struct scalar* build_top(struct data info, struct scalar *add_ver)
{
	if(info.length + info.mask == 32)
		return NULL;
	struct scalar *tmp;
	unsigned int number = info.number;
	unsigned char flag = 0, num;
	if(info.length + info.mask - 32 > 8) {
		number = number >> (info.length - 9);
		if(number & 1)
			flag = 1;
		number = number >> 1;
		num = number;
		tmp = create_top(num, -1, 8);
		info.length -= tmp->length;
		if(flag)
			tmp->right = build_top(info, add_ver);
		else
			tmp->left = build_top(info, add_ver);
	} else {
		num = info.number & ( (1 << info.length) - 1);
		num = num >> (32 - info.mask);
		tmp = create_top(num, info.key, info.length + info.mask - 32);
		if(add_ver != NULL){
			tmp->left = add_ver->left;
			tmp->right = add_ver->right;
		}
	}
	return tmp;
}


//функция переделывает вершину
struct scalar* remake(struct scalar *tmp)
{
	unsigned int number = 0;
	char key = -1 , length = 0;
	struct scalar* ver;
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
	ver = build_top(info, tmp);
	if(tmp)
		free(tmp);
	return ver;
}


//функция выводит длинну префикса и возвращает предыдущий бит 
unsigned char length_prefix(struct scalar *tmp, struct data info, char *flag)
{
	unsigned char number_node = tmp->number, car, number_search_2;
	char shift;
	unsigned int number_search = info.number, i = tmp->length;
	if (info.length > tmp->length){
		number_search = number_search >> (info.length - tmp->length - 1);
		car = number_search & 1;
		number_search = number_search >> 1;
	}
	printf("info.len = %d, tmp_len = %d, info.mask = %d, ", info.length, tmp->length, info.mask);
	shift = 32 - info.length + tmp->length - info.mask;
	printf("shift = %d ", shift);
	number_search_2 = number_search & ((1 << tmp->length) - 1); 
	if(info.mask != 32 && shift > 0 ){
		number_search_2 = number_search_2 >> shift;
		number_node = number_node >> shift;
		i-=shift;
	}
	printf("number_search_2 = %u, number_node = %u\n", number_search_2, number_node);
	while(number_node != number_search_2){
		car = number_search_2 & 1;
		number_search_2 = number_search_2 >> 1;
		number_node = number_node >> 1;
		i--;
	}
	*flag = car;
	return i;
}

//функция разбивает вершину и добавляемую вершину на 3 вершины - общую (родительскую) и 2 дочерних
void break_top(struct scalar **tmp, struct data info, char length, char bit)
{
	struct scalar *number_node = NULL, *any_node = NULL, *top_node = NULL; 
	unsigned char prefix = (*tmp)->number >> ((*tmp)->length - length);
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
void add_in_scalar_tree(struct scalar **head, struct data info)
{
	char bit;
	if(!(*head)){
		*head = build_top(info, NULL);
		return;
	}
	char length = length_prefix(*head, info, &bit);
	info.length -= length;
	if(length == (*head)->length){
		if(32 - info.length == info.mask)
			(*head)->key = info.key;
		else if(bit)
			add_in_scalar_tree(&((*head)->right), info);
		else
			add_in_scalar_tree(&((*head)->left), info);
	} else {
		break_top(head, info, length, bit);
	}
}


//вставляет вершину в дерево
void insert_in_scalar_tree(struct scalar **head, struct data info)
{
	if ( info.mask >> 31 & 1/*info.number & 2147483648*/){
		add_in_scalar_tree(&((*head)->right), info);
	} else {
		add_in_scalar_tree(&((*head)->left), info);
	}
}

//поиск элемента, возвращает 1, если нашел с длиной маски 32, 2, если нашел в диапазоне, 0 - если не нашел
char search_in_scalar_tree(struct scalar *head, struct data info)
{
	struct scalar *tmp;
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
void del_from_scalar_tree(struct scalar **head, struct data info)
{
	struct scalar *tmp = *head, *parent = *head, *grand = *head;
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
	if(parent == *head)
		*head = remake(*head);
	else if(flag_grand)
		grand->right = remake(grand->right);
	else
		grand->left = remake(grand->left);
}


void delete_from_scalar_tree(struct scalar **head, struct data info)
{
	if(info.number >> 31 & 1)
		del_from_scalar_tree(&((*head)->right), info);
	else
		del_from_scalar_tree(&((*head)->left), info);
}


static void display_mallinfo2(void)
{
   struct mallinfo mi;

   mi = mallinfo();

   printf("Total non-mmapped bytes (arena):       %u\n", mi.arena);
   printf("# of free chunks (ordblks):            %u\n", mi.ordblks);
   printf("# of free fastbin blocks (smblks):     %u\n", mi.smblks);
   printf("# of mapped regions (hblks):           %u\n", mi.hblks);
   printf("Bytes in mapped regions (hblkhd):      %u\n", mi.hblkhd);
   printf("Max. total allocated space (usmblks):  %u\n", mi.usmblks);
   printf("Free bytes held in fastbins (fsmblks): %u\n", mi.fsmblks);
   printf("Total allocated space (uordblks):      %u\n", mi.uordblks);
   printf("Total free space (fordblks):           %u\n", mi.fordblks);
   printf("Topmost releasable block (keepcost):   %u\n", mi.keepcost);
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
	struct scalar *root = create_top(0,-1,0);
	struct data info = {0, 0, 32, 32};
	if (max - min > line_number)
		delta = ( max - min ) / line_number;
	else 
		line_number = max - min;
	for(int i = 0; i < line_number; i++){
		info.key = i % max_key;
		info.mask = 32 - rand() % (32 - mask_length);
		insert_in_scalar_tree(&root, info);
		info.number += delta;
	}
	return 0;
}
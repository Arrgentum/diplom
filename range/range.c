#include"range.h"


int find_numer_node(struct range *root){
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


void print_tree(struct range *root)
{
	if (root){
		printf("low = %u, large = %u, max = %u, height = %u, key = %u\n", root->begin, root->end, root->max, root->height, root->key);
		if (root->left){
			printf("left\n");
			print_tree(root->left);
		}
		if (root->right){
			printf("right\n");
			print_tree(root->right);
		}
	}
}


//удаления дерева 
void delete_tree(struct range **root)
{
	if(*root != NULL){
		delete_tree(&(*root)->left);
		delete_tree(&(*root)->right);
		free(*root);
	}
}

//создание одной вершины
struct range* create_top(int number1, int number2, char key)
{
	struct range *top = malloc(sizeof(struct range));
	top->begin = number1;
	top->end = number2;
	top->key = key;
	top->max = number2;
	top->height = 1;
	top->left = NULL;
	top->right = NULL;
	return top;
}


void fixmax(struct range **head)
{
	if (!(*head))
		return;
	struct range *tmp = *head;
	if( tmp->right && tmp->left ){
		if(tmp->right->max > tmp->left->max && tmp->right->max > tmp->end)
			(*head)->max = tmp->right->max;
		else if (tmp->left->max >= tmp->right->max && tmp->left->max > tmp->end)
			(*head)->max = tmp->left->max;
		else 
			(*head)->max = tmp->end;
	} else if ( tmp->right ){
		if ( tmp->right->max > tmp->end)
			(*head)->max = tmp->right->max;
		else
			(*head)->max = tmp->end;
	} else if ( tmp->left ){
		if ( tmp->left->max > tmp->end)
			(*head)->max = tmp->left->max;
		else 
			(*head)->max = tmp->end;
	} else 
		(*head)->max = tmp->end;
}

void fixheight(struct range **head)
{
	if (!(*head))
		return;
	if((*head)->left)
		if((*head)->right)
			if((*head)->left->height > (*head)->right->height)
				(*head)->height = (*head)->left->height + 1;
			else 
				(*head)->height = (*head)->right->height + 1;
		else
			(*head)->height = (*head)->left->height + 1;
	else if ((*head)->right)
		(*head)->height = (*head)->right->height + 1;
	else
		(*head)->height = 1; 
}

struct range* small_left_rotation(struct range* head)
{
	printf("small_left_rotation\n");
	struct range* new_head = head->right;
	head->right = new_head->left;
	new_head->left = head;
	fixheight(&(new_head->left));
	fixmax(&(new_head->left));
	fixheight(&new_head);
	fixmax(&new_head);
	return new_head;
}

struct range* small_right_rotation(struct range* head)
{
	printf("small_right_rotation\n");
	struct range *new_head = head->left;
	head->left = new_head->right;
	new_head->right = head;
	fixheight(&(new_head->right));
	fixmax(&(new_head->right));
	fixheight(&new_head);
	fixmax(&new_head);
	return new_head;
}

struct range* big_left_rotation(struct range* head)
{
	printf("big_left_rotation\n");
	head->right = small_right_rotation(head->right);
	head = small_left_rotation(head);
	return head;
}

struct range* big_right_rotation(struct range* head)
{
	printf("big_right_rotation\n");
	head->left = small_left_rotation(head->left);
	head = small_right_rotation(head);
	return head;
}


void balanced_range_tree(struct range **head)
{
	struct range *tmp = *head;
	if (  (tmp->right && tmp->left && tmp->left->height - tmp->right->height == 2)  ||  (!tmp->right && tmp->left && tmp->left->height >= 2)){
		if ((tmp->left->right && tmp->left->left && tmp->left->left->height > tmp->left->right->height)  ||  (tmp->left->left && !tmp->left->right))
			*head = small_right_rotation(*head);
		else
			*head = big_right_rotation(*head);
	}
	if (  (tmp->right && tmp->left && tmp->right->height - tmp->left->height == 2)  ||  (!tmp->left && tmp->right && tmp->right->height >= 2) ) {
		if ( (tmp->right->left && tmp->right->right && tmp->right->right->height > tmp->right->left->height)  ||  (tmp->right->right && !tmp->right->left) )
			*head = small_left_rotation(*head);
		else
			*head = big_left_rotation(*head);
	}
}	

void add_in_range_tree(struct range **head, struct range *new_elem)
{
	if (*head == NULL){
		*head = new_elem;
		return;
	}
	if ((*head)->begin == new_elem->begin && (*head)->end == new_elem->end)
		return;
	if ((*head)->begin > new_elem->begin)
		add_in_range_tree(&((*head)->left), new_elem);
	else 
		add_in_range_tree( &((*head)->right), new_elem);

	fixheight(head);
	fixmax(head);
	balanced_range_tree(head);
}

void insert_in_range_tree(struct range **head, struct data info)
{
	unsigned int number1 = info.number, number2;
	char shift = 32 - info.mask;
	number1 = info.number >> shift;
	number2 = number1 + 1;
	number1 = number1 << shift;
	number2 = (number2 << shift) - 1;
	struct range *insert_top = create_top(number1, number2, info.key);
	add_in_range_tree(head, insert_top);
}


int find_in_range_tree(struct range *head, int number, char *key)
{
	int len1 = -1, len2 = -1, len = -1;
	char key1 = -1, key2 = -1;
	if (!head)
		return -1;
	if (head->left && (head)->left->max >= number)
		len2 = find_in_range_tree( ((head)->left), number, &key2);
	if (head->right && ((head)->begin <= number || ( (head)->left && (head)->left->max <= number) ) )
		len1 = find_in_range_tree( ((head)->right), number, &key1);
	len = ( ((head)->begin <= number) && ((head)->end >= number) ) ? (head)->end - (head)->begin : -1;

	if (len >= 0){
		*key = ((len2>=0) && (len2<len)) ? ((len1>0) && (len1<len2)) ?  key1  :  key2  :  ((len1>=0) && (len1<len))  ?  key1  :  (head)->key;
		return ((len2>=0) && (len2<len)) ? ((len1>0) && (len1<len2)) ?  len1  :  len2  :  ((len1>=0) && (len1<len))  ?  len1  :  len;
	} else if (len1 >= 0){
		*key = ((len2>=0) && (len2<len1))  ?  key2  :  key1;
		return ((len2>=0) && (len2<len1))  ?  len2  :  len1;
	} else if (len2 >= 0){
		*key = key2;
		return len2;
	} else
		return -1;
}


int search_in_range_tree(struct range *head, struct data info)
{
	char key = -1;
	find_in_range_tree(head, info.number, &key);
	if (key >= 0)
		return key;
	return -1;
}


void delete_elem(struct range **head, struct range **new_head)
{
	if (!(*head)->left){
		*new_head = *head;
		*head = (*head)->right;
		return; 
	}
	delete_elem(&((*head)->left), new_head);  
	fixheight(head);
	fixmax(head);
	balanced_range_tree(head);
}


void delete_from_range_tree(struct range** head, struct data info)
{
	char shift = 32 - info.mask;
	unsigned int number1 = info.number >> shift, number2;
	number2 = ( (1 + number1) >> shift) - 1;
	number1 = number1 << shift;
	if (!(*head))
		return;
	if ((*head)->begin == number1 && (*head)->end == number2){
		struct range *new_head = NULL;
		if ((*head)->right){
			delete_elem(&((*head)->right), &new_head);
			new_head->left = (*head)->left;
			new_head->right = (*head)->right;
		} else if ((*head)->left)
			new_head = (*head)->left;
		free(*head);
		*head = new_head;
		fixheight(head);
		fixmax(head);
		return;
	} 
	if ((*head)->begin < number1)
		delete_from_range_tree( &((*head)->right), info);
	else 	
		delete_from_range_tree( &((*head)->left), info);

	fixheight(head);
	fixmax(head);
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
	struct range *root = NULL;
	struct data info = {0, 0, 32, 32};
	if (max - min > line_number)
		delta = ( max - min ) / line_number;
	else 
		line_number = max - min;
	for(int i = 0; i < line_number; i++){
		info.key = i % max_key;
		info.mask = 32 - rand() % (32 - mask_length);
		insert_in_range_tree(&root, info);
		info.number += delta;
	}
	return 0;
}
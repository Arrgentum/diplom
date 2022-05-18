#ifndef TOP_H_   /* Include guard */
#define TOP_H_


struct top32{
	unsigned int number;
	char key;
	unsigned char mask;
};

struct top128{
	unsigned long long int number;
	char key;
	unsigned char mask;
};


#endif // TOP_H_
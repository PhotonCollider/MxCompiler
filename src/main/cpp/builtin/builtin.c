#define bool _Bool

typedef unsigned size_t;

int printf(const char* __restrict__ __format, ...);
int scanf(const char* __restrict__ __format, ...);
int sprintf(char* __restrict__ __s, const char* __restrict__ __format, ...);
int sscanf(const char* __restrict__ __s, const char* __restrict__ __format, ...);

void* malloc(size_t __size);
void* memcpy(void* __restrict__ __dest, const void* __restrict__ __src, size_t __n);
size_t strlen(const char* __s);
int strcmp(const char* __s1, const char* __s2);
char* strcpy(char* __restrict__ __dest, const char* __restrict__ __src);
void* calloc(size_t __nmemb, size_t __size);

// declare void @print(ptr)
void print(const char* str) {
    printf("%s", str);
}

// declare void @println(ptr)
void println(const char* str) {
    printf("%s\n", str);
}

// declare void @printInt(i32)
void printInt(int x) {
    printf("%d", x);
}

// declare void @printlnInt(i32)
void printlnInt(int x) {
    printf("%d\n", x);
}

// declare ptr @getString()
char* getString() {
    char* str = malloc(1 << 10);
    scanf("%s", str);
    return str;
}

// declare i32 @getInt()
int getInt() {
    int ret;
    scanf("%d", &ret);
    return ret;
}

// declare ptr @toString(i32)
char* toString(int x) {
    char* ret = malloc(12);
    sprintf(ret, "%d", x);
    return ret;
}

// declare ptr @array.copy(ptr, i32)
void* array_copy(const size_t* arr, size_t dim) {
    if (arr == (size_t*)0) { // null ptr
        return (void*)0;
    }
    size_t array_size = arr[-1];
    size_t* ret = malloc(array_size * 4 + 4);
    ret++; // move forward for ret[-1]
    if (dim == 1) {
        memcpy(ret - 1, arr - 1, array_size * 4 + 4);
        return ret;
    }
    ret[-1] = array_size;
    for (size_t i = 0; i < array_size; i++) {
        if (dim == 1) {
            ret[i] = arr[i];
        } else {
            ret[i] = (size_t)array_copy((size_t*)arr[i], dim - 1);
        }
    }
    return ret;
}

// declare i32 @array.size(ptr)
int array_size(const size_t* ptr) {
    return ptr[-1];
}

// declare i32 @string.length(ptr)
int string_length(const char* ptr) {
    return strlen(ptr);
}

// declare i32 @string.ord(ptr, i32)
int string_ord(const char* str, int x) {
    return (int)str[x];
}

// declare i32 @string.parseInt(ptr)
int string_parseInt(const char* str) {
    int x;
    sscanf(str, "%d", &x);
    return x;
}

// declare ptr @string.substring(ptr, i32, i32)
const char* string_substring(const char* str, int left, int right) {
    int len = right - left;
    char* ret = malloc(len + 1);
    memcpy(ret, str + left, len);
    ret[len] = '\0';
    return ret;
}

// declare ptr @builtin.bool_to_string(i1)
const char* builtin_bool_to_string(bool x) {
    if (x) {
        return "true";
    } else {
        return "false";
    }
}

// declare ptr @builtin.calloc(i32)
void* builtin_calloc(int x) {
    return calloc(x, 1);
}

// declare ptr @builtin.calloc_array(i32, i32)
void* builtin_calloc_array(int type_size, int array_len) {
    size_t* ret = calloc(array_len * type_size + 4, 1);
    ret[0] = array_len;
    return ret + 1;
}

// declare ptr @builtin.malloc(i32)
void* builtin_malloc(int x) {
    return malloc(x);
}

// declare ptr @builtin.malloc_array(i32, i32)
void* builtin_malloc_array(int type_size, int array_len) {
    size_t* ret = malloc(array_len * type_size + 4);
    ret[0] = array_len;
    return ret + 1;
}

// declare ptr @builtin.string_add(ptr, ptr)
const char* builtin_string_add(const char* str1, const char* str2) {
    size_t sum_size = strlen(str1) + strlen(str2) + 1;
    char* ret = malloc(sum_size);
    strcpy(ret, str1);
    strcpy(ret + strlen(str1), str2);
    return ret;
}

// declare i1 @builtin.string_eq(ptr, ptr)
bool builtin_string_eq(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) == 0;
}

// declare i1 @builtin.string_ge(ptr, ptr)
bool builtin_string_ge(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) > 0;
}

// declare i1 @builtin.string_geq(ptr, ptr)
bool builtin_string_geq(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) >= 0;
}

// declare i1 @builtin.string_le(ptr, ptr)
bool builtin_string_le(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) < 0;
}

// declare i1 @builtin.string_leq(ptr, ptr)
bool builtin_string_leq(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) <= 0;
}

// declare i1 @builtin.string_ne(ptr, ptr)
bool builtin_string_ne(const char* lhs, const char* rhs) {
    return strcmp(lhs, rhs) != 0;
}
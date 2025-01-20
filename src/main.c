// File: main.c

// // Function to write a character to the standard output
// void putchar(char c) {
//     // Implementation specific to your target platform
//     // ...
// }

// Entry point of the program
void _start() {
    const char* message = "Hello, World!\n";

    // Loop through the message and print each character
    for (int i = 0; message[i] != '\0'; ++i) {
        //putchar(message[i]);
    }

    // Terminate the program
    asm("movl $0, %ebx; movl $1, %eax; int $0x80");
}

// #include <unistd.h>

// int main() {
//     write(1, "Hello World", 11); 
//     return 0;
// }

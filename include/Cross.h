#ifndef CROSS_H
#define CROSS_H

// File system
typedef struct {
    int createIntermediaryDirectories; // Use int for compatibility with C
} FileSystemCreateDirectoryOptions;

void file_system_create_directory(const char* path, FileSystemCreateDirectoryOptions options);

#endif // CROSS_H

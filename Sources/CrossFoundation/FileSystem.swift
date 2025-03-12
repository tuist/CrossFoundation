@_implementationOnly import Cross
import Path

public struct FileSystem {
    
    public init() {}
    
    public struct CreateDirectoryOptions {
        let createIntermediaryDirectories: Bool
        
        public static func `default`() -> Self {
            return Self(createIntermediaryDirectories: true)
        }
    }
    
    public func createDirectory(at path: AbsolutePath,
                                options: CreateDirectoryOptions = .default())  {
        let pathString = path.pathString
        let options = FileSystemCreateDirectoryOptions(createIntermediaryDirectories: options.createIntermediaryDirectories ? 1 : 0)
        pathString.withCString { path in
            Cross.file_system_create_directory(path, options)
        }
    }
}

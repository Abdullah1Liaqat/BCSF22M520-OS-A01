# Project Report: Multi-File, Static, Dynamic Libraries and Man Pages

## Feature 2–5 Questions and Answers

---

### 1. Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?

The linking rule `$(TARGET): $(OBJECTS)` tells the compiler to create the executable from the specified object files. The target executable depends directly on the object files, and the compiler links them together. When linking against a library, instead of individual object files, the executable depends on the library file. The linker uses the library to resolve symbols, often specifying the library location with `-L` and the library name with `-l`.

---

### 2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?

A git tag is a pointer to a specific commit, usually marking a stable release. It helps track versions and makes it easy to identify milestones. A simple tag is just a name pointing to a commit, while an annotated tag contains additional information such as the author, date, and a descriptive message.

---

### 3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

Creating a Release on GitHub allows me to formally publish a version of the project. Attaching binaries means users can run the program without compiling it from source. It ensures that anyone using the release gets the exact working version that I tested.

---

### 4. Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?

In Part 2, all source files were compiled together into one executable. Object files were listed individually and there was no library abstraction. In Part 3, I created a static library `libmyutils.a` to hold utility functions, and the executable linked against this library. This made the project more modular. The key differences are the addition of variables for the static library and object files, and using `ar` to create the library instead of linking object files directly.

---

### 5. What is Position-Independent Code (-fPIC) and why is it a fundamental requirement for creating shared libraries?

Position-Independent Code generates machine code that can execute correctly regardless of where it is loaded in memory. This is essential for shared libraries because the operating system can load them at different addresses in memory for different programs. Without `-fPIC`, the shared library might not work when loaded dynamically.

---

### 6. Explain the difference in file size between your static and dynamic clients. Why does this difference exist?

The static client includes all the code from the library inside the executable, which makes it larger. The dynamic client does not include library code; it is loaded at runtime from the shared library, so the executable size is smaller.

---

### 7. What is the LD_LIBRARY_PATH environment variable? Why was it necessary to set it for your program to run, and what does this tell you about the responsibilities of the operating system's dynamic loader?

`LD_LIBRARY_PATH` tells the system where to look for shared libraries at runtime. I had to set it because my dynamic library was in a custom directory and not in a standard system path. This shows that the dynamic loader is responsible for finding and loading shared libraries, and it uses this environment variable to locate libraries that are not in default paths.

---

### 8. What is the purpose of the ar command? Why is ranlib often used immediately after it?

The `ar` command creates a static library by bundling object files together. `ranlib` updates the library index so the linker can efficiently find symbols in the static library. Using `ranlib` after `ar` ensures the library is ready for linking.

---

### 9. When you run nm on your client_static executable, are the symbols for functions like mystrlen present? What does this tell you about how static linking works?

Yes, symbols like `mystrlen` are present in the static executable. This means that all the library code was included in the final binary. Static linking copies the code from the library into the executable, so the functions are fully embedded and available in the executable itself.

---

**End of Report**

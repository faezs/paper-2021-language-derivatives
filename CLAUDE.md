# Language Derivatives Project Guide

## Build Commands
- `make`: Build the project (compiles Agda, typesets paper and talk)
- `make test`: Show dependencies (basic test)
- `make clean`: Remove build artifacts
- `agda -i . --latex --latex-dir=latex <file>.lagda`: Compile single Agda file
- `make code.zip`: Package code files
- `make paper.zip`: Package paper files
- `make tags`: Generate etags

## Environment
- Agda 2.6.1.3 with agda-stdlib 1.5
- Uses XeLaTeX for document generation

## Code Style Guidelines
- Use literate Agda (.lagda) for modules with documentation
- Regular Agda (.agda) for implementation modules
- Organize code hierarchically with domain-specific modules
- Follow standard Agda naming conventions:
  - CamelCase for types and modules
  - camelCase for functions and variables
- Keep proofs separate from implementation when possible
- Document complex functions with comments explaining intention
- Use unicode symbols for mathematical notation as appropriate
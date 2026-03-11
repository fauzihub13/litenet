Create unit tests for all repository implementations in this Flutter Clean Architecture project.

Repository implementations are located in:

features/**/data/repositories/

Requirements:

1. Test repository methods
2. Mock the datasource layer
3. Test:
   - successful response
   - exception handling
   - mapping from model to entity

Testing stack:

- flutter_test
- mocktail

Test structure:

test/
  features/
    feature_name/
      data/
        repositories/
          repository_impl_test.dart

Each test should verify that:

- datasource method is called
- mapper is applied
- correct entity is returned
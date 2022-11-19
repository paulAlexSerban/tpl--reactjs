# CI/CD Workflow

```mermaid
graph LR
  feat1[Feature 1] --> pr[Pull Request]
  pr --> rw_dev[[1. Run DEVELOP Workflow]]
  rw_dev --> ok{OK?}
  ok --> |yes| M(Merge)
  ok --> |no| error
  M --> DEV[Develop]
  DEV --> rw_build[[2. Run BUILD Workflow]]
```
## 1. Run DEVELOPMENT Workflow
```mermaid
graph LR
  install[Install Dependencies] --> check_formats[Check code formats]
  check_formats --> formats
  formats{Is formatting ok?}
  formats --> |YES| auto_tests[Run automated tests]
  formats --> |NO| error
  auto_tests --> tests{Are tests ok?}
  tests --> |YES| coverage
  tests --> |NO| error
  auto_tests --> coverage[Upload code coverage as an artefact]
  coverage --> cache[Cache dependencies]
```
  - install dependencies
  - check code formatting
  - run automated tests
  - upload code coverage as an artifact
  - cache dependencies

## 2. Run BUILD Workflow
```mermaid
graph LR
  install[Install Dependencies] --> check_formats[Check code formats]
  check_formats --> formats
  formats{Is formatting ok?}
  formats --> |YES| auto_tests[Run automated tests]
  formats --> |NO| error
  auto_tests --> tests{Are tests ok?}
  tests --> |YES| coverage[Upload code coverage as an artefact]
  tests --> |NO| error
  coverage --> build[Build Project]
  build --> deploy[Deploy to DEVELOP server]
  deploy --> cache[Cache dependencies]
```
  - install dependencies
  - check code formatting
  - run automated tests
  - upload code coverage as an artifact
  - build project
  - upload build as an artifact
  - deploy to DEVELOP server
  - cache dependencies
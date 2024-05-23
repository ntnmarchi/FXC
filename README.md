*.tfvars would not normally be checked in, but since this is running locally while normally I'd run the terraform configs in a pipeline, I've removed tfvars files from the .gitignore for you guys to check it and also be able to run the config.

In real production code I would have moved the sg into the networking module, howver, given the nature of this assignment, it felt unnecessary hence I am just mentioning it.

Also, the assignment didn't mention documentation. This is something I would add to a production PR. 
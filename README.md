# .NET Core 3.1 docker-aws-poc example

```sh
# Will place the compiled code in container
docker build -t mylambda .

# Then you can run using that container with specified function
docker run --rm mylambda test::test.Function::FunctionHandler '{"some": "event"}'
```

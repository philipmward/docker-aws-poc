FROM lambci/lambda:build-dotnetcore3.1 as builder

ENV AWS_DEFAULT_REGION us-west-2

COPY . .

RUN dotnet publish -c Release -o pub

FROM lambci/lambda:dotnetcore3.1

COPY --from=builder /var/task/pub /var/task

ENTRYPOINT ["/var/rapid/init", "--bootstrap", "/var/runtime/bootstrap", "--enable-msg-logs"]
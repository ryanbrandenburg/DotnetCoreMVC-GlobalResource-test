FROM microsoft/dotnet:2.1.401-sdk-alpine  as publishImage
WORKDIR /app 
COPY . .
RUN dotnet restore 
RUN  dotnet publish  -c Release -o Publish 

FROM microsoft/dotnet:2.1.3-aspnetcore-runtime as execImage
ARG arg
ENV ASPNETCORE_ENVIRONMENT=${arg}
COPY --from=publishImage /app/Publish/. .
ENTRYPOINT ["dotnet", "mvctest.dll"]

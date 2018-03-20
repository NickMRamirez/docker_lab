FROM microsoft/aspnetcore-build:latest AS build
WORKDIR /src
COPY . .
RUN dotnet clean
RUN dotnet restore
RUN dotnet build --configuration Release
RUN dotnet publish --configuration Release -o /output

FROM microsoft/aspnetcore:latest
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
WORKDIR /app
COPY --from=build /output .
ENTRYPOINT ["dotnet", "4_dotnet_app.dll"]
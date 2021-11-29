FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY HelloworldApplication/*.csproj ./HelloworldApplication/
RUN dotnet restore

# copy everything else and build app
COPY HelloworldApplication/. ./HelloworldApplication/
WORKDIR /source/HelloworldApplication
RUN dotnet publish -c release -o publish

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /publish
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
COPY --from=build /source/HelloworldApplication/publish ./
ENTRYPOINT ["dotnet", "HelloworldApplication.dll"]
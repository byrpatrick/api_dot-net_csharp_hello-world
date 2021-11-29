build:
	@docker build --rm -t auth0/api/dotnet-csharp/rbac-authorization .

run: build
	@docker run --rm -it -p "6060:80" auth0/api/dotnet-csharp/rbac-authorization
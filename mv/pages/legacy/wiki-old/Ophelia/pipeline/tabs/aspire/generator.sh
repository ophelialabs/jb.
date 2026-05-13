read -p "Enter your project name: " project_name
if [ -z "$project_name" ]; then
    echo "Project name cannot be empty."
    exit 1
fi

mkdir "$project_name"
cd "$project_name"
dotnet new sln -n "$project_name"

echo "Which project types do you want to add?"
echo "1) Web App"
echo "2) API"
echo "3) gRPC Service"
echo "4) Auth Service"
echo "5) Account Service"
read -p "Enter numbers separated by space (e.g. 1 2 3): " types

for type in $types; do
    case $type in
        1)
            dotnet new mvc -n "$project_name.Web" -o src/"$project_name.Web"
            dotnet sln add src/"$project_name.Web"/"$project_name.Web".csproj
            ;;
        2)
            dotnet new webapi -n "$project_name.Api" -o src/"$project_name.Api"
            dotnet sln add src/"$project_name.Api"/"$project_name.Api".csproj
            ;;
        3)
            dotnet new grpc -n "$project_name.Grpc" -o src/"$project_name.Grpc"
            dotnet sln add src/"$project_name.Grpc"/"$project_name.Grpc".csproj
            ;;
        4)
            dotnet new webapi -n "$project_name.Auth" -o src/"$project_name.Auth"
            dotnet sln add src/"$project_name.Auth"/"$project_name.Auth".csproj
            ;;
        5)
            dotnet new webapi -n "$project_name.Account" -o src/"$project_name.Account"
            dotnet sln add src/"$project_name.Account"/"$project_name.Account".csproj
            ;;
    esac
done

dotnet new classlib -n "$project_name.Shared" -o src/"$project_name.Shared"
dotnet sln add src/"$project_name.Shared"/"$project_name.Shared".csproj

echo "Which database(s) would you like to add?"
echo "1) SQL Server - enterprise, relational"
echo "2) PostgreSQL - open-source, advanced relational"
echo "3) SQLite - lightweight, file-based"
read -p "Enter numbers separated by space (e.g. 1 2): " dbs

for db in $dbs; do
    case $db in
        1)
            dotnet new classlib -n "$project_name.Database.SqlServer" -o src/"$project_name.Database.SqlServer"
            dotnet sln add src/"$project_name.Database.SqlServer"/"$project_name.Database.SqlServer".csproj
            ;;
        2)
            dotnet new classlib -n "$project_name.Database.Postgres" -o src/"$project_name.Database.Postgres"
            dotnet sln add src/"$project_name.Database.Postgres"/"$project_name.Database.Postgres".csproj
            ;;
        3)
            dotnet new classlib -n "$project_name.Database.Sqlite" -o src/"$project_name.Database.Sqlite"
            dotnet sln add src/"$project_name.Database.Sqlite"/"$project_name.Database.Sqlite".csproj
            ;;
    esac
done

mkdir tests                        
dotnet new xunit -n "$project_name.Tests" -o tests/"$project_name.Tests"
dotnet sln add tests/"$project_name.Tests"/"$project_name.Tests".csproj                        

mkdir docker
touch docker/docker-compose.yml
touch docker/Dockerfile.web
touch docker/Dockerfile.api
touch docker/Dockerfile.grpc
touch docker/Dockerfile.auth
touch docker/Dockerfile.account
touch docker/Dockerfile.database

cat > .gitignore << EOF
bin/
obj/
.vs/
.env
docker/*.log
EOF

cat > README.md << EOF
# $project_name
